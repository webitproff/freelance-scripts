<!-- BEGIN: MAIN -->
<!-- IF {ERROR} -->
<h1 class="text-center">Ошибка! Проверьте указанный город в настройках плагина, возможно он введен неправильно.</h1>
<!-- ELSE -->
<style>#map-canvas { width:100%; height:500px; }</style>
<div id="map-canvas"></div>
<script>
  var geocoder;
  var map;
  var centerfind;
  var prevmark;
  var previd;
  function initializeGmap() {
    geocoder = new google.maps.Geocoder();
    var latlng = new google.maps.LatLng(-34.397, 150.644);

    var mapOptions = {
      zoom: <!-- IF {MAP_ZOOM_FIX} -->{MAP_ZOOM_FIX}<!-- ELSE -->{PHP.cfg.plugin.prdmap.zoomindex}<!-- ENDIF -->,
      center: latlng,
      disableDefaultUI: <!-- IF {PHP.cfg.plugin.prdmap.disableui} -->true<!-- ELSE -->false<!-- ENDIF -->,
      scrollwheel: <!-- IF {PHP.cfg.plugin.prdmap.rmscroll} -->false<!-- ELSE -->true<!-- ENDIF -->,
      mapTypeId: google.maps.MapTypeId.<!-- IF {PHP.cfg.plugin.prdmap.type} == 1 -->ROADMAP<!-- ENDIF -->
                                       <!-- IF {PHP.cfg.plugin.prdmap.type} == 2 -->SATELLITE<!-- ENDIF -->
                                       <!-- IF {PHP.cfg.plugin.prdmap.type} == 3 -->HYBRID<!-- ENDIF -->
                                       <!-- IF {PHP.cfg.plugin.prdmap.type} == 4 -->TERRAIN<!-- ENDIF -->
    }
    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

    geocoder.geocode( { 'address': '<!-- IF {MAP_CENTER} -->{MAP_CENTER}<!-- ELSE -->{PHP.cfg.plugin.prdmap.center}<!-- ENDIF -->'}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        map.setCenter(results[0].geometry.location);
        centerfind = 0;
        }
        else
        {
        centerfind = 1;
        }
    });

  <!-- BEGIN: PRDMAP_ROWS -->
    <!-- IF {PRD_ROW_PRDMAP_LAT} AND {PRD_ROW_PRDMAP_LNG} -->
          if (centerfind)
          {
            map.setCenter({lat: {PRD_ROW_PRDMAP_LAT}, lng: {PRD_ROW_PRDMAP_LNG}});
            centerfind = 0;
          }

          var infowindow{PRD_ROW_ID} = new google.maps.InfoWindow({
            content: '{CONTENT}'
          });

          var marker{PRD_ROW_ID} = new google.maps.Marker({
              map: map,
              position: {lat: {PRD_ROW_PRDMAP_LAT}, lng: {PRD_ROW_PRDMAP_LNG}},
              title: '{PRD_ROW_SHORTTITLE}'
          });
          <!-- IF {PHP.cfg.plugin.prdmap.rmicon} -->marker.setIcon('{PHP.cfg.plugin.prdmap.rmicon}');<!-- ENDIF -->

          google.maps.event.addListener(marker{PRD_ROW_ID}, 'click', function() {
            if (prevmark)
            {
             prevmark.close();
            }
            prevmark = infowindow{PRD_ROW_ID};
            infowindow{PRD_ROW_ID}.open(map,marker{PRD_ROW_ID});
            previd = {PRD_ROW_ID};
          });
    <!-- ELSE -->
      <!-- IF {PRD_ROW_PRDMAP_ADR} -->
        geocoder.geocode( { 'address': '{PRD_ROW_CITY}, {PRD_ROW_PRDMAP_ADR}'}, function(results, status) {
          if (status == google.maps.GeocoderStatus.OK) {
            if (centerfind)
            {
              map.setCenter(results[0].geometry.location);
              centerfind = 0;
            }

            var infowindow{PRD_ROW_ID} = new google.maps.InfoWindow({
            content: '{CONTENT}'
            });

            var marker{PRD_ROW_ID} = new google.maps.Marker({
                map: map,
                position: results[0].geometry.location,
                title: '{PRD_ROW_SHORTTITLE}'
            });
            <!-- IF {PHP.cfg.plugin.prdmap.rmicon} -->marker.setIcon('{PHP.cfg.plugin.prdmap.rmicon}');<!-- ENDIF -->

            google.maps.event.addListener(marker{PRD_ROW_ID}, 'click', function() {
              if (prevmark)
              {
               prevmark.close();
              }
              prevmark = infowindow{PRD_ROW_ID};
              infowindow{PRD_ROW_ID}.open(map,marker{PRD_ROW_ID});
              previd = {PRD_ROW_ID};
            });
          }
        });
      <!-- ENDIF -->
    <!-- ENDIF -->
  <!-- END: PRDMAP_ROWS -->
      previd=null;
      prevmark=null;

      google.maps.event.addListener(map, 'click', function() {
       if (prevmark)
       {
        prevmark.close();
       }
      });
  }

  google.maps.event.addDomListener(window, 'load', initializeGmap);
</script>
<!-- ENDIF -->
<!-- END: MAIN -->
