<?php

/* ====================
  [BEGIN_COT_EXT]
  Hooks=projects.add.add.import,projects.edit.update.import
  [END_COT_EXT]
  ==================== */

defined('COT_CODE') or die('Wrong URL.');

$waypoints = cot_import('ritemprdmap', 'P', 'TXT');
$ritem['item_prdmap'] = '';
$ritem['item_prdmaplat'] = 0;
$ritem['item_prdmaplng'] = 0;

if (!empty($waypoints))
{
 $ritem['item_prdmap'] = $waypoints;
 $waypoints = explode('#', $waypoints);
 $waypoints = str_replace(array('(', ')'), array('', ''), $waypoints[1]);
 $waypoints = explode(',', $waypoints);

 if(is_numeric((float)$waypoints[0]) && is_numeric((float)$waypoints[1])) {
   $ritem['item_prdmaplat'] = (float)$waypoints[0];
   $ritem['item_prdmaplng'] = (float)$waypoints[1];
 }
}
