<!-- BEGIN: MAIN -->
<script src="{PHP.cfg.plugins_dir}/paytop/js/paytop.admin.config.js" type="text/javascript"></script>	
<div id="areagenerator" style="display:none">
<div class="uk-margin uk-margin-top uk-card uk-card-default uk-padding-small uk-width-expand uk-border-rounded uk-box-shadow" uk-height-viewport="expand: true">	

  <div class="uk-overflow-auto">
    <table class="uk-table uk-table-striped uk-table-hover uk-table-middle uk-table-divider">
		<tr>
			<td class="">{PHP.L.paytop_admin_config_area}</td>
			<td class="">{PHP.L.paytop_admin_config_name}</td>
			<td class="">{PHP.L.paytop_admin_config_cost}</td>
			<td class="">{PHP.L.paytop_admin_config_period}</td>
			<td class="">{PHP.L.paytop_admin_config_count}</td>
			<td class="">&nbsp;</td>
		</tr>
		<!-- BEGIN: ADDITIONAL -->
		<tr class="area">
			<td>{ADDAREA}</td>
			<td>{ADDNAME}</td>
			<td>{ADDCOST}</td>
			<td>{ADDPERIOD}</td>
			<td>{ADDCOUNT}</td>
			<td><a href="#" class="deloption negative uk-button uk-button-danger">{PHP.L.Delete}</a></td>
		</tr>
		<!-- END: ADDITIONAL -->
	</table>
		<div id="addtr">
			<button class="uk-button uk-button-primary" name="addoption" id="addoption" type="button">{PHP.L.Add}</button>
		</div>
</div>
</div>
</div>
<!-- END: MAIN -->