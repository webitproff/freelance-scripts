<?php

/* ====================
  [BEGIN_COT_EXT]
  Hooks=index.tags
  Tags=index.tpl:{INDEX_PRDMAP}
  [END_COT_EXT]
  ==================== */

defined('COT_CODE') or die('Wrong URL.');

if (cot_plugin_active('locationselector'))
{
  require_once cot_incfile('prdmap', 'plug');
  $center = cot_prdmap_geoinfo_to_map($cfg['plugin']['prdmap']['center']);

  $t_i = new XTemplate(cot_tplfile(array('prdmap', 'infowindow'), 'plug'));
  $t_m = new XTemplate(cot_tplfile(array('prdmap', 'index'), 'plug'));

  $mapwhere = 'AND item_city='.$center;

  /* === Hook === */
  foreach (cot_getextplugins('prdmap.query') as $pl)
  {
  	include $pl;
  }
  /* ===== */

  $t_m->assign(array(
    'MAP_CENTER' => $mapcenter,
  ));

  if ($mapzoom)
  {
   $t_m->assign(array(
    'MAP_ZOOM_FIX' => $mapzoom,
   ));
  }

  if ($center)
  {
  $sqllist = $db->query("SELECT * FROM $db_market
    WHERE item_state=0 ".$mapwhere."
  	ORDER BY item_date DESC
  	". ($cfg['plugin']['prdmap']['indexlimit'] > 0 ? " LIMIT ".$cfg['plugin']['prdmap']['indexlimit'] : ''));

   foreach($sqllist->fetchAll() as $item)
   {
    $prjtags = cot_generate_markettags($item, 'PRD_ROW_');
    $t_m->assign($prjtags);
    $t_m->assign(array(
    'PRD_ROW_TEXT' => preg_replace("/(\r\n)/", "' + '", $prjtags['PRD_ROW_TEXT']),
    'PRD_ROW_SHORTTEXT' => preg_replace("/(\r\n)/", "' + '", $prjtags['PRD_ROW_SHORTTEXT']),
    ));

    $t_i->assign($prjtags);
    $t_i->parse("MAIN");
    $t_m->assign('CONTENT', preg_replace("/('|\"|\r?\n)/", '', $t_i->text("MAIN")));

  	$t_m->parse("MAIN.PRDMAP_ROWS");
   }
  }
  else
  {
    $t_m->assign(array('ERROR' => 1));
  }

  $t_m->parse("MAIN");
  $t->assign('INDEX_PRDMAP', $t_m->text("MAIN"));
}

