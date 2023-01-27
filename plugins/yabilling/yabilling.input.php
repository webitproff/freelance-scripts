<?php

/** 
 * [BEGIN_COT_EXT]
 * Hooks=input
 * [END_COT_EXT]
 */
 
/**
 * Yandex money billing Plugin
 *
 * @package yabilling
 * @version 1.0
 * @author devkont (Yusupov)
 * @copyright (c) CMSWorks Team 2013
 * @license BSD
 */

defined('COT_CODE') or die('Wrong URL.');

$e = cot_import('e', 'G', 'ALP');
$r = cot_import('r', 'G', 'ALP');

if(($e == 'yabilling' || $r == 'yabilling') && $_SERVER['REQUEST_METHOD'] == 'POST')
{
	define('COT_NO_ANTIXSS', TRUE) ;
	$cfg['referercheck'] = false;
}

?>