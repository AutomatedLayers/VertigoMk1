#!/usr/bin/env bash
# =============================================================================
# Klipper Stack Installer for Raspberry Pi CM4 — Debian Trixie (13)
# Installs: Kalico (Klipper fork), Moonraker, Mainsail, Crowsnest
#
# Usage:
#   chmod +x vertigo_setup.sh
#   ./vertigo_setup.sh
#
# Run as a normal user (NOT root). The script will sudo when needed.
# =============================================================================

set -euo pipefail

# ── Colors ────────────────────────────────────────────────────────────────────
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
CYAN='\033[0;36m'; BOLD='\033[1m'; RESET='\033[0m'

info()    { echo -e "${CYAN}[INFO]${RESET}  $*"; }
success() { echo -e "${GREEN}[OK]${RESET}    $*"; }
warn()    { echo -e "${YELLOW}[WARN]${RESET}  $*"; }
die()     { echo -e "${RED}[ERROR]${RESET} $*" >&2; exit 1; }

# ── Config ────────────────────────────────────────────────────────────────────
KLIPPER_USER="${SUDO_USER:-$(whoami)}"
HOME_DIR="/home/${KLIPPER_USER}"
KLIPPER_DIR="${HOME_DIR}/klipper"
KLIPPY_ENV="${HOME_DIR}/klippy-env"
MOONRAKER_DIR="${HOME_DIR}/moonraker"
MOONRAKER_ENV="${HOME_DIR}/moonraker-env"
MAINSAIL_DIR="/var/www/mainsail"
CROWSNEST_DIR="${HOME_DIR}/crowsnest"
KATAPULT_DIR="${HOME_DIR}/katapult"
PRINTER_DATA="${HOME_DIR}/printer_data"
CONFIG_DIR="${PRINTER_DATA}/config"
LOG_DIR="${PRINTER_DATA}/logs"
DB_DIR="${PRINTER_DATA}/database"

# ── Pre-flight checks ─────────────────────────────────────────────────────────
[[ "$(id -u)" -eq 0 ]] && die "Do NOT run this script as root. Run as your regular user."
command -v sudo >/dev/null || die "sudo is required but not installed."

echo -e "\n${BOLD}======================================================${RESET}"
echo -e "${BOLD}  Klipper Stack Installer — Debian Trixie / CM4${RESET}"
echo -e "${BOLD}======================================================${RESET}\n"
info "Installing for user: ${KLIPPER_USER}"
info "Home directory:      ${HOME_DIR}"
echo ""

# ── Helper: run as the target user ───────────────────────────────────────────
run_as_user() { sudo -u "${KLIPPER_USER}" bash -c "$*"; }

# ── 1. Python serial dependency ───────────────────────────────────────────────
info "Installing python3-serial…"
sudo apt install python3-serial -y
success "python3-serial installed."

# ── 2. Enable and start systemd-networkd ──────────────────────────────────────
info "Unmasking systemd-networkd…"
sudo systemctl unmask systemd-networkd 2>/dev/null || true

info "Enabling systemd-networkd…"
sudo systemctl enable systemd-networkd

info "Starting systemd-networkd…"
sudo systemctl start systemd-networkd
success "systemd-networkd enabled and started."

info "Checking systemd-networkd status…"
systemctl | grep systemd-networkd

# ── 3. Disable systemd-networkd-wait-online (prevents ~2min boot delay) ───────
info "Disabling systemd-networkd-wait-online (avoids ~2 min boot delay)…"
sudo systemctl disable systemd-networkd-wait-online.service
success "systemd-networkd-wait-online disabled."

# ── 4. Configure CAN txqueuelen (transmit queue length = 128) ─────────────────
info "Writing CAN udev rule to /etc/udev/rules.d/10-can.rules…"
echo -e 'SUBSYSTEM=="net", ACTION=="change|add", KERNEL=="can*"  ATTR{tx_queue_len}="128"' | sudo tee /etc/udev/rules.d/10-can.rules > /dev/null
success "CAN udev rule written."

info "Verifying /etc/udev/rules.d/10-can.rules:"
cat /etc/udev/rules.d/10-can.rules

# ── 5. Configure can0 interface speed (1M bitrate) ────────────────────────────
info "Writing CAN network config to /etc/systemd/network/25-can.network…"
echo -e "[Match]\nName=can*\n\n[CAN]\nBitRate=1M\n\n[Link]\nRequiredForOnline=no" | sudo tee /etc/systemd/network/25-can.network > /dev/null
success "CAN network config written."

info "Verifying /etc/systemd/network/25-can.network:"
cat /etc/systemd/network/25-can.network

# ── 6. System update & base dependencies ─────────────────────────────────────
info "Updating package lists and upgrading system…"
sudo apt-get update -qq
sudo apt-get upgrade -y -qq

info "Installing base dependencies…"
sudo apt-get install -y -qq \
    git wget curl unzip \
    python3 python3-pip python3-venv python3-dev \
    build-essential libffi-dev libssl-dev \
    liblzma-dev libjpeg-dev zlib1g-dev \
    libopenjp2-7 libtiff6 \
    gcc-arm-none-eabi binutils-arm-none-eabi \
    stm32flash dfu-util \
    libusb-1.0-0-dev pkg-config \
    nginx \
    packagekit \
    virtualenv \
    iproute2 \
    systemd \
    udev
success "Base dependencies installed."

# ── 7. User groups ────────────────────────────────────────────────────────────
info "Adding ${KLIPPER_USER} to required groups…"
for grp in tty dialout video input gpio i2c spi; do
    if getent group "${grp}" >/dev/null 2>&1; then
        sudo usermod -aG "${grp}" "${KLIPPER_USER}"
    fi
done
success "Groups configured."

# ── 8. Directory structure ────────────────────────────────────────────────────
info "Creating printer_data directory structure…"
for d in "${CONFIG_DIR}" "${LOG_DIR}" "${DB_DIR}" \
          "${PRINTER_DATA}/gcodes" "${PRINTER_DATA}/systemd" \
          "${PRINTER_DATA}/comms"; do
    sudo -u "${KLIPPER_USER}" mkdir -p "${d}"
done
success "Directories created."

# ── 9. Download config files ───────────────────────────────────────────────────
info "Downloading config files from AutomatedLayers GitHub repo…"
cd "${CONFIG_DIR}"
echo -e "crowsnest.conf"
curl -L -o "crowsnest.conf" "https://raw.githubusercontent.com/AutomatedLayers/VertigoMk1/refs/heads/main/software/Printer%20Config/crowsnest.conf"
echo -e "macros.cfg"
curl -L -o "macros.cfg" "https://raw.githubusercontent.com/AutomatedLayers/VertigoMk1/refs/heads/main/software/Printer%20Config/macros.cfg"
echo -e "mainsail.cfg"
curl -L -o "mainsail.cfg" "https://raw.githubusercontent.com/AutomatedLayers/VertigoMk1/refs/heads/main/software/Printer%20Config/mainsail.cfg"
echo -e "moonraker.conf"
curl -L -o "moonraker.conf" "https://raw.githubusercontent.com/AutomatedLayers/VertigoMk1/refs/heads/main/software/Printer%20Config/moonraker.conf"
echo -e "printer.cfg"
curl -L -o "printer.cfg" "https://raw.githubusercontent.com/AutomatedLayers/VertigoMk1/refs/heads/main/software/Printer%20Config/printer.cfg"
echo -e "sonar.conf"
curl -L -o "sonar.conf" "https://raw.githubusercontent.com/AutomatedLayers/VertigoMk1/refs/heads/main/software/Printer%20Config/sonar.conf"
echo -e "timelapse.conf"
curl -L -o "timelapse.conf" "https://raw.githubusercontent.com/AutomatedLayers/VertigoMk1/refs/heads/main/software/Printer%20Config/timelapse.conf"
mkdir -p "${CONFIG_DIR}/.theme"
cd .theme
echo -e "default.json"
curl -L -o "default.json" "https://raw.githubusercontent.com/AutomatedLayers/VertigoMk1/refs/heads/main/software/Printer%20Config/.theme/default.json"
echo -e "favicon-32x32.png"
curl -L -o "favicon-32x32.png" "https://raw.githubusercontent.com/AutomatedLayers/VertigoMk1/refs/heads/main/software/Printer%20Config/.theme/favicon-32x32.png"
echo -e "sidebar-background.png"
curl -L -o "sidebar-background.png" "https://raw.githubusercontent.com/AutomatedLayers/VertigoMk1/refs/heads/main/software/Printer%20Config/.theme/sidebar-background.png"
echo -e "sidebar-logo.png"
curl -L -o "sidebar-logo.png" "https://raw.githubusercontent.com/AutomatedLayers/VertigoMk1/refs/heads/main/software/Printer%20Config/.theme/sidebar-logo.png"
success "Config files downloaded."

# ── 10. KLIPPER ───────────────────────────────────────────────────────────────
info "Cloning Kalico (Klipper fork)…"
if [[ ! -d "${KLIPPER_DIR}" ]]; then
    run_as_user "git clone https://github.com/AutomatedLayers/kalico.git ${KLIPPER_DIR}"
else
    warn "Klipper directory already exists, pulling latest…"
    run_as_user "git -C ${KLIPPER_DIR} pull"
fi

info "Creating Klipper Python virtualenv…"
run_as_user "python3 -m venv ${KLIPPY_ENV}"
run_as_user "${KLIPPY_ENV}/bin/pip install --upgrade pip -q"
run_as_user "${KLIPPY_ENV}/bin/pip install -r ${KLIPPER_DIR}/scripts/klippy-requirements.txt -q"
success "Klipper installed."

info "Installing Klipper systemd service…"
sudo tee /etc/systemd/system/klipper.service > /dev/null <<EOF
[Unit]
Description=Klipper 3D Printer Firmware SWI
Documentation=https://www.klipper3d.org/
After=network.target
Wants=udev.target

[Service]
Type=simple
User=${KLIPPER_USER}
RemainAfterExit=yes
ExecStart=${KLIPPY_ENV}/bin/python ${KLIPPER_DIR}/klippy/klippy.py \\
    ${CONFIG_DIR}/printer.cfg \\
    -l ${LOG_DIR}/klippy.log \\
    -a ${PRINTER_DATA}/comms/klippy.sock
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
EOF
success "Klipper service unit written."

# ── 11. MOONRAKER ─────────────────────────────────────────────────────────────
info "Cloning Moonraker…"
if [[ ! -d "${MOONRAKER_DIR}" ]]; then
    run_as_user "git clone https://github.com/Arksine/moonraker.git ${MOONRAKER_DIR}"
else
    warn "Moonraker directory already exists, pulling latest…"
    run_as_user "git -C ${MOONRAKER_DIR} pull"
fi

info "Creating Moonraker Python virtualenv…"
run_as_user "python3 -m venv ${MOONRAKER_ENV}"
run_as_user "${MOONRAKER_ENV}/bin/pip install --upgrade pip -q"
run_as_user "${MOONRAKER_ENV}/bin/pip install -r ${MOONRAKER_DIR}/scripts/moonraker-requirements.txt -q"

info "Installing Moonraker systemd service…"
sudo tee /etc/systemd/system/moonraker.service > /dev/null <<EOF
[Unit]
Description=API Server for Klipper SWI
Documentation=https://moonraker.readthedocs.io/en/latest/
After=network-online.target klipper.service
Wants=network-online.target

[Service]
Type=simple
User=${KLIPPER_USER}
SupplementaryGroups=moonraker-admin
RemainAfterExit=yes
WorkingDirectory=${MOONRAKER_DIR}
EnvironmentFile=${PRINTER_DATA}/systemd/moonraker.env
ExecStart=${MOONRAKER_ENV}/bin/python ${MOONRAKER_DIR}/moonraker/moonraker.py
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
EOF

# Write the env file Moonraker expects
sudo -u "${KLIPPER_USER}" tee "${PRINTER_DATA}/systemd/moonraker.env" > /dev/null <<EOF
MOONRAKER_DATA_PATH=${PRINTER_DATA}
EOF

# Moonraker needs its own group for polkit
sudo groupadd -f moonraker-admin
sudo usermod -aG moonraker-admin "${KLIPPER_USER}"

# Install polkit rules for Moonraker (service management, shutdown/reboot, packagekit)
sudo tee /etc/polkit-1/rules.d/moonraker.rules > /dev/null <<'EOF'
polkit.addRule(function(action, subject) {
    if ((action.id == "org.freedesktop.systemd1.manage-units" ||
         action.id == "org.freedesktop.systemd1.manage-unit-files" ||
         action.id == "org.freedesktop.login1.power-off" ||
         action.id == "org.freedesktop.login1.power-off-multiple-sessions" ||
         action.id == "org.freedesktop.login1.reboot" ||
         action.id == "org.freedesktop.login1.reboot-multiple-sessions" ||
         action.id == "org.freedesktop.packagekit.system-sources-refresh" ||
         action.id == "org.freedesktop.packagekit.package-install" ||
         action.id == "org.freedesktop.packagekit.system-update") &&
        subject.isInGroup("moonraker-admin")) {
        return polkit.Result.YES;
    }
});
EOF
success "Moonraker installed."

# ── 12. MAINSAIL ──────────────────────────────────────────────────────────────
info "Installing Mainsail web UI…"
sudo mkdir -p "${MAINSAIL_DIR}"
MAINSAIL_LATEST=$(curl -s https://api.github.com/repos/mainsail-crew/mainsail/releases/latest \
    | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/')
info "Downloading Mainsail ${MAINSAIL_LATEST}…"
wget -q "https://github.com/mainsail-crew/mainsail/releases/download/${MAINSAIL_LATEST}/mainsail.zip" \
    -O /tmp/mainsail.zip
sudo unzip -o -q /tmp/mainsail.zip -d "${MAINSAIL_DIR}"
rm /tmp/mainsail.zip
sudo chown -R www-data:www-data "${MAINSAIL_DIR}"
# Symlink so Moonraker's update manager can find Mainsail at ~/mainsail
run_as_user "ln -sf ${MAINSAIL_DIR} ${HOME_DIR}/mainsail"
success "Mainsail ${MAINSAIL_LATEST} installed to ${MAINSAIL_DIR}."

info "Configuring nginx for Mainsail…"
sudo tee /etc/nginx/sites-available/mainsail > /dev/null <<'EOF'
map $http_upgrade $connection_upgrade {
    default upgrade;
    ''      close;
}

upstream apiserver {
    ip_hash;
    server 127.0.0.1:7125;
}

upstream mjpgstreamer1 {
    ip_hash;
    server 127.0.0.1:8080;
}

server {
    listen 80 default_server;
    listen [::]:80 default_server;

    access_log /var/log/nginx/mainsail-access.log;
    error_log  /var/log/nginx/mainsail-error.log;

    client_max_body_size 1024M;

    root /var/www/mainsail;
    index index.html;

    # Mainsail static files
    location / {
        try_files $uri $uri/ /index.html;
    }

    # Moonraker websocket
    location /websocket {
        proxy_pass http://apiserver/websocket;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection $connection_upgrade;
        proxy_set_header Host $http_host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_read_timeout 86400;
    }

    # Moonraker API
    location ~ ^/(printer|api|access|machine|server)/ {
        proxy_pass http://apiserver$request_uri;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection $connection_upgrade;
        proxy_set_header Host $http_host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }

    # Webcam (Crowsnest / ustreamer)
    location /webcam/ {
        proxy_pass http://mjpgstreamer1/;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection $connection_upgrade;
        proxy_set_header Host $http_host;
    }
}
EOF

sudo rm -f /etc/nginx/sites-enabled/default
sudo ln -sf /etc/nginx/sites-available/mainsail /etc/nginx/sites-enabled/mainsail
sudo nginx -t && sudo systemctl restart nginx
success "nginx configured for Mainsail."

# ── 13. CROWSNEST ─────────────────────────────────────────────────────────────
info "Installing Crowsnest (webcam manager)…"
if [[ ! -d "${CROWSNEST_DIR}" ]]; then
    run_as_user "git clone https://github.com/mainsail-crew/crowsnest.git ${CROWSNEST_DIR}"
else
    warn "Crowsnest directory already exists, pulling latest…"
    run_as_user "git -C ${CROWSNEST_DIR} pull"
fi

# Crowsnest uses its own install script but we do it non-interactively
info "Running Crowsnest installer (non-interactive)…"
sudo CROWSNEST_CONFIG="${CONFIG_DIR}/crowsnest.conf" \
     CROWSNEST_LOG="${LOG_DIR}/crowsnest.log" \
     CROWSNEST_ARGS="-c ${CONFIG_DIR}/crowsnest.conf" \
     bash "${CROWSNEST_DIR}/tools/install.sh" || true   # installer may exit non-zero on first run

# Fallback: write the systemd unit manually if the installer didn't
if [[ ! -f /etc/systemd/system/crowsnest.service ]]; then
    warn "Crowsnest installer didn't write a service unit — writing manually."
    sudo tee /etc/systemd/system/crowsnest.service > /dev/null <<EOF
[Unit]
Description=Crowsnest Webcam Daemon
After=network-online.target moonraker.service
Wants=network-online.target

[Service]
Type=simple
User=root
ExecStart=/usr/local/bin/crowsnest -c ${CONFIG_DIR}/crowsnest.conf
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
EOF
fi

success "Crowsnest installed."

# ── 14. MAINSAIL-CONFIG ───────────────────────────────────────────────────────
info "Cloning mainsail-config…"
if [[ ! -d "${HOME_DIR}/mainsail-config" ]]; then
    run_as_user "git clone https://github.com/mainsail-crew/mainsail-config.git ${HOME_DIR}/mainsail-config"
else
    warn "mainsail-config directory already exists, pulling latest…"
    run_as_user "git -C ${HOME_DIR}/mainsail-config pull"
fi
success "mainsail-config cloned."

# ── 15. SONAR ─────────────────────────────────────────────────────────────────
info "Cloning Sonar (keep-alive daemon)…"
if [[ ! -d "${HOME_DIR}/sonar" ]]; then
    run_as_user "git clone https://github.com/mainsail-crew/sonar.git ${HOME_DIR}/sonar"
else
    warn "Sonar directory already exists, pulling latest…"
    run_as_user "git -C ${HOME_DIR}/sonar pull"
fi
success "Sonar cloned."

# ── 16. Verify user config files are present ──────────────────────────────────
info "Verifying expected config files…"
EXPECTED_CONFIGS=(
    printer.cfg moonraker.conf crowsnest.conf
    macros.cfg mainsail.cfg sonar.conf timelapse.conf
)
MISSING=()
for f in "${EXPECTED_CONFIGS[@]}"; do
    if [[ ! -f "${CONFIG_DIR}/${f}" ]]; then
        MISSING+=("${f}")
    fi
done
if [[ ${#MISSING[@]} -gt 0 ]]; then
    warn "The following config files were not found in ${CONFIG_DIR}/:"
    for f in "${MISSING[@]}"; do warn "  • ${f}"; done
    warn "Services may fail to start until all configs are in place."
else
    success "All expected config files present."
fi

# ── 17. Enable & start services ───────────────────────────────────────────────
info "Enabling and starting services…"
sudo systemctl daemon-reload

for svc in klipper moonraker crowsnest nginx; do
    sudo systemctl enable "${svc}"
    sudo systemctl restart "${svc}" || warn "${svc} failed to start — check logs."
done
success "All services enabled and started."

# ── 18. udev rule for USB serial access ───────────────────────────────────────
info "Installing udev rule for USB serial devices…"
sudo tee /etc/udev/rules.d/99-klipper.rules > /dev/null <<'EOF'
# Allow the klipper user to access USB serial devices
SUBSYSTEM=="tty", ATTRS{idVendor}=="*", GROUP="dialout", MODE="0660"
EOF
sudo udevadm control --reload-rules
sudo udevadm trigger
success "udev rules updated."

# ── 19. KATAPULT ──────────────────────────────────────────────────────────────
info "Cloning Katapult (formerly CanBoot) bootloader…"
if [[ ! -d "${KATAPULT_DIR}" ]]; then
    run_as_user "git clone https://github.com/Arksine/katapult.git ${KATAPULT_DIR}"
else
    warn "Katapult directory already exists, pulling latest…"
    run_as_user "git -C ${KATAPULT_DIR} pull"
fi
success "Katapult cloned."

info "Downloading Katapult firmware configs…"
BASE_URL="https://raw.githubusercontent.com/AutomatedLayers/VertigoMk1/refs/heads/main/software/Firmware%20Configs"
run_as_user "curl -L -o '${KATAPULT_DIR}/M8Pv2_katapult.config'   '${BASE_URL}/M8Pv2_katapult.config'"
run_as_user "curl -L -o '${KATAPULT_DIR}/SHT36v3_katapult.config' '${BASE_URL}/SHT36v3_katapult.config'"
success "Katapult firmware configs downloaded."

info "Downloading Klipper firmware configs…"
run_as_user "curl -L -o '${KLIPPER_DIR}/M8Pv2_klipper.config'    '${BASE_URL}/M8Pv2_klipper.config'"
run_as_user "curl -L -o '${KLIPPER_DIR}/SHT36v3_klipper.config'  '${BASE_URL}/SHT36v3_klipper.config'"
success "Klipper firmware configs downloaded."

# ── Done ──────────────────────────────────────────────────────────────────────
IP=$(hostname -I | awk '{print $1}')
echo ""
echo -e "${BOLD}${GREEN}============================================${RESET}"
echo -e "${BOLD}${GREEN}  Installation Complete!${RESET}"
echo -e "${BOLD}${GREEN}============================================${RESET}"
echo ""
echo -e "  ${BOLD}Mainsail UI:${RESET}     http://${IP}"
echo -e "  ${BOLD}Moonraker API:${RESET}   http://${IP}:7125"
echo -e "  ${BOLD}Webcam stream:${RESET}   http://${IP}:8080"
echo ""
echo -e "  ${BOLD}Config files:${RESET}    ${CONFIG_DIR}/"
echo -e "  ${BOLD}Logs:${RESET}            ${LOG_DIR}/"
echo ""
echo -e "${YELLOW}Next steps:${RESET}"
echo -e "  1. Ensure your configs are in place at ${CONFIG_DIR}/"
echo -e "     Expected: printer.cfg, moonraker.conf, crowsnest.conf,"
echo -e "               macros.cfg, mainsail.cfg, sonar.conf, timelapse.conf"
echo -e "  2. Flash Kalico firmware to your MCU:"
echo -e "       cd ${KLIPPER_DIR} && make menuconfig && make"
echo -e "  3. After reboot, flash Katapult and Klipper firmware to your MCUs."
echo ""
echo -e "  ${CYAN}Kalico docs: https://github.com/AutomatedLayers/kalico${RESET}"
echo ""

info "Rebooting in 10 seconds to apply group and service changes… (Ctrl+C to cancel)"
sleep 10
sudo reboot