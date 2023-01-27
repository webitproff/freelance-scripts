<?php
/* ====================
  [BEGIN_COT_EXT]
  Hooks=usertags.main
  [END_COT_EXT]
  ==================== */

defined('COT_CODE') or die('Wrong URL.');

if($user_data['user_id'] > 0)
{
 $adr = explode('#', $user_data['user_prdmap']);
 $temp_array['PRDMAP'] = $adr[0];
}

?>