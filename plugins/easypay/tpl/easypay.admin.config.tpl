<!-- BEGIN: MAIN -->
<script src="{PHP.cfg.plugins_dir}/easypay/js/easypay.admin.config.js" type="text/javascript"></script>	
<div id="areagenerator" style="display:none">
	<table class="cells">
		<tr>
			<td class="coltop width20">{PHP.L.easypay_admin_config_code}</td>
			<td class="coltop">{PHP.L.easypay_admin_config_name}</td>
			<td class="coltop">{PHP.L.easypay_admin_config_cost}</td>
			<td class="coltop">{PHP.L.easypay_admin_config_userid}</td>
			<td class="coltop">&nbsp;</td>
		</tr>
		<!-- BEGIN: ADDITIONAL -->
		<tr class="area">
			<td>{ADDCODE}</td>
			<td>{ADDNAME}</td>
			<td>{ADDCOST}</td>
			<td>{ADDUSERID}</td>
			<td><a href="#" class="deloption negative button"><span class="trash icon"></span>{PHP.L.Delete}</a></td>
		</tr>
		<!-- END: ADDITIONAL -->
		<tr id="addtr">
			<td class="valid" colspan="8"><button name="addoption" id="addoption" type="button">{PHP.L.Add}</button></td>
		</tr>
	</table>
</div>

<!-- END: MAIN -->