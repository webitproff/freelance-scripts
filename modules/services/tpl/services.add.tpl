<!-- BEGIN: MAIN -->

<div class="breadcrumb">{PHP.L.services_add_service_title}</div>
<div class="customform">
	{FILE "{PHP.cfg.themes_dir}/{PHP.cfg.defaulttheme}/warnings.tpl"}
	<form action="{SERVADD_FORM_SEND}" method="post" name="newwork" enctype="multipart/form-data">
		<table class="cells" border="0" cellspacing="1" cellpadding="2">
			<tr>
				<td align="right" style="width:176px;">{PHP.L.Category}:</td>
				<td>{SERVADD_FORM_CAT}</td>
			</tr>
			<tr>
				<td align="right">{PHP.L.Title}:</td>
				<td>{SERVADD_FORM_TITLE}</td>
			</tr>
			<tr<!-- IF !{PHP.usr.isadmin} --> class="hidden"<!-- ENDIF -->>
				<td align="right">{PHP.L.Alias}:</td>
				<td>{SERVADD_FORM_ALIAS}</td>
			</tr>
			<tr>
				<td align="right">{PHP.L.services_location}:</td>
				<td>{SERVADD_FORM_LOCATION}</td>
			</tr>
			<tr<!-- IF !{PHP.usr.isadmin} --> class="hidden"<!-- ENDIF -->>
				<td align="right">{PHP.L.Parser}:</td>
				<td>{SERVADD_FORM_PARSER}</td>
			</tr>
			<tr>
				<td align="right">{PHP.L.Text}:</td>
				<td>{SERVADD_FORM_TEXT}</td>
			</tr>
			<!-- BEGIN: TAGS -->
			<tr>
				<td>{SERVADD_FORM_TAGS_TITLE}:</td>
				<td>{SERVADD_FORM_TAGS} ({SERVADD_FORM_TAGS_HINT})</td>
			</tr>
			<!-- END: TAGS -->
			<tr>
				<td align="right">{PHP.L.services_price}:</td>
				<td>{SERVADD_FORM_COST} {PHP.cfg.payments.valuta}</td>
			</tr>
			<!-- IF {PHP.cot_plugins_active.servicesorders} -->
			<tr>
				<td align="right">{PHP.L.servicesorders_file}:</td>
				<td>{SERVADD_FORM_FILE}</td>
			</tr>
			<!-- ENDIF -->
			<tr>
				<td align="right">{PHP.L.Image}:</td>
				<td>
					{SERVADD_FORM_MAVATAR}
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<input type="submit" class="btn btn-info" value="{PHP.L.Submit}" />
				</td>
			</tr>
		</table>
	</form>
</div>

<!-- END: MAIN -->