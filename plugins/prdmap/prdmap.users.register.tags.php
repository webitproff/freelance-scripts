<?php

/* ====================
  [BEGIN_COT_EXT]
  Hooks=users.register.tags
  [END_COT_EXT]
  ==================== */

defined('COT_CODE') or die('Wrong URL.');

require_once cot_incfile('prdmap', 'plug');
$t->assign('USERS_REGISTER_PRDMAP', cot_prdmap_user_form($urr));


