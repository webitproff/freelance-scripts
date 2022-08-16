<?php
/**
 * boxes plugin
 *
 * @author Roffun
 * @copyright Copyright (c) Roffun, 2015 - 2019 | https://github.com/Roffun
 * @license BSD License
 **/

defined('COT_CODE') or die('Wrong URL');

require_once cot_langfile('boxes', 'plug');

$shortpath = $cfg['plugin']['boxes'];

$box1 = $shortpath['box1'];
$box2 = $shortpath['box2'];
$box3 = $shortpath['box3'];
$box4 = $shortpath['box4'];
$box5 = $shortpath['box5'];
$box6 = $shortpath['box6'];
$box7 = $shortpath['box7'];
$box8 = $shortpath['box8'];

if (!empty($shortpath['boxdesc']))
{
     $boxdesc = array();
     foreach (preg_split('#,#', $shortpath['boxdesc']) as $bdesc)
     {
          $boxdesc = array_merge($boxdesc, explode(',', $bdesc));
     }
}
else
{
     $boxdesc = false;
}
