<?php

/** 
 * [BEGIN_COT_EXT]
 * Hooks=input
 * [END_COT_EXT]
 */
 
/**
 * Payeer billing Plugin
 *
 * @package payeerbilling
 * @version 1.0
 * @author devkont (Yusupov)
 * @copyright (c) CMSWorks Team 2015
 * @license BSD
 */

defined('COT_CODE') or die('Wrong URL.');

$e = cot_import('e', 'G', 'ALP');
$r = cot_import('r', 'G', 'ALP');

if(($e == 'payeerbilling' || $r == 'payeerbilling') && $_SERVER['REQUEST_METHOD'] == 'POST')
{
	define('COT_NO_ANTIXSS', TRUE) ;
	$cfg['referercheck'] = false;
}