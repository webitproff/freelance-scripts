<!-- BEGIN: MAIN -->
<script>
var geocoder_{ID};
var map_{ID};
function initialize_{ID}() {
  geocoder_{ID} = new google.maps.Geocoder();
  var latlng = new google.maps.LatLng(-34.397, 150.644);

  var mapOptions = {
    zoom: {PHP.cfg.plugin.prdmap.zoom},
    center: latlng,
    disableDefaultUI: <!-- IF {PHP.cfg.plugin.prdmap.disableui} -->true<!-- ELSE -->false<!-- ENDIF -->,
    scrollwheel: <!-- IF {PHP.cfg.plugin.prdmap.rmscroll} -->false<!-- ELSE -->true<!-- ENDIF -->,
    mapTypeId: google.maps.MapTypeId.<!-- IF {PHP.cfg.plugin.prdmap.type} == 1 -->ROADMAP<!-- ENDIF -->
                                     <!-- IF {PHP.cfg.plugin.prdmap.type} == 2 -->SATELLITE<!-- ENDIF -->
                                     <!-- IF {PHP.cfg.plugin.prdmap.type} == 3 -->HYBRID<!-- ENDIF -->
                                     <!-- IF {PHP.cfg.plugin.prdmap.type} == 4 -->TERRAIN<!-- ENDIF -->
  }
  map_{ID} = new google.maps.Map(document.getElementById('map-canvas_{ID}'), mapOptions);
  codeAddress_{ID}();
}
function codeAddress_{ID}() {
  geocoder_{ID}.geocode( { 'address': '{PRD_CITY}, {PRD_ADR}'}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      map_{ID}.setCenter(results[0].geometry.location);

      var infowindow_{ID} = new google.maps.InfoWindow({
        content: '{CONTENT}'
      });

      var marker_{ID} = new google.maps.Marker({
          map: map_{ID},
          position: results[0].geometry.location,
          title: '{PRD_SHORTTITLE}'
      });
      <!-- IF {PHP.cfg.plugin.prdmap.rmicon} -->marker_{ID}.setIcon('{PHP.cfg.plugin.prdmap.rmicon}');<!-- ENDIF -->

      /* infowindow_{ID}.open(map,marker); */
    }
  });
};

google.maps.event.addDomListener(window, 'load', initialize_{ID});
</script>
<div id="map-canvas_{ID}"></div>
<style>#map-canvas_{ID} { width:100%;height:300px; }</style>
<!-- END: MAIN -->
