#!/usr/bin/env bash
# =============================================================================
# Klipper Stack Uninstaller for Raspberry Pi CM4 — Debian Trixie (13)
# Reverses all changes made by vertigo_setup.sh:
#   Kalico (Klipper fork), Moonraker, Mainsail, Crowsnest, Katapult,
#   nginx config, systemd units, udev rules, CAN config, groups, polkit
#
# Usage:
#   chmod +x vertigo_uninstall.sh
#   ./vertigo_uninstall.sh
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

# ── Pre-flight checks ─────────────────────────────────────────────────────────
[[ "$(id -u)" -eq 0 ]] && die "Do NOT run this script as root. Run as your regular user."
command -v sudo >/dev/null || die "sudo is required but not installed."

echo -e "\n${BOLD}======================================================${RESET}"
echo -e "${BOLD}  Klipper Stack Uninstaller — Debian Trixie / CM4${RESET}"
echo -e "${BOLD}======================================================${RESET}\n"
warn "This will PERMANENTLY remove all Klipper stack components and"
warn "configuration files installed by vertigo_setup.sh."
echo ""
read -rp "Are you sure you want to continue? [y/N] " CONFIRM
[[ "${CONFIRM,,}" == "y" ]] || { info "Aborted."; exit 0; }
echo ""

# ── 1. Stop and disable all services ─────────────────────────────────────────
info "Stopping and disabling services…"
for svc in crowsnest moonraker klipper; do
    if systemctl list-unit-files "${svc}.service" &>/dev/null; then
        sudo systemctl stop "${svc}"    2>/dev/null || true
        sudo systemctl disable "${svc}" 2>/dev/null || true
        success "${svc} stopped and disabled."
    else
        warn "${svc}.service not found — skipping."
    fi
done

# nginx: restore to stock rather than fully remove (it was a pre-existing package)
info "Removing Mainsail nginx site and restoring nginx defaults…"
sudo systemctl stop nginx 2>/dev/null || true
sudo rm -f /etc/nginx/sites-enabled/mainsail
sudo rm -f /etc/nginx/sites-available/mainsail
# Restore the default site if it was removed
if [[ ! -f /etc/nginx/sites-enabled/default ]]; then
    sudo ln -sf /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default 2>/dev/null || true
fi
sudo systemctl start nginx 2>/dev/null || true
success "nginx restored to defaults."

# ── 2. Remove systemd service unit files ──────────────────────────────────────
info "Removing systemd service unit files…"
for unit in klipper.service moonraker.service crowsnest.service; do
    if [[ -f "/etc/systemd/system/${unit}" ]]; then
        sudo rm -f "/etc/systemd/system/${unit}"
        success "Removed /etc/systemd/system/${unit}."
    else
        warn "/etc/systemd/system/${unit} not found — skipping."
    fi
done
sudo systemctl daemon-reload
success "systemd daemon reloaded."

# ── 3. Remove polkit rules ────────────────────────────────────────────────────
info "Removing Moonraker polkit rules…"
if [[ -f /etc/polkit-1/rules.d/moonraker.rules ]]; then
    sudo rm -f /etc/polkit-1/rules.d/moonraker.rules
    success "Removed /etc/polkit-1/rules.d/moonraker.rules."
else
    warn "/etc/polkit-1/rules.d/moonraker.rules not found — skipping."
fi

# ── 4. Remove udev rules ──────────────────────────────────────────────────────
info "Removing udev rules…"
for rule in /etc/udev/rules.d/10-can.rules /etc/udev/rules.d/99-klipper.rules; do
    if [[ -f "${rule}" ]]; then
        sudo rm -f "${rule}"
        success "Removed ${rule}."
    else
        warn "${rule} not found — skipping."
    fi
done
sudo udevadm control --reload-rules
sudo udevadm trigger
success "udev rules reloaded."

# ── 5. Remove CAN network config ──────────────────────────────────────────────
info "Removing CAN systemd-networkd config…"
if [[ -f /etc/systemd/network/25-can.network ]]; then
    sudo rm -f /etc/systemd/network/25-can.network
    success "Removed /etc/systemd/network/25-can.network."
else
    warn "/etc/systemd/network/25-can.network not found — skipping."
fi

# ── 6. Restore systemd-networkd to stock state ───────────────────────────────
# Trixie ships with systemd-networkd masked/inactive by default on most images;
# we disable and re-mask it to return to that baseline.
info "Reverting systemd-networkd to stock Trixie state…"
sudo systemctl stop    systemd-networkd 2>/dev/null || true
sudo systemctl disable systemd-networkd 2>/dev/null || true
sudo systemctl mask    systemd-networkd 2>/dev/null || true
success "systemd-networkd masked (stock Trixie default)."

# Re-enable systemd-networkd-wait-online (we disabled it during install)
info "Re-enabling systemd-networkd-wait-online.service…"
sudo systemctl unmask systemd-networkd-wait-online.service 2>/dev/null || true
sudo systemctl enable systemd-networkd-wait-online.service 2>/dev/null || true
success "systemd-networkd-wait-online restored."

# ── 7. Remove moonraker-admin group ───────────────────────────────────────────
info "Removing moonraker-admin group…"
if getent group moonraker-admin >/dev/null 2>&1; then
    sudo gpasswd -d "${KLIPPER_USER}" moonraker-admin 2>/dev/null || true
    sudo groupdel moonraker-admin
    success "moonraker-admin group removed."
else
    warn "moonraker-admin group not found — skipping."
fi

# ── 8. Remove user from added groups ─────────────────────────────────────────
# Note: we only REMOVE the user from these groups; we do not delete the groups
# themselves as they may have existed before the install.
info "Removing ${KLIPPER_USER} from groups added during install…"
for grp in tty dialout video input gpio i2c spi; do
    if getent group "${grp}" >/dev/null 2>&1; then
        sudo gpasswd -d "${KLIPPER_USER}" "${grp}" 2>/dev/null \
            && success "Removed ${KLIPPER_USER} from ${grp}." \
            || warn "${KLIPPER_USER} was not in ${grp} — skipping."
    fi
done

# ── 9. Remove application directories ────────────────────────────────────────
info "Removing application directories…"
for dir in \
    "${KLIPPER_DIR}" \
    "${KLIPPY_ENV}" \
    "${MOONRAKER_DIR}" \
    "${MOONRAKER_ENV}" \
    "${CROWSNEST_DIR}" \
    "${KATAPULT_DIR}" \
    "${PRINTER_DATA}" \
    "${MAINSAIL_DIR}"; do
    if [[ -d "${dir}" ]]; then
        sudo rm -rf "${dir}"
        success "Removed ${dir}."
    else
        warn "${dir} not found — skipping."
    fi
done

# ── 10. Remove packages installed exclusively for the Klipper stack ───────────
# Only packages not typically present on a stock Trixie install are removed.
# Base utilities (git, curl, wget, python3, build-essential, etc.) are left
# in place as they are commonly pre-installed or depended on by other software.
info "Removing Klipper-specific packages…"
KLIPPER_PKGS=(
    avrdude gcc-avr binutils-avr avr-libc
    stm32flash dfu-util
    libusb-1.0-0-dev
    virtualenv
    python3-serial
)
sudo apt-get remove -y --purge "${KLIPPER_PKGS[@]}" 2>/dev/null || true
sudo apt-get autoremove -y 2>/dev/null || true
success "Klipper-specific packages removed."

# ── Done ──────────────────────────────────────────────────────────────────────
echo ""
echo -e "${BOLD}${GREEN}============================================${RESET}"
echo -e "${BOLD}${GREEN}  Uninstall Complete!${RESET}"
echo -e "${BOLD}${GREEN}============================================${RESET}"
echo ""
echo -e "${YELLOW}What was removed:${RESET}"
echo -e "  • Klipper, Moonraker, Mainsail, Crowsnest, Katapult services & files"
echo -e "  • systemd units: klipper, moonraker, crowsnest"
echo -e "  • nginx Mainsail site (default site restored)"
echo -e "  • polkit rules: moonraker.rules"
echo -e "  • udev rules: 10-can.rules, 99-klipper.rules"
echo -e "  • CAN network config: 25-can.network"
echo -e "  • moonraker-admin group"
echo -e "  • printer_data/, klipper/, klippy-env/, moonraker/,"
echo -e "    moonraker-env/, crowsnest/, katapult/, /var/www/mainsail/"
echo -e "  • Klipper-specific apt packages"
echo ""
echo -e "${YELLOW}What was NOT removed:${RESET}"
echo -e "  • Common packages (git, curl, python3, build-essential, nginx, etc.)"
echo -e "  • Pre-existing user group memberships (tty, dialout, etc. may have"
echo -e "    existed before install — user was removed from them but groups kept)"
echo ""
echo -e "${YELLOW}Recommended next step:${RESET}"
echo -e "  ${BOLD}Reboot${RESET} to ensure all group changes and service removals take full effect."
echo ""