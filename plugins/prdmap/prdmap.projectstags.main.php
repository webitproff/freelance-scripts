<?php

/* ====================
  [BEGIN_COT_EXT]
  Hooks=projectstags.main
  Tags=projects.tpl:{PRJ_PRDMAP_ADR};projects.list.tpl:{PRJ_PRDMAP_ADR}
  [END_COT_EXT]
  ==================== */

defined('COT_CODE') or die('Wrong URL.');

if($item_data['item_id'] > 0)
{
 require_once cot_incfile('prdmap', 'plug');
 global $usr;
 $adr = explode('#', $item_data['item_prdmap']);
 $temp_array['PRDMAP_ADR'] = $adr[0];
 $temp_array['PRDMAP_LAT'] = $item_data['item_prdmaplat'];
 $temp_array['PRDMAP_LNG'] = $item_data['item_prdmaplng'];
 $temp_array['PRDMAP_DIST'] = cot_prdmap_getdistance($item_data['item_prdmap'], $usr['profile'], 'text');

 $temp_array['PRDMAP'] = cot_get_prdmap_map($item_data, $temp_array);
}
