<!-- BEGIN: MAIN -->

<h3 class="text-xs-center m-b-2 m-t-2">{USERS_REGISTER_TITLE}</h3>

<div class="row m-t-1">
	<div class="col-md-6 col-md-offset-3">
		<div class="card card-block">
			{FILE "{PHP.cfg.themes_dir}/{PHP.usr.theme}/warnings.tpl"}
			<form id="form_register" name="form_register" action="{USERS_REGISTER_SEND}" class="form-horizontal" method="post">
				<!-- IF {USERS_REGISTER_GROUPSELECTBOX} -->
				<div class="form-group row">
					<label class="form-control-label col-md-4">{PHP.L.profile_group}:</label>
					<div class="col-md-8">
						<div class="custombox">
							{USERS_REGISTER_GROUPSELECTBOX}
						</div>
					</div>
				</div>
				<!-- ENDIF -->
				<!-- IF {USERS_REGISTER_COMPANY} -->
				<div class="form-group row sr-only">
					<label class="form-control-label col-md-4">{USERS_REGISTER_COMPANY_TITLE}:</label>
					<div class="col-md-8">{USERS_REGISTER_COMPANY}</div>
				</div>
				<!-- ENDIF -->
				<!-- IF {USERS_REGISTER_FIRSTNAME} -->
				<div class="form-group row">
					<label class="form-control-label col-md-4">{USERS_REGISTER_FIRSTNAME_TITLE}:</label>
					<div class="col-md-8">{USERS_REGISTER_FIRSTNAME}</div>
				</div>
				<!-- ENDIF -->
				<!-- IF {USERS_REGISTER_MIDDLENAME} -->
				<div class="form-group row">
					<label class="form-control-label col-md-4">{USERS_REGISTER_MIDDLENAME_TITLE}:</label>
					<div class="col-md-8">{USERS_REGISTER_MIDDLENAME}</div>
				</div>
				<!-- ENDIF -->
				<!-- IF {USERS_REGISTER_PHONE} -->
				<div class="form-group row">
					<label class="form-control-label col-md-4">Мобильный телефон:</label>
					<div class="col-md-8">{USERS_REGISTER_PHONE}</div>
				</div>
				<!-- ENDIF -->
				<div class="form-group row">
					<label class="form-control-label col-md-4">{PHP.L.Username}:</label>
					<div class="col-md-8">{USERS_REGISTER_USER}</div>
				</div>
				<div class="form-group row">
					<label class="form-control-label col-md-4">{PHP.L.Email}:</label>
					<div class="col-md-8">
						{USERS_REGISTER_EMAIL}
					</div>
				</div>
				<div class="form-group row">
					<label class="form-control-label col-md-4">{PHP.L.Password}:</label>
					<div class="col-md-8">{USERS_REGISTER_PASSWORD}</div>
				</div>
				<div class="form-group row">
					<label class="form-control-label col-md-4">{PHP.L.users_confirmpass}:</label>
					<div class="col-md-8">{USERS_REGISTER_PASSWORDREPEAT}</div>
				</div>
				<div class="form-group row">
					<label class="form-control-label col-md-4">{USERS_REGISTER_VERIFY_IMG}</label>
					<div class="col-md-8">{USERS_REGISTER_VERIFY_INPUT}</div>
				</div>
				<!-- IF {PHP.cot_plugins_active.useragreement} -->
				<div class="form-group text-xs-center">
					{PHP|cot_checkbox(0, 'ruseragreement', '')} <a href="{PHP|cot_url('plug', 'e=useragreement')}" target="blank">{PHP.L.useragreement_agree}</a>
				</div>
				<!-- ENDIF -->
				<br/>
				<br/>
				<div class="form-group row">
					<div class="text-xs-center"><button type="submit" name="submit" class="btn btn-success btn-lg">{PHP.L.Register}</button></div>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- END: MAIN -->
