/* Created by Michael Chen */

$(document).ready(function() {
    $(".dropdown-toggle").dropdown();
});

function goBack() {
    window.history.back();
}

function initMap() {
        var atlanta = {lat: 34, lng: -84};
        var map = new google.maps.Map(document.getElementById('map'), {
                  zoom: 4,
                  center: atlanta
        });


//        {% for resource in resources %}
//            var resourceloc = "{{resource[6]}} {{resource[5]}}, {{resource[3]}}, {{resource[2]}} {{resource[4]}}";
//
//            var geocoder = new google.maps.Geocoder();
//
//            geocoder.geocode( { 'address': resourceloc}, function(results, status) {
//
//            if (status == google.maps.GeocoderStatus.OK) {
//                var latitude = results[0].geometry.location.lat();
//                var longitude = results[0].geometry.location.lng();
//                var marker = new google.maps.Marker({
//                position: {lat: latitude, lng: longitude}, map: map});
//                }
//            });
//        {% end for %}

        var marker = new google.maps.Marker({
          position: atlanta,
          map: map
        });
      }

