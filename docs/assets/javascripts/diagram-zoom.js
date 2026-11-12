// Click a Mermaid diagram to view it fullscreen; click again or press Esc to close.
// Uses event delegation, so it keeps working with Material's instant navigation
// and with diagrams rendered after the page loads.
document.addEventListener("click", (event) => {
  const diagram = event.target.closest(".mermaid");
  if (!diagram || !diagram.requestFullscreen) return;

  if (document.fullscreenElement) {
    document.exitFullscreen();
  } else {
    diagram.requestFullscreen();
  }
});
