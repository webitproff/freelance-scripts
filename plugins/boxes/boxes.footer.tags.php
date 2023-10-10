<?php
/* ====================
[BEGIN_COT_EXT]
Code=boxes
Hooks=footer.tags
Tags=footer.tpl:{FOOTER_RC},{FOOTER_BOXES_STAT}
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
$boxes_theme_js_path = $cfg['mainurl'] . '/' . $cfg['themes_dir'] . '/' . $theme . '/js/';

if (!empty($shortpath['box_speedupjs']))
{
     foreach (preg_split('#\r?\n#', $shortpath['box_speedupjs']) as $bspdupjs)
     {
          $box_speedupjs .= @file_get_contents($boxes_theme_js_path . $bspdupjs);
     }
}
else
{
     $box_speedupjs = false;
}

if (!empty($shortpath['box_footerjs']))
{
     $box_footerjs = $shortpath['box_footerjs'];
}

if (!empty($box_speedupjs) || !empty($box_footerjs))
{
     $box_speedup_footer_js = '<script>' . cot_rc_minify($box_speedupjs . $box_footerjs, 'js') . '</script>';
}

if (!empty($shortpath['box_footerstat']))
{
     $bx_footerstat = $shortpath['box_footerstat'];
}

$out['footer_rc'] .= $box_speedup_footer_js . $shortpath['box_footer_externaljs'];

$t->assign('FOOTER_BOXES_STAT', $bx_footerstat);
