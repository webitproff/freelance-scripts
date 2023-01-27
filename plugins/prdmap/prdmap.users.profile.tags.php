<?php

/* ====================
  [BEGIN_COT_EXT]
  Hooks=users.profile.tags
  Tags=users.profile.tpl:{USERS_PROFILE_PRDMAP}
  [END_COT_EXT]
  ==================== */

defined('COT_CODE') or die('Wrong URL.');

require_once cot_incfile('prdmap', 'plug');
$t->assign('USERS_PROFILE_PRDMAP', cot_prdmap_user_form($urr));
