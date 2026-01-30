function startCameraDebug(viewer) {
  function getCameraAttributeString() {
    const camPos = viewer.GetCamera().GetPosition(); // { eye, center, up }
    const eye = camPos.eye;
    const center = camPos.center;
    const up = camPos.up;

    const arr = [
      eye.x, eye.y, eye.z,
      center.x, center.y, center.z,
      up.x, up.y, up.z,
    ];

    return 'camera="' + arr.join(', ') + '"';
  }

  // Log to console when you press "c"
  window.addEventListener('keydown', (e) => {
    if (e.key.toLowerCase() === 'c') {
      console.log(getCameraAttributeString());
    }
  });

  // On-screen overlay so you can copy/paste
  const overlay = document.createElement('pre');
  overlay.style.position = 'fixed';
  overlay.style.bottom = '1rem';
  overlay.style.left = '1rem';
  overlay.style.padding = '0.5rem 0.75rem';
  overlay.style.background = 'rgba(0,0,0,0.6)';
  overlay.style.color = '#fff';
  overlay.style.fontFamily = 'monospace';
  overlay.style.fontSize = '11px';
  overlay.style.zIndex = '9999';
  overlay.style.pointerEvents = 'none';
  document.body.appendChild(overlay);

  function updateOverlay() {
    overlay.textContent = getCameraAttributeString();
    requestAnimationFrame(updateOverlay);
  }
  updateOverlay();
}

function initCameraDebugWhenReady() {
  const viewers = window.OV_VIEWERS;

  if (!viewers || viewers.length === 0) {
    // Wait until init-ov.js has finished
    requestAnimationFrame(initCameraDebugWhenReady);
    return;
  }

  const embedded = viewers[0];          // first <div class="online_3d_viewer">
  const viewer = embedded.GetViewer();  // underlying core viewer
  startCameraDebug(viewer);
}

window.addEventListener('load', () => {
  initCameraDebugWhenReady();
});
