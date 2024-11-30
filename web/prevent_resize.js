// prevent_resize.js
window.onbeforeunload = function() {
    return "Are you sure you want to leave?";
  };
  
  window.addEventListener('resize', function() {
    if (window.innerWidth < 800) {
      // Prevent the window from resizing below 1200px width
      window.resizeTo(1200, window.innerHeight);
    }
  });
  