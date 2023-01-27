<?php

/**
 * Dialog System
 * @version 2.2
 * @package DS
 * @copyright (c) Alexeev Vlad
 */

defined('COT_CODE') or die('Wrong URL');


$chatid = cot_import('chat', 'G', 'INT');
$a = cot_import('a', 'G', 'TXT');
$checkmsg = cot_import('checkmsg', 'G', 'TXT');

/* === Hook === */
foreach (cot_getextplugins('ds.ajax.first') as $pl)
{
	include $pl;
}
/* === Hook === */

cot_sendheaders();
$result = array();

if (!empty($chatid))
{
  $dialogsql = $db->query("SELECT * FROM $db_ds_dialog WHERE id = $chatid LIMIT 1")->fetch();    //определяем диалог
  
  if (!empty($dialogsql) || !(($dialogsql['fromid'] != $usr['id']) && ($dialogsql['toid'] != $usr['id'])))     //проверяем есть ли такой диалог для этого пользователя
  {
   $to = ($dialogsql['fromid'] == $usr['id']) ? $dialogsql['toid'] : $dialogsql['fromid'];  //определяем с кем диалог  
   $newpm = ($dialogsql['fromid'] == $usr['id']) ? $dialogsql['fromstatus'] : $dialogsql['tostatus'];  //определяем есть ли в диалоге новые сообщения для меня
   $tonewpm = ($dialogsql['fromid'] == $usr['id']) ? array('tostatus' => '1') : array('fromstatus' => '1');  //для установки статуса нового сообщения для собеседника
   $readpm =  ($dialogsql['fromid'] == $usr['id']) ? array('fromstatus' => '0') : array('tostatus' => '0'); //для того что бы указать что сообщения прочитаны
   
  $opptags = $_SESSION['dialogs'][$to];     //получаем тэги собеседника
  $usrtags = $_SESSION['dialogs']['my'];    //получаем наши тэги 
      
  $t = new XTemplate(cot_tplfile(array('ds', 'newmsg')));
   
   if ($a == 'update')  //если мы обновляем
   {    
    if ($newpm == 0)   //если нет сообщении
    {
     $result[0] = false;
    }
    else  //если есть
    { 
     $result[0] = true;  
     $newmsg = $db->query("SELECT * FROM $db_ds_msg WHERE dialog = '".$chatid."' AND status = 1 AND touser = '".$usr['id']."' ORDER BY id ASC")->fetchAll();

     $pmsql = $db->update($db_ds_dialog, $readpm, "id = ".(int)$chatid."");   //убираем статус непрочитанных сообщений

     /* === Hook - Part1 : Set === */
     $extp = cot_getextplugins('ds.newmsg.loop');
	   /* ===== */
  
     $t->assign($opptags);
        
     foreach ($newmsg as $row)
	   {    
       $dsfile = $db->query("SELECT * FROM $db_ds_files WHERE file_mid=" . $row['id'] . " LIMIT 1")->fetch();
	     if(count($dsfile) != 0)
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
      
		  /* === Hook - Part2 : Include === */
		  foreach ($extp as $pl)
		  {
			 include $pl;
		  }
		  /* ===== */
      $pmsql = $db->update($db_ds_msg, array('status' => '0'), "dialog = ".(int)$chatid."");   //ставим статус то что сообщение прочитано
		  $t->parse('MAIN.INBOX');
	   }
     
    }
    if($checkmsg)
    {
      $msgarray = explode(',', $checkmsg);
      if(count($msgarray) == 1)
      {
        $msgwhere = "id=".$checkmsg;
      }
      else
      {
        $msgwhere = "id='".implode("' OR id='", $msgarray)."'";
      }
      $msgsql = $db->query("SELECT * FROM $db_ds_msg WHERE $msgwhere")->fetchAll();
      
      unset($msgarray);
      
      foreach($msgsql as $row)
      {
        if($row['status'] == 0)
        {
          $msgarray[] = $row['id'];
        }
      }
      $result[3] = count($msgarray);
      $result[4] = $msgarray;
    }
    else
    {
     $result[3] = false;
    }
     
  }elseif ($a == 'send')      //если это отправка сообщения
  {
   /* === Hook === */
	 foreach (cot_getextplugins('ds.ajax.send.first') as $pl)
	 {
		include $pl;
	 }
 	 /* ===== */
    
    $pmfiles = $_FILES['msgfile'];

    $newpmtext = cot_import('newpmtext', 'P', 'HTM');
          
    if ($pmfiles['size'] > 0 && $pmfiles['error'] == 0 && mb_strlen($newpmtext) == 0)
    {
      $newpmtext = $L['ds_upload'];
    }
         
	  if (mb_strlen($newpmtext) < 2)
  	{
		   $t->assign(array('ERROR_MSG' => $L['ds_shortmsg'],));
		   $t->parse('MAIN.ERROR');
	  }
    else
    {
    
    if ($pmfiles['size'] > 0 && $pmfiles['error'] == 0)
     {
			$t->assign(array(
  			'ERROR_FULL' => 1,
  		));

      $newpmtext = $L['ds_upload'];

      $ds_path = (!empty($cfg['ds']['filepath']) ? $cfg['ds']['filepath'] : 'datas/ds') . '/';
			if (!file_exists($ds_path))
			{
				mkdir($ds_path);
				@chmod($ds_path, $cfg['dir_perms']);
			}
      if($pmfiles['size'] > 0 && $pmfiles['error'] == 0)
				{
					$u_tmp_name_file = $pmfiles['tmp_name'];
					$u_type_file = $pmfiles['type'];
					$u_name_file = $pmfiles['name'];
					$u_size_file = $pmfiles['size'];

					$u_name_file  = str_replace("\'",'',$u_name_file );
					$u_name_file  = trim(str_replace("\"",'',$u_name_file ));
					$dotpos = strrpos($u_name_file,".")+1;
					$f_extension = substr($u_name_file, $dotpos, 5);

					if(!empty($u_tmp_name_file))
					{
						$fcheck = cot_file_check($u_tmp_name_file, $u_name_file, $f_extension);
						if($fcheck == 1){
							if(in_array($f_extension, explode(',', $cfg['ds']['extensions'])))
							{              
                $pm['dialog'] = (int)$chatid;
 								$pm['date'] = (int)$sys['now'];
								$pm['text'] = $newpmtext; 
  							$pm['touser'] = $to;
   	  				  $pmsql = $db->insert($db_ds_msg, $pm);
   							$pm['id'] = $db->lastInsertId();
     
   							$tonewpm = $tonewpm + array('lastmsg' => (int)$sys['now']);
  							$pmsql = $db->update($db_ds_dialog, $tonewpm, "id = ".(int)$chatid."");   //устанавливаем статус нового сообщения для собеседника
                
								$u_newname_file = $pm['id']."_".md5(uniqid(rand(),true)).".".$f_extension;
								$file = $ds_path . $u_newname_file;

								move_uploaded_file($u_tmp_name_file, $file);
								@chmod($file, 0766);

								$dsfile['file_mid'] = $pm['id'];
								$dsfile['file_url'] = $file;
								$dsfile['file_title'] = $u_name_file;
								$dsfile['file_ext'] = $f_extension;
								
								$db->insert($db_ds_files, $dsfile);
                
                $t->assign($usrtags);
								$t->assign(array(
  								 'DS_ROW_ID' => $pm['id'],
									 'DS_ROW_DATE' => cot_date('j F, H:i', $pm['date']),
									 'DS_ROW_DATE_STAMP' => $pm['date'],
									 'DS_ROW_TEXT' => $pm['text'],
							     'FILE_ROW_URL' => $dsfile['file_url'],
							     'FILE_ROW_TITLE' => $dsfile['file_title'],
							     'FILE_ROW_EXT' => $dsfile['file_ext'],
  				      ));
								$t->parse('MAIN.OUTBOX');
							}
              else
              {
               	$t->assign(array('ERROR_MSG' => $L['ds_wrongfile'],));
		            $t->parse('MAIN.ERROR');
              }
						}
            else
            {
                $t->assign(array('ERROR_MSG' => $L['ds_wrongfile'],));
		            $t->parse('MAIN.ERROR');
            }
					}
          else
          {
            $t->assign(array('ERROR_MSG' => $L['ds_wrongfile'],));
		        $t->parse('MAIN.ERROR');
          }
				}
     }
     else
     {
      $pm['dialog'] = (int)$chatid;
      $pm['date'] = (int)$sys['now'];
		  $pm['text'] = nl2br($newpmtext); 
      $pm['touser'] = $to;
      $pmsql = $db->insert($db_ds_msg, $pm);
      $pm['id'] = $db->lastInsertId();
     
      $tonewpm = $tonewpm + array('lastmsg' => (int)$sys['now']);
      $pmsql = $db->update($db_ds_dialog, $tonewpm, "id = ".(int)$chatid."");   //устанавливаем статус нового сообщения для собеседника
        
  		 /* === Hook === */
  		 foreach (cot_getextplugins('ds.ajax.send.done') as $pl)
  		 {
  		 	include $pl;
  		 }
       /* === Hook === */
     
      if (!$cfg['ds']['turnajax'] || !COT_AJAX) {             //если выключен ajax то возвращаемся обратно
       cot_redirect(cot_url('ds', 'm=dialog&chat='.$chatid, '', true));
      }
      
      $t->assign($usrtags);
		  $t->assign(array(
       'DS_ROW_ID' => $pm['id'],
			 'DS_ROW_DATE' => cot_date('j F, H:i', $pm['date']),
			 'DS_ROW_DATE_STAMP' => $pm['date'],
			 'DS_ROW_TEXT' => $pm['text'],
		  ));
    
     $t->parse('MAIN.OUTBOX');
     }
   }
    
	}else{$t->assign(array('ERROR_MSG' => $L['msg950_body'],));$t->parse('MAIN.ERROR');}              //парсим ошибку если она есть
 }else{$t->assign(array('ERROR_MSG' => $L['msg401_title'],));$t->parse('MAIN.ERROR');}
}

$t->parse('MAIN');
$result[1] = $t->text("MAIN");

if ($a == 'send')
{
 echo $result[1];
}
else
{
 $result[1] = htmlspecialchars($result[1]);
 echo json_encode($result);
}
exit;