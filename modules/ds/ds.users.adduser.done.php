<?php

/**
 * [BEGIN_COT_EXT]
 * Hooks=users.adduser.done
 * [END_COT_EXT]
 */


defined('COT_CODE') or die('Wrong URL.');

global $db, $db_users, $cfg, $sys;

cot_log('$userid='.$userid, 'plg');
cot_log('wpm_message='.$cfg['ds']['wpm_message'], 'plg');
cot_log('wpm_fromuserid='.$cfg['ds']['wpm_fromuserid'], 'plg');
cot_log('cnt='.$db->query("SELECT COUNT(*) FROM $db_users WHERE user_id=".$cfg['ds']['wpm_fromuserid'])->fetchColumn() , 'plg');

if ($userid > 0 && !empty($cfg['ds']['wpm_message']) && $cfg['ds']['wpm_fromuserid'] > 0 && $db->query("SELECT COUNT(*) FROM $db_users WHERE user_id=".$cfg['ds']['wpm_fromuserid'])->fetchColumn() > 0)
{
  require_once cot_incfile('ds', 'module');

  global $db_ds_dialog, $db_ds_msg;

  $chatid = cot_chat_id((int)$cfg['ds']['wpm_fromuserid'],$userid);
  if (!empty($chatid)) {
    $pm['dialog'] = (int)$chatid;
  }
  else
  {
    $chatid = cot_create_chat((int)$cfg['ds']['wpm_fromuserid'],$userid);
	 	$pm['dialog'] = (int)$chatid;
  }

  cot_log('dial='.$pm['dialog'], 'plg');

  $pm['date'] = (int)$sys['now'];
	$pm['text'] = str_replace('{$user}', $ruser['user_name'], $cfg['ds']['wpm_message']);
  $pm['touser'] = $userid;
  $pmsql = $db->insert($db_ds_msg, $pm);

  $fornewpm = $db->query("SELECT * FROM $db_ds_dialog WHERE id = $chatid LIMIT 1")->fetch();
  $state = ($fornewpm['fromid'] == $userid) ? array('fromstatus' => '1') : array('tostatus' => '1');
  $state = $state + array('lastmsg' => (int)$sys['now']);
  $pmsql = $db->update($db_ds_dialog, $state, "id = ".(int)$chatid."");
}