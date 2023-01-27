<?php
/* ====================
  [BEGIN_COT_EXT]
  Hooks=projects.list.tags
  Tags=projects.list.tpl:{PRJ_PRJMAP}
  [END_COT_EXT]
  ==================== */

defined('COT_CODE') or die('Wrong URL.');

require_once cot_incfile('prdmap', 'plug');

if (cot_plugin_active('locationselector'))
{
  $center = cot_prdmap_geoinfo_to_map($cfg['plugin']['prdmap']['center']);

  $t_i = new XTemplate(cot_tplfile(array('prdmap', 'infowindow', 'row'), 'plug'));
  $t_m = new XTemplate(cot_tplfile(array('prdmap', 'list'), 'plug'));

  //$mapwhere = ($where) ? $where.' AND item_city='.$center : 'WHERE item_state=0 AND item_city='.$center;
  $mapwhere = $where;

  //if(!$_GET['city'] && $center > 0 && $mapwhere == 'WHERE item_state=0') $mapwhere = 'WHERE item_state=0 AND item_city='.$center;
  if(!$_GET['city'] && $center > 0 && $mapwhere == 'WHERE item_state=0') {
    $mapwhere = 'WHERE item_state=0';
    $mapzoom = 3;
  }
  if($_GET['region'] > 0) {
    $mapzoom = 6;
  }

  /* === Hook === */
  foreach (cot_getextplugins('prdmap.query') as $pl)
  {
  	include $pl;
  }
  /* ===== */

  $t_m->assign(array(
    'MAP_CENTER' => ($_GET['city'] > 0 ? cot_getcity($_GET['city']) : ($_GET['region'] > 0 ? cot_getregion($_GET['region']) : '')),
    'MAP_ZOOM_FIX' => $mapzoom,
   ));

    $sqllist = $db->query("SELECT * FROM $db_projects
      ".$mapwhere."
    	ORDER BY item_date DESC
      ".($cfg['plugin']['prdmap']['indexlimit'] > 0 ? " LIMIT ".$cfg['plugin']['prdmap']['indexlimit'] : ''));

   foreach($sqllist->fetchAll() as $item)
   {
    $prjtags = cot_generate_projecttags($item, 'PRD_ROW_');
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

  $t_m->parse("MAIN");
  $t->assign('PRDMAP', $t_m->text("MAIN"));
}
$showmapradius = (isset($_GET['city']) || $usr_geoinfo['city'] > 0);
$t->assign('SEARCH_PRDMAP_RADIUS', cot_selectbox(($_GET['mapradius'] ? $_GET['mapradius'] : 0), "mapradius", array(0, 10, 25, 50, 100, 200, 250, 500), array('Укажите радиус', '10 км', '25 км', '50 км', '100 км', '200 км', '250 км', '500 км'), false));
