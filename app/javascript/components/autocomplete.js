function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var lessonLocation = document.getElementById('lesson_location');

    if (lessonLocation) {
      var autocomplete = new google.maps.places.Autocomplete(lessonLocation, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(lessonLocation, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
