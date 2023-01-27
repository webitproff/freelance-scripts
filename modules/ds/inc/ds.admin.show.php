<?php

/**
 * Dialog System
 * @version 2.2
 * @package DS
 * @copyright (c) Alexeev Vlad
 */

defined('COT_CODE') or die('Wrong URL');

require_once cot_incfile('ds', 'module');
require_once cot_incfile('forms');

list($usr['auth_read'], $usr['auth_write'], $usr['isadmin']) = cot_auth('ds', 'a');
cot_block($usr['auth_read']);

$chat = cot_import('chat','G','INT');

$sql = $db->query("SELECT * FROM $db_ds_dialog WHERE id = $chat LIMIT 1")->fetch();    //определяем диалог
$totags = cot_generate_usertags($sql['toid'], 'DS_ROW_USER_');
$fromtags = cot_generate_usertags($sql['fromid'], 'DS_ROW_USER_');

$title_params = array(
	'DIALOG' => $L['ds_dialogwith'],
);
$out['subtitle'] = cot_title('{DIALOG} {OPP1} и {OPP2}', $title_params);
$out['head'] .= $R['code_noindex'];

$t = new XTemplate(cot_tplfile(array('ds', 'admin.show')));

$dialog_history = $db->query("SELECT * FROM $db_ds_msg WHERE dialog = '".$chat."' ORDER BY id ASC")->fetchAll();
if (!empty($dialog_history))
{  
	foreach ($dialog_history as $row)
	{
   $dsfile = $db->query("SELECT * FROM $db_ds_files WHERE file_mid=" . $row['id'] . " LIMIT 1")->fetch();
   	  if (!empty($dsfile) && count($dsfile) != 0)
	  //if(count($dsfile) != 0) было
	  {
     $t->assign(array(
			'FILE_ROW_URL' => $dsfile['file_url'],
			'FILE_ROW_TITLE' => $dsfile['file_title'],
			'FILE_ROW_EXT' => $dsfile['file_ext'],
     ));
	  }
    else
    {
     $t->assign(array(
			'FILE_ROW_URL' => 0,
     ));
    }
		$t->assign(array(
			'DS_ROW_ID' => $row['id'],
			'DS_ROW_DATE' => cot_date('H:i', $row['date']),
			'DS_ROW_DATE_STAMP' => $row['date'],
			'DS_ROW_TEXT' => $row['text'],
      'DS_ROW_READSTATUS' => $row['status'],
		));
    
    if ($row['touser'] == $fromtags['DS_ROW_USER_ID'])
    {
    $t->assign($totags);
    }else{
		$t->assign($fromtags);
    }
		$t->parse('MAIN.DS_ROW');
	}
}

$t->parse('MAIN');
$adminmain = $t->text("MAIN");
