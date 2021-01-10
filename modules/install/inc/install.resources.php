<?php
/*
 * Installer resources
 */

$R['install_code_available'] = '<span class="uk-text-success">'.$L['Available'].'</span>';
$R['install_code_found'] = '<span class="uk-text-success">'.$L['Found'].'</span>';
$R['install_code_invalid'] = '<span class="uk-text-danger">{$text}</span>';
$R['install_code_not_available'] = '<span class="uk-text-danger">'.$L['na'].'</span>';
$R['install_code_not_found'] = '<span class="uk-text-danger">'.$L['nf'].'</span>';
$R['install_code_recommends'] = '<span class="uk-text-success">'.$L['install_recommends'].': '
	.$L['Modules'].' - {$modules_list}; '.$L['Plugins'].' - {$plugins_list}</span>';
$R['install_code_requires'] = '<span class="uk-text-danger">'.$L['install_requires'].': '
	.$L['Modules'].' - {$modules_list}; '.$L['Plugins'].' - {$plugins_list}</span>';
$R['install_code_valid'] = '<span class="uk-text-success">{$text}</span>';
$R['install_code_writable'] = '<span class="uk-text-success">'.$L['install_writable'].'</span>';
$R['input_select'] = '<select class="uk-select" name="{$name}"> {$attrs}{$options}</select>{$error}';
$R['input_text'] = '<input class="uk-input uk-form-width-medium" id="form-horizontal-text" name="{$name}" type="text" value="{$value}" {$attrs}>{$error}';
$R['input_text'] = '<input class="uk-input" id="form-horizontal-text" name="{$name}" type="text" value="{$value}" {$attrs}>{$error}';
$R['input_checkbox'] = '<label><input class="uk-checkbox" name="{$name}" type="checkbox" value="{$value}"{$checked}{$attrs}> {$title}</label>';
$R['input_password'] = '<input class="uk-input" name="{$name}" type="password" value="{$value}" {$attrs}>{$error}';
/* $R['input_password'] = '<input class="uk-input uk-form-width-medium" name="{$name}" type="password" value="{$value}" {$attrs}>{$error}'; */