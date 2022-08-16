<?php

$R['tags_input_editpage'] = '<input type="text" name="rtags" size="56" class="uk-input uk-width-1-1 uk-form-large autotags" value="{$tags}" />';
$R['tags_input_editpost'] = '<input type="text" name="rtags" size="56" class="uk-input uk-width-1-1 uk-form-large autotags" value="{$tags}" />';
$R['code_title_page_num'] = ' (' . $L['Page'] . ' {$num})';
$R['link_pagenav_current'] = '<li><a class="uk-button uk-button-small uk-button-warning uk-margin-small-right" href="{$url}"{$event}{$rel}><span>{$num}</span></a></li>';
$R['link_pagenav_first'] = '<li><a href="{$url}"{$event}{$rel}> </a></li>';
$R['link_pagenav_gap'] = '<li cllass="uk-disabled"><span>...</span></li>';
$R['link_pagenav_last'] = '<li><a href="{$url}"{$event}{$rel}> </a></li>';
$R['link_pagenav_main'] = '<li><a class="uk-button uk-button-small uk-margin-small-right uk-button-details" href="{$url}"{$event}{$rel}>{$num}</a></li>';
$R['link_pagenav_next'] = '<li><a href="{$url}"{$event}{$rel}><span class="uk-icon-button uk-button-danger uk-margin-small-right" uk-pagination-next></span></a></li>';
$R['link_pagenav_prev'] = '<li><a href="{$url}"{$event}{$rel}><span class="uk-icon-button uk-button-danger uk-margin-small-right" uk-pagination-previous></span></a></li>';

$R['input_default'] = '<input class="uk-input" type="{$type}" name="{$name}" value="{$value}"{$attrs} />{$error}';
$R['input_radio'] = '<label class="uk-margin-small-right"><input type="radio" class="uk-radio" name="{$name}" value="{$value}"{$checked}{$attrs} /> {$title}</label> {$error}';
$R['input_radio_separator'] = ' ';
$R['input_select'] = '<select class="uk-select" name="{$name}"{$attrs}>{$options}</select>{$error}';
$R['input_select_option'] = '<option value="{$value}"{$selected}>{$title}</option>';

$R['input_submit'] = '<button class="uk-button" type="submit" name="{$name}" {$attrs}>{$value}</button>';
$R['input_file'] = '<label class=" file"><input type="file" name="{$name}" value="{$value}" {$attrs} /><span class="file-custom"></span></label>{$error}';
$R['input_text'] = '<input class="uk-input" type="text" name="{$name}" value="{$value}" {$attrs} />{$error}';
$R['input_textarea'] = '<textarea class="uk-textarea" name="{$name}" rows="{$rows}" cols="{$cols}"{$attrs}>{$value}</textarea>{$error}';
$R['input_textarea_editor'] =  '<textarea class="editor" name="{$name}" rows="{$rows}" cols="{$cols}"{$attrs}>{$value}</textarea>{$error}';
$R['input_textarea_medieditor'] =  '<textarea class="medieditor" name="{$name}" rows="{$rows}" cols="{$cols}"{$attrs}>{$value}</textarea>{$error}';
$R['input_textarea_minieditor'] =  '<textarea class="minieditor" name="{$name}" rows="{$rows}" cols="{$cols}"{$attrs}>{$value}</textarea>{$error}';


$R['img_structure_cat'] = '<img class="uk-preserve-width uk-animation-shake uk-box-shadow-small" width="36" height="36" src="{$icon}" alt="{$title}" title="{$desc}" uk-svg="uk-preserve" />';
