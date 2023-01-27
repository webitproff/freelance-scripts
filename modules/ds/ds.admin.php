<?php

/**
 * [BEGIN_COT_EXT]
 * Hooks=admin
 * [END_COT_EXT]
 */

/**
 * Dialog System
 * @version 2.2
 * @package DS
 * @copyright (c) Alexeev Vlad
 */

defined('COT_CODE') or die('Wrong URL');

list($usr['auth_read'], $usr['auth_write'], $usr['isadmin']) = cot_auth('ds', 'any');
cot_block($usr['isadmin']);

$act = cot_import('act','G','TXT');

$adminpath[] = array(cot_url('admin', 'm=extensions'), $L['Extensions']);
$adminpath[] = array(cot_url('admin', 'm=extensions&a=details&mod='.$m), $cot_modules[$m]['title']);
$adminpath[] = array(cot_url('admin', 'm='.$m), $L['Administration']);

if (!in_array($p, array('default')))
{
	$p = 'default';
}

if ($act == 'show')
{
  $p = 'show';
}elseif ($act)
{
  $p = 'action';
}

require_once cot_incfile('ds', 'module', 'admin.'.$p);