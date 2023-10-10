<!-- BEGIN: MAIN -->
<div class="uk-margin uk-margin-top uk-card uk-card-default uk-padding-small uk-width-expand uk-border-rounded uk-box-shadow" uk-height-viewport="expand: true">
  <h2>
    <span class="uk-h3 uk-text-bold uk-link-text">{PHP.L.adm_extrafields}</span>
  </h2> 
		{FILE "{PHP.cfg.themes_dir}/admin/{PHP.cfg.admintheme}/warnings.tpl"}
<!-- BEGIN: TABLELIST -->
  <div class="uk-overflow-auto">
    <table class="uk-table uk-table-striped uk-table-hover uk-table-middle uk-table-divider">
		<!-- BEGIN: ROW -->
		<tr>
			<td><a class="uk-h4 uk-link-text" href="{ADMIN_EXTRAFIELDS_ROW_TABLEURL}">{ADMIN_EXTRAFIELDS_ROW_TABLENAME}</a></td>
		</tr>
		<!-- END: ROW -->
	</table>
</div>
<div class="uk-margin uk-margin-top uk-text-center">
	<a class="uk-button uk-button-small uk-button-primary" href="{ADMIN_EXTRAFIELDS_ALLTABLES}">{PHP.L.adm_extrafields_all}</a>
</div>
<div class="uk-margin-vertical uk-alert-primary uk-alert" uk-alert="">
  <a class="uk-alert-close uk-icon uk-close" uk-close=""></a>
  <p>Шаблон:</p>
  <code>admin.extrafields.tpl TABLELIST</code>
</div>
<!-- END: TABLELIST -->

<!-- BEGIN: TABLE -->
<div class="block">
	<form action="{ADMIN_EXTRAFIELDS_URL_FORM_EDIT}" method="post">
		<table class="uk-table uk-table-striped">
			<tr>
				<th class="coltop"></th>
				<th class="coltop">{PHP.L.extf_Name}</th>
				<th class="coltop">{PHP.L.extf_Type}</th>
				<th class="coltop">{PHP.L.adm_extrafield_params}</th>
				<th class="coltop"></th>
			</tr>
			<!-- BEGIN: EXTRAFIELDS_ROW -->
			<tr id="ex{ADMIN_EXTRAFIELDS_ROW_ID}">
			
				<td class="{ADMIN_EXTRAFIELDS_ROW_ODDEVEN}">
					{ADMIN_EXTRAFIELDS_ROW_ENABLED}
				</td>
				<td class="{ADMIN_EXTRAFIELDS_ROW_ODDEVEN}">
						{ADMIN_EXTRAFIELDS_ROW_NAME}
					<p class="small">{PHP.L.extf_Description}</p>
						{ADMIN_EXTRAFIELDS_ROW_DESCRIPTION}
					<p class="small">{PHP.L.extf_Base_HTML}</p>
						{ADMIN_EXTRAFIELDS_ROW_HTML}
				</td>
				<td class="{ADMIN_EXTRAFIELDS_ROW_ODDEVEN}">
						{ADMIN_EXTRAFIELDS_ROW_SELECT}
					<p class="small">{PHP.L.adm_extrafield_parse}</p>
						{ADMIN_EXTRAFIELDS_ROW_PARSE}
					<p class="small"><label class="checkbox">{ADMIN_EXTRAFIELDS_ROW_REQUIRED}{PHP.L.adm_extrafield_required}</label></p>

				</td>
				<td class="{ADMIN_EXTRAFIELDS_ROW_ODDEVEN}">
					{ADMIN_EXTRAFIELDS_ROW_PARAMS}
					<p class="small">{PHP.L.adm_extrafield_selectable_values}</p>
						{ADMIN_EXTRAFIELDS_ROW_VARIANTS}
					<p class="small">{PHP.L.adm_extrafield_default}</p>
						{ADMIN_EXTRAFIELDS_ROW_DEFAULT}
				</td>
				<td class="centerall {ADMIN_EXTRAFIELDS_ROW_ODDEVEN}">

					<a title="{PHP.L.Delete}" href="{ADMIN_EXTRAFIELDS_ROW_DEL_URL}" class="ajax btn">{PHP.L.Delete}</a>
				</td>
			</tr>
			
			<!-- END: EXTRAFIELDS_ROW -->

		</table>
<div class="uk-margin uk-margin-top uk-text-center">
<input type="submit" value="{PHP.L.Update}" onclick="location.href='{ADMIN_EXTRAFIELDS_ROW_FORM_URL}'"  class="confirm uk-button uk-button-primary" />

</div>
	</form>
	<div class="pagination"><ul>{ADMIN_EXTRAFIELDS_PAGINATION_PREV}{ADMIN_EXTRAFIELDS_PAGNAV}{ADMIN_EXTRAFIELDS_PAGINATION_NEXT}</ul></div>
	<p><span>{PHP.L.Total}: {ADMIN_EXTRAFIELDS_TOTALITEMS}, {PHP.L.Onpage}: {ADMIN_EXTRAFIELDS_COUNTER_ROW}</span></p>
</div>

<div class="uk-tile uk-tile-default uk-padding-small uk-border-rounded">
	<h3>{PHP.L.adm_extrafield_new}:</h3>
	<form action="{ADMIN_EXTRAFIELDS_URL_FORM_ADD}" method="post">
		<table class="cells table info table-bordered table-striped">
			<tr>
				<th class="coltop width30">{PHP.L.extf_Name}</th>
				<th class="coltop width20">{PHP.L.extf_Type}</th>
				<th class="coltop width40">{PHP.L.adm_extrafield_params}</th>
			</tr>
			<tr id="exnew">
				<td>
					{ADMIN_EXTRAFIELDS_NAME}
					<p class="small">{PHP.L.extf_Description}</p>
							{ADMIN_EXTRAFIELDS_DESCRIPTION}
					<p class="small">{PHP.L.extf_Base_HTML}</p>
						{ADMIN_EXTRAFIELDS_HTML}
				</td>
				<td>
							{ADMIN_EXTRAFIELDS_SELECT}
					<p class="small">{PHP.L.adm_extrafield_parse}</p>
						{ADMIN_EXTRAFIELDS_PARSE}
						<p class="small"><label class="checkbox">{ADMIN_EXTRAFIELDS_REQUIRED}{PHP.L.adm_extrafield_required}</label></p>
				</td>
				<td>
							{ADMIN_EXTRAFIELDS_PARAMS}
					<p class="small">{PHP.L.adm_extrafield_selectable_values}</p>
							{ADMIN_EXTRAFIELDS_VARIANTS}
					<p class="small">{PHP.L.adm_extrafield_default}</p>
						{ADMIN_EXTRAFIELDS_DEFAULT}
				</td>
			</tr>
			<tr>
				<td class="valid" colspan="3">
					<p class="small"> <input class="uk-checkbox uk-background-default" type="checkbox" name="field_noalter" /> {PHP.L.adm_extrafield_noalter}</p>
					<input type="submit" class="confirm btn btn-success" value="{PHP.L.Add}" />
				</td>
			</tr>
		</table>
	</form>
</div>

<!-- END: TABLE -->
</div>
<!-- END: MAIN -->