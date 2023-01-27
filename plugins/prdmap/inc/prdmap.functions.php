<?php
/**
 * Route for projects (google maps)
 * @Version 1.0
 * @package routemap
 * @copyright (c) Alexeev Vlad
 */

function cot_prdmap_form($item)
{
 $t_c = new XTemplate(cot_tplfile('prdmap.prd.script', 'plug'));
 if ($item)
  {
   $t = new XTemplate(cot_tplfile('prdmap.prd.edit', 'plug'));

   $itmid = $item['item_id'];
   $adr = explode('#', $item['item_prdmap']);

   $t_c->assign(array(
     'ID' => $itmid,
     'ADR' => $adr[0],
     'LATLNG' => $adr[1]
   ));

   $t_c->parse('MAIN');

   $t->assign(array(
     'ID' => $itmid,
     'MAIN_SCRIPT' => $t_c->text('MAIN'),
     'INPUT_VAL' => $item['item_prdmap'],
     'ADR' => $adr[0],
     'LATLNG' => $adr[1]
   ));

   $t->parse('MAIN');
   $form = $t->text('MAIN');
  }
 else
 {
  $t_c->parse('MAIN');

  $t = new XTemplate(cot_tplfile('prdmap.prd.add', 'plug'));
  $t->assign('MAIN_SCRIPT', $t_c->text('MAIN'));
  $t->parse('MAIN');
  $form = $t->text('MAIN');
 }
 return $form;
}

function cot_prdmap_user_form($item = array())
{
 $t_c = new XTemplate(cot_tplfile('prdmap.usr.script', 'plug'));
 if (count($item) > 0)
  {
   $t = new XTemplate(cot_tplfile('prdmap.usr.edit', 'plug'));

   $itmid = $item['item_id'];
   $adr = explode('#', $item['user_prdmap']);

   $t_c->assign(array(
     'ID' => $itmid,
     'ADR' => $adr[0],
     'LATLNG' => $adr[1]
   ));

   $t_c->parse('MAIN');

   $t->assign(array(
     'ID' => $itmid,
     'MAIN_SCRIPT' => $t_c->text('MAIN'),
     'INPUT_VAL' => $item['user_prdmap'],
     'ADR' => $adr[0],
     'LATLNG' => $adr[1]
   ));

   $t->parse('MAIN');
   $form = $t->text('MAIN');
  }
 else
 {
  $t_c->parse('MAIN');

  $t = new XTemplate(cot_tplfile('prdmap.usr.add', 'plug'));
  $t->assign('MAIN_SCRIPT', $t_c->text('MAIN'));
  $t->parse('MAIN');
  $form = $t->text('MAIN');
 }
 return $form;
}

function cot_get_prdmap_map($data = array(), $prjtags = array())
{
 if($data)
  {
   $t_s = new XTemplate(cot_tplfile('prdmap.prd', 'plug'));

   $itmid = $data['item_id'];
   $adr = explode('#', $data['item_prdmap']);

   $t_s->assign(array(
     'ID' => $itmid,
     'PRD_CITY' => ($data['item_city'] > 0 ? cot_getcity($data['item_city']) : ''),
     'PRD_ADR' => $adr[0],
   ));

   $t_i = new XTemplate(cot_tplfile(array('prdmap', 'infowindow'), 'plug'));

   $t_s->assign($prjtags);
   $t_s->assign(array(
    'ID' => $itmid,
    'TEXT' => preg_replace("/(\r\n)/", "' + '", $prjtags['TEXT']),
    'SHORTTEXT' => preg_replace("/(\r\n)/", "' + '", $prjtags['SHORTTEXT']),
   ));

   $t_i->assign($prjtags);
   $t_i->parse("MAIN");
   $t_s->assign('CONTENT', preg_replace("/('|\"|\r?\n)/", '', $t_i->text("MAIN")));

   $t_s->parse('MAIN');
   $prdmap = $t_s->text('MAIN');
  }
 else
 {
  $prdmap = '';
 }

 return $prdmap;
}

function cot_prdmap_geoinfo_to_map($geocity = '')
{
	global $db_ls_cities, $db;
  $geo_search = $db->query(
	"SELECT * FROM $db_ls_cities WHERE city_name='$geocity'")->fetch();
  if (!empty($geo_search)) {
    $geoinfo = $geo_search['city_id'];
  }
  return $geoinfo;
}

function cot_prdmap_getdistance($latlng = '', $urr = array(), $type = 'value')
{
  $return = ($type == 'text') ? '' : 0;
  $latlng = (stristr($latlng, '#') === FALSE) ? array(0 => 'empty', 1 => $latlng) : explode("#", $latlng);

  $latlng2 = explode("#", $urr['user_prdmap']);

  if(is_array($latlng) && is_array($latlng2))
  {
   $latlng = explode(",", $latlng[1]);
   $latlng2 = explode(",", $latlng2[1]);

   $lat1 = $latlng[0];
   $lng1 = $latlng[1];

   $lat2 = $latlng2[0];
   $lng2 = $latlng2[1];

   if($lat1 && $lng1 && $lat2 && $lng2)
   {
     $lat1=deg2rad($lat1);
     $lng1=deg2rad($lng1);
     $lat2=deg2rad($lat2);
     $lng2=deg2rad($lng2);

     $delta_lat=($lat2 - $lat1);
     $delta_lng=($lng2 - $lng1);

     $return = ($lat1 == $lat2 && $lng1 == $lng2) ? 1 : round( 6378137 * acos( cos( $lat1 ) * cos( $lat2 ) * cos( $lng1 - $lng2 ) + sin( $lat1 ) * sin( $lat2 ) ) );
     if($type != 'check')
     {
      if($type == 'text')
      {
        $return = ($return > 1000) ? ($return/1000)." км" : $return." м";
      }
     }
     elseif($type == 'check')
     {
      $return = true;
     }
   }
   elseif($type == 'check')
   {
      $return = true;
   }
  }
  elseif($type == 'check')
  {
    $return = true;
  }

  return $return;
}
