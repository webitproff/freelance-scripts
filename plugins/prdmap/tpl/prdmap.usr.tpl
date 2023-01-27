<!-- BEGIN: MAIN -->
<script>
var geocoder;
var map;
function initialize() {
  geocoder = new google.maps.Geocoder();
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
  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
}

function codeAddress() {
  geocoder.geocode( { 'address': '{USER_CITY}, {USER_ADR}'}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      map.setCenter(results[0].geometry.location);
      var marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location,
      });
      <!-- IF {PHP.cfg.plugin.prdmap.rmicon} -->marker.setIcon('{PHP.cfg.plugin.prdmap.rmicon}');<!-- ENDIF -->
    }
  });
};
google.maps.event.addDomListener(window, 'load', initialize);
google.maps.event.addDomListener(window, 'load', codeAddress);
</script>
<div id="map-canvas"></div>
<style>#map-canvas { width:200px;height:200px }</style>
<!-- END: MAIN -->
