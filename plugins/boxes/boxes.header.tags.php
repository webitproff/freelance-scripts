<?php
/* ====================
[BEGIN_COT_EXT]
Code=boxes
Hooks=header.tags
Tags=header.tpl:{HEADER_BOXES_HEADMETA},{HEADER_BOXES_SPEEDUP},{HEADER_BOXES_CSS},{HEADER_BOXES_EXTERNAL_JSCSS}
Order=10
[END_COT_EXT]
==================== */
/**
 * boxes plugin
 *
 * @author Roffun
 * @copyright Copyright (c) Roffun, 2015 - 2019 | https://github.com/Roffun
 * @license BSD License
 **/

defined('COT_CODE') or die('Wrong URL.');

$shortpath = $cfg['plugin']['boxes'];
$boxes_theme_css_path = $cfg['mainurl'] . '/' . $cfg['themes_dir'] . '/' . $theme . '/css/';

if (!empty($shortpath['box_speedup']))
{
     foreach (preg_split('#([\n\r]+)#Usi', $shortpath['box_speedup']) as $bspdup)
     {
          $box_speedup .= @file_get_contents($boxes_theme_css_path . $bspdup);
          $box_speedupmin = '<style>' . cot_rc_minify($box_speedup, 'css') . '</style>';
     }
}
else
{
     $box_speedupmin = false;
}

if (!empty($shortpath['box_headcss']))
{
     $box_headcss = '<style>' . cot_rc_minify($shortpath['box_headcss'], 'css') . '</style>';
}

$t->assign(array(
     'HEADER_BOXES_HEADMETA' => $shortpath['box_headmeta'],
     'HEADER_BOXES_SPEEDUP' => $box_speedupmin,
     'HEADER_BOXES_CSS' => $box_headcss,
     'HEADER_BOXES_EXTERNAL_JSCSS' => $shortpath['box_head_externaljscss']));
