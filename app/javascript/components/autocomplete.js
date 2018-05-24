function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var toolAddress = document.getElementById('tool_address');

    if (toolAddress) {
      var autocomplete = new google.maps.places.Autocomplete(toolAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(toolAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
