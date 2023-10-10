<?php

/**
 * Dialog System
 * @version 2.2
 * @package DS
 * @copyright (c) Alexeev Vlad
 */
defined('COT_CODE') or die('Wrong URL');

require_once cot_incfile('ds', 'module');
require_once cot_incfile('extensions');

$title_params = array(
	'DS' => $L['ds_dialogs'],
);
$out['subtitle'] = cot_title('{DS}', $title_params);
$out['head'] .= $R['code_noindex'];

require_once $cfg['system_dir'] . '/header.php';

$dialogs = $db->query("SELECT * FROM $db_ds_dialog ORDER BY lastmsg DESC")->fetchAll();
$t = new XTemplate(cot_tplfile(array('ds', 'admin.list')));
foreach ($dialogs as $row)
{  
  $msgfilter = "(dialog = '".$row['id']."')";
  $msg = $db->query("SELECT * FROM $db_ds_msg WHERE $msgfilter ORDER BY id DESC LIMIT 1")->fetch();   //получаем последнее сообщение из диалога

	$t->assign(array(
  	'DS_DELETE' => cot_url('admin', 'm=ds&act=chatdelete&chat='.$row['id']),
		'DS_DATE' => cot_date('datetime_medium', $msg['date']),
		'DS_DATE_STAMP' => $msg['date'],
    'DS_TIME_AGO' => cot_build_timeago($msg['date']),
		'DS_DIAOG_URL' => cot_url('admin', 'm=ds&act=show&chat='.$msg['dialog']),   //ссылка на диалог
    'DS_STATUS' => $msg['status'],  //прочитано или нет
		'DS_TEXT' => cot_string_truncate($msg['text'], 65, true, false, "..."),   //сокрашенный текст где 65 это колл-во символов после чего сокращяем
	));
	$t->assign(cot_generate_usertags($row['toid'], 'DS_TO_USER_'));
  $t->assign(cot_generate_usertags($row['fromid'], 'DS_FROM_USER_'));

	$t->parse('MAIN.DS_ROW');
}

if (!$cfg['ds']['hideimport'])
{
$import = cot_import('import', 'G', 'BOL');
$t_im = new XTemplate(cot_tplfile(array('ds', 'admin.import')));

  if ($import)
  {
    $run = cot_extension_resume('pm');
    if (!$run)
    {
      $pause = cot_extension_pause('pm');
      $run = ($pause) ? cot_extension_resume('pm') : false;
    }
    
    if ($run)
    {
    require_once cot_incfile('pm', 'module');
    $sql = $db->query("SELECT COUNT(*) FROM $db_pm")->fetchColumn();
    if ($sql != 0)
    {
     cot_import_old_pm();
 		 $t_im->assign(array(
		  	'IMPORT_PM' => $sql,
		 ));

		 $t_im->parse('MAIN.SUCCESS');
    }
    else
    {
		  $t_im->parse('MAIN.ERROR');    
    }
     cot_extension_pause('pm');
    }
    else
    {
     $t_im->parse('MAIN.ERROR2');
    }
  }
  else
  {
		$t_im->assign(array(
			'IMPORT_PM' => cot_url('admin', 'm=ds&import=1'),
		));

		$t_im->parse('MAIN.IMPORT');
  }
  $t_im->parse('MAIN');
  $t->assign(array('ADMIN_IMPORT' => $t_im->text("MAIN")));
}

$t->parse('MAIN');
$adminmain = $t->text("MAIN");
