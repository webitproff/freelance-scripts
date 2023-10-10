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
cot_block($usr['auth_write']);

$to = cot_import('to', 'G', 'INT');
$a = cot_import('a','G','TXT');

/* === Hook === */
foreach (cot_getextplugins('ds.send.first') as $pl)
{
	include $pl;
}
/* ===== */

if (!empty($to))
{
  if ($to != $usr['id'])
  {
   $touser = $db->query("SELECT * FROM $db_users WHERE user_id = $to LIMIT 1");  
   if ($touser->rowCount()!=0)
   {
    $touser = $touser->fetch();
    $chatid = cot_chat_id((int)$usr['id'],$to);
   }
   else
   {
    cot_die(); 
   }
  }
  else
  {
   cot_redirect(cot_url('ds'));
  }
}

if ($a == 'send')
{
	$newpmtext = cot_import('newpmtext', 'P', 'HTM');

  $pmfiles = $_FILES['msgfile'];

  if ($pmfiles['size'] > 0 && $pmfiles['error'] == 0 && mb_strlen($newpmtext) == 0)
  {
    $newpmtext = $L['ds_upload'];
  }

	if (mb_strlen($newpmtext) < 2)
	{
		cot_error('ds_bodytooshort', 'newpmtext');
	}

	/* === Hook === */
	foreach (cot_getextplugins('ds.send.send.first') as $pl)
	{
		include $pl;
	}
	/* ===== */

 if (!cot_error_found())
	{
    $pm = array();
    if (!empty($chatid)) {
      $pm['dialog'] = (int)$chatid;
    }
    else
    {
      $chatid = cot_create_chat((int)$usr['id'],$to);
  	 	$pm['dialog'] = (int)$chatid;
    }

    if ($pmfiles['size'] > 0 && $pmfiles['error'] == 0)
     {
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

								$u_newname_file = $pm['id']."_".md5(uniqid(rand(),true)).".".$f_extension;
								$file = $ds_path . $u_newname_file;

								move_uploaded_file($u_tmp_name_file, $file);
								@chmod($file, 0766);

								$dsfile['file_mid'] = $pm['id'];
								$dsfile['file_url'] = $file;
								$dsfile['file_title'] = $u_name_file;
								$dsfile['file_ext'] = $f_extension;

								$db->insert($db_ds_files, $dsfile);

                $fornewpm = $db->query("SELECT * FROM $db_ds_dialog WHERE id = $chatid LIMIT 1")->fetch();
                $state = ($fornewpm['fromid'] == $usr['id']) ? array('tostatus' => '1') : array('fromstatus' => '1');
                $state = $state + array('lastmsg' => (int)$sys['now']);
                $pmsql = $db->update($db_ds_dialog, $state, "id = ".(int)$chatid."");
							} else {
                cot_error('ds_wrongfile');
              }
						} else {
              cot_error('ds_wrongfile');
            }
					} else {
            cot_error('ds_wrongfile');
          }
				} else {
          cot_error('ds_wrongfile');
        }
     } else {
      $pm['date'] = (int)$sys['now'];
  		$pm['text'] = $newpmtext;
      $pm['touser'] = $to;
      $pmsql = $db->insert($db_ds_msg, $pm);

      $fornewpm = $db->query("SELECT * FROM $db_ds_dialog WHERE id = $chatid LIMIT 1")->fetch();
      $state = ($fornewpm['fromid'] == $usr['id']) ? array('tostatus' => '1') : array('fromstatus' => '1');
      $state = $state + array('lastmsg' => (int)$sys['now']);
      $pmsql = $db->update($db_ds_dialog, $state, "id = ".(int)$chatid."");

  		/* === Hook === */
  		foreach (cot_getextplugins('ds.send.send.done') as $pl)
  		{
  			include $pl;
  		}
  		/* ===== */
    }
    cot_redirect(cot_url('ds'));
	}
}

$title_params = array(
	'DS' => $L['Private_Messages'],
	'SEND_NEW' => $L['ds_sendnew']
);
$out['subtitle'] = cot_title('{SEND_NEW} - {DS}', $title_params);
$out['head'] .= $R['code_noindex'];

/* === Hook === */
foreach (cot_getextplugins('ds.send.main') as $pl)
{
	include $pl;
}
/* ===== */
   
require_once $cfg['system_dir'] . '/header.php';
$t = new XTemplate(cot_tplfile(array('ds', 'send')));

cot_display_messages($t);

$title[] = array(cot_url('ds'), $L['Private_Messages']);
$title[] = $L['dssend_title'];

$t->assign(array(
	'DSSEND_TITLE' => cot_breadcrumbs($title, $cfg['homebreadcrumb']),
	'DSSEND_FORM_SEND' => cot_url('ds', 'm=send&a=send&to='.$to),
	'DSSEND_FORM_TEXT' => cot_textarea('newpmtext', $newpmtext, 8, 56, '', 'input_textarea_editor') . $text_editor_code,
));

$t->assign(cot_generate_usertags($touser, 'DSSEND_TOUSER_'));

/* === Hook === */
foreach (cot_getextplugins('ds.send.tags') as $pl)
{
	include $pl;
}
/* ===== */

$t->parse('MAIN');
$t->out('MAIN');

require_once $cfg['system_dir'] . '/footer.php';
