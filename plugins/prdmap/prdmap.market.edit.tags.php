<?php

/* ====================
  [BEGIN_COT_EXT]
  Hooks=market.edit.tags
  Tags=market.edit.tpl:{PRDEDIT_FORM_PRDMAP}
  [END_COT_EXT]
  ==================== */


defined('COT_CODE') or die('Wrong URL.');

require_once cot_incfile('prdmap', 'plug');
$route = cot_prdmap_form($item);
$t->assign('PRDEDIT_FORM_PRDMAP', $route);


