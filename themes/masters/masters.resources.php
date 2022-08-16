<?php

$R['code_title_page_num'] = ' (' . $L['Page'] . ' {$num})';
$R['link_pagenav_current'] = '<li class="page-item active"><a class="page-link" href="{$url}"{$event}{$rel}>{$num}</a></li>';
$R['link_pagenav_first'] = '<li class="page-item"><a class="page-link" href="{$url}"{$event}{$rel}>'.$L['pagenav_first'].'</a></li>';
$R['link_pagenav_gap'] = '<li class="page-item disabled"><a class="page-link" href="javascript:void();">...</a></li>';
$R['link_pagenav_last'] = '<li class="page-item"><a class="page-link" href="{$url}"{$event}{$rel}>'.$L['pagenav_last'].'</a></li>';
$R['link_pagenav_main'] = '<li class="page-item"><a class="page-link" href="{$url}"{$event}{$rel}>{$num}</a></li>';
$R['link_pagenav_next'] = '<li class="page-item"><a class="page-link" href="{$url}"{$event}{$rel}>'.$L['pagenav_next'].'</a></li>';
$R['link_pagenav_prev'] = '<li class="page-item"><a class="page-link" href="{$url}"{$event}{$rel}>'.$L['pagenav_prev'].'</a></li>';

$R['input_checkbox'] = '<input type="hidden" name="{$name}" value="{$value_off}" /><label><input type="checkbox" name="{$name}" value="{$value}"{$checked}{$attrs} /> {$title}</label>';
$R['input_check'] = '<label><input type="checkbox" name="{$name}" value="{$value}"{$checked}{$attrs} /> {$title}</label>';
$R['input_default'] = '<input class="form-control" type="{$type}" name="{$name}" value="{$value}"{$attrs} />{$error}';
$R['input_radio'] = '<label><input type="radio" name="{$name}" value="{$value}"{$checked}{$attrs} /> {$title}</label> {$error}';
$R['input_radio_separator'] = ' ';
$R['input_select'] = '<select class="form-control c-select" name="{$name}"{$attrs}>{$options}</select>{$error}';
$R['input_select_option'] = '<option value="{$value}"{$selected}>{$title}</option>';
$R['input_submit'] = '<button class="btn" type="submit" name="{$name}" {$attrs}>{$value}</button>';
$R['input_file'] = '<label class="file"><input type="file" name="{$name}" value="{$value}" {$attrs} /><span class="file-custom"></span></label>{$error}';
$R['input_text'] = '<input class="form-control" type="text" name="{$name}" value="{$value}" {$attrs} />{$error}';
$R['input_textarea'] = '<textarea class="form-control" name="{$name}" rows="{$rows}" cols="{$cols}"{$attrs}>{$value}</textarea>{$error}';
$R['input_textarea_editor'] =  '<textarea class="editor" name="{$name}" rows="{$rows}" cols="{$cols}"{$attrs}>{$value}</textarea>{$error}';
$R['input_textarea_medieditor'] =  '<textarea class="medieditor" name="{$name}" rows="{$rows}" cols="{$cols}"{$attrs}>{$value}</textarea>{$error}';
$R['input_textarea_minieditor'] =  '<textarea class="minieditor" name="{$name}" rows="{$rows}" cols="{$cols}"{$attrs}>{$value}</textarea>{$error}';

$R['input_date'] =  '<div class="row">
	<div class="col-xs-2">{$day}</div>
	<div class="col-xs-3">{$month}</div>
	<div class="col-xs-2">{$year}</div>
	<div class="col-xs-2">{$hour}</div>
	<div class="col-xs-1">:</div>
	<div class="col-xs-2">{$minute}</div>
</div>';
$R['input_date_short'] =  '<div class="row">
	<div class="col-xs-2">{$day}</div>
	<div class="col-xs-3">{$month}</div>
	<div class="col-xs-2">{$year}</div>
</div>';

$R['input_password_roldpass'] = '<input class="form-control" type="password" name="{$name}" placeholder="Текущий пароль" value="{$value}" {$attrs} />{$error}';
$R['input_password_rnewpass1'] = '<input class="form-control" type="password" name="{$name}" placeholder="Новый пароль" value="{$value}" {$attrs} />{$error}';
$R['input_password_rnewpass2'] = '<input class="form-control" type="password" name="{$name}" placeholder="Новый пароль еще раз" value="{$value}" {$attrs} />{$error}';