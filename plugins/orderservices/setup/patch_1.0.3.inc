<?php
/**
 * 1.0.3
 */

defined('COT_CODE') or die('Wrong URL');

require_once cot_incfile('services', 'module');
require_once cot_incfile('orderservices', 'plug');

global $db_services, $cfg;

cot_extrafield_add($db_services, 'file', 'file', $R['input_file'],'zip,rar','','','', '','datas/orderservicesfiles');

if(!file_exists('datas/orderservicesfiles')) mkdir('datas/orderservicesfiles');