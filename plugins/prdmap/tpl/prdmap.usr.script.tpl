<!-- BEGIN: MAIN -->
<script>
var geocoder;
var map;
var marker;
function initialize() {
  geocoder = new google.maps.Geocoder();
  var latlng = new google.maps.LatLng(-34.397, 150.644);

  var mapOptions = {
    zoom: 12,
    center: latlng,
    disableDefaultUI: true,
    scrollwheel: true,
  }
  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

  marker = new google.maps.Marker({map: map, position:latlng, draggable: true});
  <!-- IF {PHP.cfg.plugin.prdmap.rmicon} -->marker.setIcon('{PHP.cfg.plugin.prdmap.rmicon}');<!-- ENDIF -->

  if($('#locselectcity').val() != 0)
  {
    $('#prdmap_adrpre').html($('#locselectcity option:selected').text());
    geocogeAdr($('#locselectcity option:selected').text(), '{ADR}');
  }

  google.maps.event.addDomListener(map, 'click', function(e) {
    marker.setPosition(e.latLng);
    adrGeocoge(e.latLng);
  });

  function handleEvent(e) {
    adrGeocoge(e.latLng);
  }

  marker.addListener('dragend', handleEvent);

 function adrGeocoge(LatLng)
 {
  var latlngStr = "+"+LatLng;
  latlngStr = latlngStr.replace("+(", "").replace(")", "").split(',', 2);
  var latlng = {lat: parseFloat(latlngStr[0]), lng: parseFloat(latlngStr[1])};
  geocoder.geocode({'location': latlng}, function(results, status) {
    if (status === google.maps.GeocoderStatus.OK) {
       var adress = '';
       if(results[0].address_components[0].types[0] == 'street_number')
       {
         adress = results[0].address_components[1].short_name+" "+results[0].address_components[0].short_name;
       }
       else
       {
         adress = results[0].address_components[0].short_name;
       }

       $('[name="ruserprdmap"]').val(adress+'#'+latlngStr[0]+','+latlngStr[1]);
       $('#prdmap_adrinput').val(adress);
     }
  });
 }

 function geocogeAdr(city, adr)
 {
  geocoder.geocode( {'address': city+" "+adr}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      map.setCenter(results[0].geometry.location);
      marker.setPosition(results[0].geometry.location);

       var val = adr+'#'+results[0].geometry.location;
       val = val.replace("(", "").replace(")", "");
       $('[name="ruserprdmap"]').val(val);

    }
  });
 }

 $('#prdmap_adrinput').keydown(function(e) {
  var prj_adr = $(this).val();
  if(e.keyCode==13)
  {
    e.preventDefault();
    if($('#prdmap_adrpre').html() != 'Выберите город')
    {
      geocogeAdr($('#prdmap_adrpre').html(), prj_adr);
    }
  }
 });

 $('#prdmap_adrinput').change(function(e) {
  var prj_adr = $(this).val();
    if($('#prdmap_adrpre').html() != 'Выберите город')
    {
      geocogeAdr($('#prdmap_adrpre').html(), prj_adr);
    }
 });

 $('#locselectcity').live("change", function(){
    if ($(this).val() != 0) {
      $('#prdmap_adrpre').html($('#locselectcity option[value="'+$(this).val()+'"]').filter(':first').text());
      geocogeAdr($('#prdmap_adrpre').html(), $('#prdmap_adrinput').val());
    }
 });
}

google.maps.event.addDomListener(window, 'load', initialize);

</script>
<!-- END: MAIN -->
