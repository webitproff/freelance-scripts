<!-- BEGIN: MAIN -->

<h1 class="m-y-2">{PHP.L.projects_edit_project_title}</h1>
<div class="card">
	<div class="card-block">
		{FILE "{PHP.cfg.themes_dir}/{PHP.cfg.defaulttheme}/warnings.tpl"}
		<form action="{PRJEDIT_FORM_SEND}" method="post" name="edit" enctype="multipart/form-data" class="form-horizontal">
			<!-- IF {PHP.projects_types} -->
			<div class="form-group row">
				<label class="col-md-3 form-control-label">{PHP.L.Type}:</label>
				<div class="col-md-9">{PRJEDIT_FORM_TYPE}</div>
			</div>
			<!-- ENDIF -->
			<div class="form-group row">
				<label class="col-md-3 form-control-label">{PHP.L.Category}:</label>
				<div class="col-md-9">{PRJEDIT_FORM_CAT}</div>
			</div>
			<div class="form-group row">
				<label class="col-md-3 form-control-label">{PHP.L.Location}:</label>
				<div class="col-md-9">{PRJEDIT_FORM_LOCATION}</div>
			</div>
			<div class="form-group row">
				<label class="col-md-3 form-control-label">{PHP.L.Title}:</label>
				<div class="col-md-9">{PRJEDIT_FORM_TITLE}</div>
			</div>
			<div class="form-group row">
				<label class="col-md-3 form-control-label">{PHP.L.Alias}:</label>
				<div class="col-md-9">{PRJEDIT_FORM_ALIAS}</div>
			</div>
			<div class="form-group row<!-- IF !{PHP.usr.isadmin} --> hidden<!-- ENDIF -->">
				<label class="col-md-3 form-control-label">{PHP.L.Parser}:</label>
				<div class="col-md-9">{PRJEDIT_FORM_PARSER}</div>
			</div>
			<div class="form-group row">
				<label class="col-md-3 form-control-label">{PHP.L.Text}:</label>
				<div class="col-md-9">{PRJEDIT_FORM_TEXT}</div>
			</div>
			<!-- BEGIN: TAGS -->
			<div class="form-group row">
				<label class="col-md-3 form-control-label">{PRJEDIT_FORM_TAGS_TITLE}:</label>
				<div class="col-md-9">{PRJEDIT_FORM_TAGS} ({PRJEDIT_FORM_TAGS_HINT})</div>
			</div>
			<!-- END: TAGS -->
			<div class="form-group row">
				<label class="col-md-3 form-control-label">{PHP.L.projects_price}:</label>
				<div class="col-md-9"><div class="input-group">{PRJEDIT_FORM_COST}<span class="input-group-addon">{PHP.cfg.payments.valuta}</span></div></div>
			</div>
			<!-- IF {PHP.cot_plugins_active.mavatars} -->
			<div class="form-group row">
				<label class="col-md-3 form-control-label">{PHP.L.Files}:</label>
				<div class="col-md-9">{PRJEDIT_FORM_MAVATAR}</div>
			</div>
			<!-- ENDIF -->
			<!-- IF {PHP.cot_plugins_active.paypro} -->
			<div class="form-group row">
				<label class="col-md-3 form-control-label">{PHP.L.paypro_forpro}:</label>
				<div class="col-md-9">
					{PRJEDIT_FORM_FORPRO}
				</div>
			</div>
			<!-- ENDIF -->
			<!-- IF {PHP.usr.isadmin} -->
			<div class="form-group row">
				<label class="col-md-3 form-control-label">{PHP.L.Delete}</label>
				<div class="col-md-9">{PRJEDIT_FORM_DELETE}</div>
			</div>
			<!-- ENDIF -->
			<input type="submit" class="btn btn-success" value="{PHP.L.projects_next}" />
		</form>
	</div>
</div>
<!-- END: MAIN -->