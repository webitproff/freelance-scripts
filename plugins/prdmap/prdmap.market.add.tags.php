<?php

/* ====================
  [BEGIN_COT_EXT]
  Hooks=market.add.tags
  Tags=market.add.tpl:{PRDADD_FORM_PRDMAP}
  [END_COT_EXT]
  ==================== */

defined('COT_CODE') or die('Wrong URL.');

require_once cot_incfile('prdmap', 'plug');
$route = cot_prdmap_form(array(), 'prd');
$t->assign('PRDADD_FORM_PRDMAP', $route);


