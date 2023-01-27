<?php

/**
 * Dialog System
 * @version 2.2
 * @package DS
 * @copyright (c) Alexeev Vlad
 */

defined('COT_CODE') or die('Wrong URL');

require_once cot_incfile('forms');

list($usr['auth_read'], $usr['auth_write'], $usr['isadmin']) = cot_auth('ds', 'a');
cot_block($usr['auth_read']);

$chatid = cot_import('chat','G','INT');

if (empty($chatid))
{
  cot_redirect(cot_url('ds')); 
}

/* === Hook === */
foreach (cot_getextplugins('ds.first') as $pl)
{
	include $pl;
}
/* ===== */

$dialogsql = $db->query("SELECT * FROM $db_ds_dialog WHERE id = $chatid LIMIT 1")->fetch();    //определяем диалог

If (empty($dialogsql) || (($dialogsql['fromid'] != $usr['id']) && ($dialogsql['toid'] != $usr['id'])))     //проверяем есть ли такой чат для этого пользователя
{
	cot_redirect(cot_url('ds'));
}

$opponent = ($dialogsql['fromid'] == $usr['id']) ? $dialogsql['toid'] : $dialogsql['fromid'];  //определяем c кем переписка 
$newpm = ($dialogsql['fromid'] == $usr['id']) ? $dialogsql['fromstatus'] : $dialogsql['tostatus'];  //определяем есть ли в диалоге новые сообщения для меня
$state = ($dialogsql['fromid'] == $usr['id']) ? array('fromstatus' => '0') : array('tostatus' => '0');
  
$oppname = $db->query("SELECT user_name FROM $db_users WHERE user_id = $opponent LIMIT 1")->fetch();    //для вывода в название

$title[] = array(cot_url('ds'), $L['Private_Messages']);

$title_params = array(
	'DIALOG' => $L['ds_dialogwith'],
	'OPP' => $oppname['user_name'],
);
$out['subtitle'] = cot_title('{DIALOG} {OPP}', $title_params);
$out['head'] .= $R['code_noindex'];

/* === Hook === */
foreach (cot_getextplugins('ds.main') as $pl)
{
	include $pl;
}
/* ===== */

require_once $cfg['system_dir'] . '/header.php';
if (COT_AJAX)
{
 $t = new XTemplate(cot_tplfile(array('ds', 'dialog' , 'header')));
}
else
{
 $t = new XTemplate(cot_tplfile(array('ds', 'dialog')));
}

if (!COT_AJAX)
{
 $t->assign(array('AJAX_OFF' => '1'));
}

$dialog_history = $db->query("SELECT * FROM $db_ds_msg WHERE dialog = '".$chatid."' ORDER BY id ASC")->fetchAll();
if (!empty($dialog_history))
{           
  if (isset($_SESSION['dialogs'][$opponent]))       //оптимизация, записываем тэги в сессию, что бы не генерировать их при каждом запросе
  {
   $opptags = $_SESSION['dialogs'][$opponent];
  }else{
   $opptags = cot_generate_usertags($opponent, 'DS_ROW_USER_');
   $_SESSION['dialogs'][$opponent] = $opptags;
  }
  if (isset($_SESSION['dialogs']['my']))
  {
   $usrtags = $_SESSION['dialogs']['my'];
  }else {
   $usrtags = cot_generate_usertags($usr['id'], 'DS_ROW_USER_');
   $_SESSION['dialogs']['my'] = $usrtags;
  }                                               //конец оптимизаии (скорость созд.стр примерно на 0.03 - 0.04 сек меньше уже при 10-ти сообщениях)

  /* === Hook - Part1 : Set === */
	$extp = cot_getextplugins('ds.history.loop');
	/* ===== */
  
	foreach ($dialog_history as $row)
	{
  
   $dsfile = $db->query("SELECT * FROM $db_ds_files WHERE file_mid=" . $row['id'] . " LIMIT 1")->fetch();
	  if(!empty($dsfile) && (count($dsfile) > 0))
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
			'DS_ROW_DATE' => cot_date('j F, H:i', $row['date']),
			'DS_ROW_DATE_STAMP' => $row['date'],
			'DS_ROW_TEXT' => $row['text'],
      'DS_ROW_STATUS' => $row['status'],
		));
    
    if ($row['touser'] == $usr['id'])
    {
    $t->assign($opptags);
    }else{
		$t->assign($usrtags);
    }
		/* === Hook - Part2 : Include === */
		foreach ($extp as $pl)
		{
			include $pl;
		}
		/* ===== */

		$t->parse('MAIN.DS_ROW');
	}

  if ($newpm == 1)
  {
   $pmsql = $db->update($db_ds_msg, array('status' => '0'), "dialog = ".(int)$chatid." AND touser = ".(int)$usr['id']." AND status = 1");
   $pmsql = $db->update($db_ds_dialog, $state, "id = ".(int)$chatid."");
  }
}
else
{
	$t->parse('MAIN.DS_ROW_EMPTY');
}

	$t->assign(array(
    'DIALOG_ID' => $chatid,
		'DS_FORM_SEND' => cot_url('ds', 'm=ajax&a=send&chat='.$chatid),
		'DS_FORM_TEXT' => cot_textarea('newpmtext', $newpmtext, 4, 56),
	));

$title[] = array(cot_url('users', 'm=details&id='.$opptags['DS_ROW_USER_ID'].'&u='.$opptags['DS_ROW_USER_NICKNAME']), $opptags['DS_ROW_USER_NICKNAME']);
$t->assign(array(
	'DS_PAGETITLE' => cot_breadcrumbs($title, $cfg['homebreadcrumb']),
));

/* === Hook === */
foreach (cot_getextplugins('ds.tags') as $pl)
{
	include $pl;
}
/* ===== */

$t->parse('MAIN');
$t->out('MAIN');

require_once $cfg['system_dir'] . '/footer.php';
