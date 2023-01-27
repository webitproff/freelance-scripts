<?php

/* ====================
  [BEGIN_COT_EXT]
  Hooks=projects.list.query
  Order=99
  [END_COT_EXT]
  ==================== */

defined('COT_CODE') or die('Wrong URL.');
$showmapradius = (isset($_GET['city']) || ($usr_geoinfo['city'] > 0 && !isset($_GET['search'])));

if($showmapradius && $_GET['mapradius'] > 0 && $_GET['city'] > 0) {
  $getcity = cot_getcity($_GET['city']);

  $xml = simplexml_load_file('http://maps.google.com/maps/api/geocode/xml?address='.$getcity.'&sensor=false');

  if( $xml->status == 'OK' ) {
    $lat = $xml->result->geometry->location->lat;
    $lng = $xml->result->geometry->location->lng;

    $where['location'] = '('.(!empty($where['location']) ? $where['location'].' OR ' : '').'(item_prdmaplat!=0 AND item_prdmaplng!=0 AND prdmapdist('.$lat.', '.$lng.', item_prdmaplat, item_prdmaplng)<'.$_GET['mapradius'].'))';

    $join_columns .= ', prdmapdist('.$lat.', '.$lng.', item_prdmaplat, item_prdmaplng) as mapdistance';
  }
}




