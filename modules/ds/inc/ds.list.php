<?php

/**
 * Dialog System
 * @version 2.2
 * @package DS
 * @copyright (c) Alexeev Vlad
 */

defined('COT_CODE') or die('Wrong URL');

list($usr['auth_read'], $usr['auth_write'], $usr['isadmin']) = cot_auth('ds', 'a');
cot_block($usr['auth_read']);
$type_g = cot_import('type', 'G', 'BOL'); 

/* === Hook === */
foreach (cot_getextplugins('ds.list.first') as $pl)
{
	include $pl;
}
/* ===== */

$title[] = array(cot_url('ds'), $L['Private_Messages']);

$dialogsfilter = "(toid = '".$usr['id']."') OR (fromid = '".$usr['id']."')";

/* === Hook === */
foreach (cot_getextplugins('ds.list.main') as $pl)
{
	include $pl;
}
/* ===== */

$title_params = array(
	'DS' => $L['ds_dialogs'],
);
$out['subtitle'] = cot_title('{DS}', $title_params);
$out['head'] .= $R['code_noindex'];

$dialogs = $db->query("SELECT * FROM $db_ds_dialog WHERE $dialogsfilter ORDER BY lastmsg DESC")->fetchAll();

require_once $cfg['system_dir'] . '/header.php';
if ($type_g)
{
$t = new XTemplate(cot_tplfile(array('ds', 'list' , 'header')));
}else{
$t = new XTemplate(cot_tplfile(array('ds', 'list')));
}

/* === Hook - Part1 : Set === */
$extp = cot_getextplugins('ds.list.loop');
/* ===== */
$jj = 0;
foreach ($dialogs as $row)
{
  $jj++;  //счетчик, если равен 0 то парсим "Диалогов нет"
  
  $msgfilter = "(dialog = '".$row['id']."')";
  $msg = $db->query("SELECT * FROM $db_ds_msg WHERE $msgfilter ORDER BY id DESC LIMIT 1")->fetch();   //получаем последнее сообщение из диалога
  
  $opponent = ($row['toid'] == $usr['id']) ? $row['fromid'] : $row['toid'];  //определяем с каким пользователем идет переписка в этом диалоге  
  $from_user = ($msg['touser'] == $usr['id']) ? $opponent : $usr['id'];  //определяем кто его отправил

  $msg['text_tmp'] = explode('<br />', $msg['text']);
  $msg['text'] = strip_tags($msg['text_tmp'][0]);
  
	$t->assign(array(
		'DS_DATE' => cot_date('datetime_medium', $msg['date']),
		'DS_DATE_STAMP' => $msg['date'],
    'DS_TIME_AGO' => cot_build_timeago($msg['date']),
		'DS_DIAOG_URL' => cot_url('ds', 'm=dialog&chat='.$msg['dialog']),   //ссылка на диалог
    'DS_STATUS' => $msg['status'],  //прочитано или нет
		'DS_TEXT' => cot_string_truncate($msg['text'], 65, true, false, "..."),   //сокрашенный текст где 65 это колл-во символов после чего сокращяем
	));
	$t->assign(cot_generate_usertags($opponent, 'DS_OPPONENT_'));
  $t->assign(cot_generate_usertags($from_user, 'DS_FROM_USER_'));
	/* === Hook - Part2 : Include === */
	foreach ($extp as $pl)
	{
		include $pl;
	}
	/* ===== */

	$t->parse('MAIN.DS_ROW');
}

if ($jj == 0)
{
	$t->parse('MAIN.DS_ROW_EMPTY');
}

$t->assign(array(
	'DS_PAGETITLE' => cot_breadcrumbs($title, $cfg['homebreadcrumb']),
	'DS_SUBTITLE' => $subtitle,
));

/* === Hook === */
foreach (cot_getextplugins('ds.list.tags') as $pl)
{
	include $pl;
}
/* ===== */

$t->parse('MAIN');
$t->out('MAIN');

require_once $cfg['system_dir'] . '/footer.php';
