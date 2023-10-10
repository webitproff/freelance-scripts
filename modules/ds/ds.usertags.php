<?php
/* ====================
[BEGIN_COT_EXT]
Hooks=usertags.main
[END_COT_EXT]
==================== */

defined('COT_CODE') or die('Wrong URL.');

require_once cot_incfile('ds', 'module');

global $L, $usr, $db, $db_ds_dialog;

$temp_array['DS_CHAT_ID'] = ($usr['id'] > 0 ? cot_chat_id((int)$usr['id'], (int)$user_data['user_id']) : 0);
$temp_array['DS_CHAT_URL'] = cot_url('ds', 'm=dialog&chat='.$temp_array['DS_CHAT_ID']);
$temp_array['DS_SEND_URL'] = cot_url('ds', 'm=send&to='.$user_data['user_id']);