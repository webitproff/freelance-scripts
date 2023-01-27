<?php
/**
 * boxes plugin
 *
 * @author Roffun
 * @copyright Copyright (c) Roffun, 2015 - 2019 | https://github.com/Roffun
 * @license BSD License
 **/

defined('COT_CODE') or die('Wrong URL.');

$L['Boxes'] = 'Boxes';
$L['info_name'] = 'Display content in a template';
$L['info_desc'] = 'Output in the block template, widgets, and other counters visits';
//The text on the home page
$L['cfg_indextextboxes'] = 'TEXT FOR MAIN PAGE ( <em>index.tpl</em> )';

//TAGS outputting content in a top of the site
$L['cfg_boxsep_headline'] = '<br><div>TAGS outputting content in a top of the site ( <em>header.tpl</em> )</div>';
$L['cfg_box_headmeta'] = '<div style="color: #fff;background: #768190;text-align: center;padding:10px;">Evidenced by meta tags<div>in this field, you can insert a variety of meta tags, such as the confirmation of the rights to the site';
$L['cfg_box_speedup'] = 'CONNECTING CSS FILES<br>specify the file name and extension in the folder css, situated <b>' . $cfg['mainurl'] . '/' . $cfg['themes_dir'] . '/' . $theme . '/css/' .
     '</b><br>each on a new line';
$L['cfg_box_headcss'] = 'CSS additional styles of site<br>in this field you can insert the usual css code';
$L['cfg_box_head_externaljscss'] = 'CSS, JS<br>in this field you can connect css or js files, including external';

//CONNECTING scripts in the bottom of the site
$L['cfg_boxsep_footerline'] = '<br><div>TAGS outputting content in a bottom of the site ( <em>footer.tpl</em> )</div>';
$L['cfg_box_footerjs'] = 'AREA add various JS CODE<br>without opening and closing &lt;script&gt';
$L['cfg_box_speedupjs'] = 'AREA paste content JS FILE<br>specify the file name and extension in the folder js, situated <b>' . $cfg['mainurl'] . '/' . $cfg['themes_dir'] . '/' . $theme .
     '/js/' . '</b><br>each on a new line';
$L['cfg_box_footerstat'] = '<div style="color: #fff;background: #AAA7A7;text-align: center;padding:10px;">CONNECTING visitor counter</div><br><input onclick="this.select();" size="22" readonly value="{FOOTER_BOXES_STAT}">';
$L['cfg_box_footer_externaljs'] = 'CONNECTING THE JS FILE<br>in this field can be connected js files including external<br>&lt;script src="file address"&gt;&lt;/script&gt;';

//ADDITIONAL UNITS CAN BE USED GLOBALLY
$L['cfg_boxsep_else'] = '<br><div>ADDITIONAL UNITS CAN BE USED GLOBALLY</div>';
$L['cfg_boxdesc'] = 'description of additional units in order, separated by commas or one per line';
$L['box_additional block'] = 'Additional block';
$L['boxes_style_my'] = ' style="color:blue"';
$L['boxes_input_onclick'] = '<input onclick="this.select();" readonly value="{PHP.box';
$L['cfg_box1'] = '<h3>' . $L['box_additional block'] . ' №1</h3><div' . $L['boxes_style_my'] . '>' . $boxdesc[0] . '</div>' . $L['boxes_input_onclick'] . '1}">';
$L['cfg_box2'] = '<h3>' . $L['box_additional block'] . ' №2</h3><div' . $L['boxes_style_my'] . '>' . $boxdesc[1] . '</div>' . $L['boxes_input_onclick'] . '2}">';
$L['cfg_box3'] = '<h3>' . $L['box_additional block'] . ' №3</h3><div' . $L['boxes_style_my'] . '>' . $boxdesc[2] . '</div>' . $L['boxes_input_onclick'] . '3}">';
$L['cfg_box4'] = '<h3>' . $L['box_additional block'] . ' №4</h3><div' . $L['boxes_style_my'] . '>' . $boxdesc[3] . '</div>' . $L['boxes_input_onclick'] . '4}">';
$L['cfg_box5'] = '<h3>' . $L['box_additional block'] . ' №5</h3><div' . $L['boxes_style_my'] . '>' . $boxdesc[4] . '</div>' . $L['boxes_input_onclick'] . '5}">';
$L['cfg_box6'] = '<h3>' . $L['box_additional block'] . ' №6</h3><div' . $L['boxes_style_my'] . '>' . $boxdesc[5] . '</div>' . $L['boxes_input_onclick'] . '6}">';
$L['cfg_box7'] = '<h3>' . $L['box_additional block'] . ' №7</h3><div' . $L['boxes_style_my'] . '>' . $boxdesc[6] . '</div>' . $L['boxes_input_onclick'] . '7}">';
$L['cfg_box8'] = '<h3>' . $L['box_additional block'] . ' №8</h3><div' . $L['boxes_style_my'] . '>' . $boxdesc[7] . '</div>' . $L['boxes_input_onclick'] . '8}">';
