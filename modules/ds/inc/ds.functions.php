<?php
/**
 * DS function.
 * @version 2.2
 * @package DS
 * @copyright (c) Alexeev Vlad (http://cmsworks.ru/users/alexvlad)
 */

defined('COT_CODE') or die('Wrong URL');

// Requirements
require_once cot_langfile('ds', 'module');

cot::$db->registerTable('ds_msg');
cot::$db->registerTable('ds_dialog');
$db_ds_files = (isset($db_ds_files)) ? $db_ds_files : $db_x . 'ds_files';
cot::$cfg['ds']['turnajax'] = cot::$cfg['ds']['turnajax'] && cot::$cfg['jquery'] && cot::$cfg['turnajax'];

function cot_chat_id($fromuserid=0, $touserid=0)
{
	global $db, $db_ds_dialog;
	$sql = $db->query("SELECT * FROM $db_ds_dialog WHERE (fromid =$fromuserid AND toid =$touserid) OR (fromid =$touserid AND toid =$fromuserid) LIMIT 1")->fetch();
	return ($sql['id'] > 0 ? $sql['id'] : 0);
}

function cot_create_chat($fromuserid=0,$touserid=0)
{
	global $db, $db_ds_dialog;
  $result = 0;
  $create_chat = array();
  $create_chat['lastmsg'] = (int)$sys['now'];
  $create_chat['fromid'] = $fromuserid;
	$create_chat['toid'] = $touserid;
  if (!empty($fromuserid) && !empty($fromuserid))
  { 
  	$chatsql = $db->insert($db_ds_dialog, $create_chat);
  	$result = $db->lastInsertId();
  }
	return $result;
}


/// ФУНКЦИЮ (cot_import_old_pm) которая ниже УДАЛИТЬ после установки и успешного импорта сообщений

/* function cot_import_old_pm()
{
global $db, $db_pm, $db_ds_msg, $db_ds_dialog;

cot::$db->registerTable('pm');

$ol = $db->query("SELECT COUNT(*) FROM $db_ds_msg")->fetchColumn();
if ($ol == 0)
{   
$sql = $db->query("SELECT * FROM $db_pm ORDER BY pm_id ASC")->fetchAll();
if (!empty($sql))
{
  foreach ($sql as $row)
	{
    $to = $row['pm_touserid'];
    $from = $row['pm_fromuserid'];
    $dialog = $db->query("SELECT * FROM $db_ds_dialog WHERE (fromid =$from AND toid =$to) OR (toid =$to AND fromid =$from) LIMIT 1")->fetch();
    if (!empty($dialog['id']))
     {
      $temp = $dialog['id'];
     }
  	 else
     {
      $create = array(
       'fromid' => $from,
       'toid' => $to,
       'fromstatus' => '0',
       'tostatus' => '0',
      );

	    $dialogsql = $db->insert($db_ds_dialog, $create);
 
	    $getdialog = $db->query("SELECT * FROM $db_ds_dialog WHERE fromid =$from AND toid =$to LIMIT 1")->fetch();
	    $temp = $getdialog['id']; 
     }
     
    $update = array(
     'date' => $row['pm_date'],
     'dialog' => $temp,
     'text' => $row['pm_text'],
     'status' => '0',
     'touser' => $row['pm_touserid'],
     );
     
     $pmsql = $db->insert($db_ds_msg, $update);
  }
 }
}
}
 */
