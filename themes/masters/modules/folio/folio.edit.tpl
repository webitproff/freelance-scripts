<!-- BEGIN: MAIN -->

<h1 class="m-y-2">{PHP.L.folio_edit_work_title}</h1>
<div class="card">
	<div class="card-block">
		{FILE "{PHP.cfg.themes_dir}/{PHP.cfg.defaulttheme}/warnings.tpl"}
		<form action="{PRDEDIT_FORM_SEND}" method="post" name="edit" enctype="multipart/form-data" class="form-horizontal">
			<div class="form-group row">
				<label class="col-md-3 form-control-label">{PHP.L.Category}</label>
				<div class="col-md-9">{PRDEDIT_FORM_CAT}</div>
			</div>
			<div class="form-group row">
				<label class="col-md-3 form-control-label">{PHP.L.Title}:</label>
				<div class="col-md-9">{PRDEDIT_FORM_TITLE}</div>
			</div>
			<div class="form-group row">
				<label class="col-md-3 form-control-label">{PHP.L.Alias}:</label>
				<div class="col-md-9">{PRDEDIT_FORM_ALIAS}</div>
			</div>
			<div class="form-group row">
				<label class="col-md-3 form-control-label">{PHP.L.folio_location}:</label>
				<div class="col-md-9">{PRDEDIT_FORM_LOCATION}</div>
			</div>
			<div class="form-group row<!-- IF !{PHP.usr.isadmin} --> hidden<!-- ENDIF -->">
				<label class="col-md-3 form-control-label">{PHP.L.Parser}:</label>
				<div class="col-md-9">{PRDEDIT_FORM_PARSER}</div>
			</div>
			<div class="form-group row">
				<label class="col-md-3 form-control-label">{PHP.L.Text}:</label>
				<div class="col-md-9">{PRDEDIT_FORM_TEXT}</div>
			</div>
			<!-- BEGIN: TAGS -->
			<div class="form-group row">
				<label class="col-md-3 form-control-label">{PRDEDIT_FORM_TAGS_TITLE}:</label>
				<div class="col-md-9">{PRDEDIT_FORM_TAGS} ({PRDEDIT_FORM_TAGS_HINT})</div>
			</div>
			<!-- END: TAGS -->
			<div class="form-group row">
				<label class="col-md-3 form-control-label">{PHP.L.folio_price}:</label>
				<div class="col-md-9">
					<div class="input-group">
						{PRDEDIT_FORM_COST} 
						<div class="input-group-addon">{PHP.cfg.payments.valuta}</div>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-md-3 form-control-label">{PHP.L.Image}:</label>
				<div class="col-md-9">{PRDEDIT_FORM_MAVATAR}</div>
			</div>
			<div class="form-group row">
				<label class="col-md-3 form-control-label">{PHP.L.Delete}</label>
				<div class="col-md-9">{PRDEDIT_FORM_DELETE}</div>
			</div>
			<input type="submit" class="btn btn-success" value="{PHP.L.Submit}" />
		</form>
	</div>
</div>

<!-- END: MAIN -->