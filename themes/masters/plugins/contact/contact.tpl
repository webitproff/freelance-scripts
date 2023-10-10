<!-- BEGIN: MAIN -->

<h3 class="text-xs-center m-b-2 m-t-2">{PHP.L.contact_title}</h3>

<div class="row m-t-1">
	<div class="col-md-8 col-md-offset-2">

		<!-- IF {PHP.cfg.plugin.contact.about} -->
		<p>{PHP.cfg.plugin.contact.about}</p>
		<!-- ENDIF -->
		<!-- IF {PHP.cfg.plugin.contact.map} -->
		<p>{PHP.cfg.plugin.contact.map}</p>
		<!-- ENDIF -->

		<div class="card">
			<div class="card-block">
				{FILE "{PHP.cfg.themes_dir}/{PHP.usr.theme}/warnings.tpl"}
				<!-- BEGIN: FORM -->
				<form action="{CONTACT_FORM_SEND}" method="post" name="contact_form" enctype="multipart/form-data" class="form-horizontal">
					<div class="form-group row">
						<label class="col-md-3 form-control-label">{PHP.L.Username}:</label>
						<div class="col-md-9">{CONTACT_FORM_AUTHOR}</div>
					</div>
					<div class="form-group row">
						<label class="col-md-3 form-control-label">{PHP.L.Email}:</label>
						<div class="col-md-9">{CONTACT_FORM_EMAIL}</div>
					</div>
					<div class="form-group row">
						<label class="col-md-3 form-control-label">{PHP.L.Subject}:</label>
						<div class="col-md-9">{CONTACT_FORM_SUBJECT}</div>
					</div>
					<div class="form-group row">
						<label class="col-md-3 form-control-label">{PHP.L.Message}:</label>
						<div class="col-md-9">{CONTACT_FORM_TEXT|cot_rc_modify($this, 'style="width:100%;"')}</div>
					</div>
					<!-- BEGIN: EXTRAFLD -->
					<div class="form-group row">
						<label class="col-md-3 form-control-label">{CONTACT_FORM_EXTRAFLD_TITLE}:</label>
						<div class="col-md-9">{CONTACT_FORM_EXTRAFLD}</div>
					</div>
					<!-- END: EXTRAFLD -->
					<!-- BEGIN: CAPTCHA -->
					<div class="form-group row">
						<label class="col-md-3 form-control-label">{CONTACT_FORM_VERIFY_IMG}</label>
						<div class="col-md-9">{CONTACT_FORM_VERIFY}</div>
					</div>
					<!-- END: CAPTCHA -->
					<br/>
					<br/>
					<div class="form-group row">
						<div class="text-xs-center"><button class="btn btn-success btn-lg" type="submit">{PHP.L.Submit}</button></div>
					</div>
				</form>
				<!-- END: FORM -->
			</div>
		</div>

	</div>
</div>

<!-- END: MAIN -->