<!-- BEGIN: MAIN -->
<div class="uk-margin uk-margin-top uk-card uk-card-default uk-padding-small uk-width-expand uk-border-rounded uk-box-shadow" uk-height-viewport="expand: true">	

  <div class="uk-overflow-auto">
    <table class="uk-table uk-table-striped uk-table-hover uk-table-middle uk-table-divider">
		<!-- BEGIN: TOP_ROW -->
		<tr>
			<td><a href="{TOP_ROW_USER_DETAILSLINK}">{TOP_ROW_USER_NAME}</a></td>
			<td>{TOP_ROW_AREA}</td>
			<td>{TOP_ROW_EXPIRE|cot_date('d.m.Y', $this)}</td>
			<td><a href="{TOP_ROW_SERVICE_ID|cot_url('admin', 'm=other&p=paytop&a=delete&id='$this)}">{PHP.L.Delete}</a></td>
		</tr>
		<!-- END: TOP_ROW -->
	</table>
</div>	
</div>
<div class="uk-margin uk-margin-top uk-card uk-card-default uk-padding-small uk-width-expand uk-border-rounded uk-box-shadow" uk-height-viewport="expand: true">
	<h3>{PHP.L.paytop_addtopaccaunt}:</h3>
	{FILE "{PHP.cfg.themes_dir}/{PHP.cfg.defaulttheme}/warnings.tpl"}
	<form  class="uk-form-stacked" action="{TOP_FORM_ACTION_URL}" method="POST">
    <div class="uk-margin">
        <div class="uk-form-label">{PHP.L.Username}:</div>
        <div class="uk-form-controls">
			<input class="uk-input" type="text" name="username" value="" />
		</div>
    </div>
    <div class="uk-margin">
        <div class="uk-form-label">{PHP.L.paytop_area}:</div>
        <div class="uk-form-controls">
			{TOP_FORM_AREA} 
		</div>
    </div>	
    <div class="uk-margin">
        <div class="uk-form-label">{PHP.L.paytop_period}</div>
        <div class="uk-form-controls">
			{TOP_FORM_PERIOD} {TOP_FORM_PERIOD_NAME} 
		</div>
    </div>			 
		 
		<button class="uk-button uk-button-primary">{PHP.L.Add}</button>
	</form>

</div>

<!-- END: MAIN -->