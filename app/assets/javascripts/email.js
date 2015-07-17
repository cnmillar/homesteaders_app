  $(document).ready(function(event, element) { 
  alert("email required");
    if (event.stopped) return; 
    window.open($(element).href); 
    event.stop(); 
}); 