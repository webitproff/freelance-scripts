<!-- BEGIN: MAIN -->

<h1 class="m-y-2">{USERS_EDIT_SUBTITLE}</h1>
<div class="card">
	<div class="card-block">
		{FILE "{PHP.cfg.themes_dir}/{PHP.cfg.defaulttheme}/warnings.tpl"}
		<form action="{USERS_EDIT_SEND}" method="post" name="useredit" enctype="multipart/form-data" class="form-horizontal">
			<input type="hidden" name="id" value="{USERS_EDIT_ID}" />
			<div class="form-group row">
				<label class="form-control-label col-md-3">{PHP.L.users_id}:</label>
				<div class="col-md-9">#{USERS_EDIT_ID}</div>
			</div>
			<!-- IF {USERS_EDIT_GROUPSELECT} -->
			<div class="form-group row">
				<label class="form-control-label col-md-3">{PHP.L.profile_group}:</label>
				<div class="col-md-9">{USERS_EDIT_GROUPSELECT}</div>
			</div>
			<!-- ENDIF -->
			<div class="form-group row">
				<label class="form-control-label col-md-3">{PHP.L.Username}:</label>
				<div class="col-md-9">{USERS_EDIT_NAME}</div>
			</div>
			<!-- IF {PHP.cot_plugins_active.locationselector} -->
			<div class="form-group row">
				<label class="form-control-label col-md-3">{PHP.L.Country}:</label>
				<div class="col-md-9">{USERS_EDIT_LOCATION}</div>
			</div>
			<!-- ELSE -->
			<div class="form-group row">
				<label class="form-control-label col-md-3">{PHP.L.Country}:</label>
				<div class="col-md-9">{USERS_EDIT_COUNTRY}</div>
			</div>
			<!-- ENDIF -->
			<div class="form-group row">
				<label class="form-control-label col-md-3">{PHP.L.Timezone}:</label>
				<div class="col-md-9">{USERS_EDIT_TIMEZONE}</div>
			</div>
			<div class="form-group row">
				<label class="form-control-label col-md-3">{PHP.L.Theme}:</label>
				<div class="col-md-9">{USERS_EDIT_THEME}</div>
			</div>
			<div class="form-group row">
				<label class="form-control-label col-md-3">{PHP.L.Language}:</label>
				<div class="col-md-9">{USERS_EDIT_LANG}</div>
			</div>
			<!-- IF {USERS_EDIT_AVATAR} -->
			<div class="form-group row">
				<label class="form-control-label col-md-3">{PHP.L.Avatar}:</label>
				<div class="col-md-9">{USERS_EDIT_AVATAR}</div>
			</div>
			<!-- ENDIF -->
			<!-- IF {USERS_EDIT_SIGNATURE} -->
			<div class="form-group row">
				<label class="form-control-label col-md-3">{PHP.L.Signature}:</label>
				<div class="col-md-9">{USERS_EDIT_SIGNATURE}</div>
			</div>
			<!-- ENDIF -->
			<!-- IF {USERS_EDIT_PHOTO} -->
			<div class="form-group row">
				<label class="form-control-label col-md-3">{PHP.L.Photo}:</label>
				<div class="col-md-9">{USERS_EDIT_PHOTO}</div>
			</div>
			<!-- ENDIF -->
			<div class="form-group row">
				<label class="form-control-label col-md-3">{PHP.L.users_newpass}:</label>
				<div class="col-md-9">
					{USERS_EDIT_NEWPASS}
					<p class="small">{PHP.L.users_newpasshint1}</p>
				</div>
			</div>
			<div class="form-group row">
				<label class="form-control-label col-md-3">{PHP.L.Email}:</label>
				<div class="col-md-9">{USERS_EDIT_EMAIL}</div>
			</div>
			<div class="form-group row">
				<label class="form-control-label col-md-3">{PHP.L.users_hideemail}:</label>
				<div class="col-md-9">{USERS_EDIT_HIDEEMAIL}</div>
			</div>
<!-- IF {PHP.cot_modules.pm} -->
			<div class="form-group row">
				<label class="form-control-label col-md-3">{PHP.L.users_pmnotify}:</label>
				<div class="col-md-9">{USERS_EDIT_PMNOTIFY}<br />{PHP.themelang.usersedit.PMnotifyhint}</div>
			</div>
<!-- ENDIF -->
			<div class="form-group row">
				<label class="form-control-label col-md-3">{PHP.L.Birthdate}:</label>
				<div class="col-md-9">{USERS_EDIT_BIRTHDATE}</div>
			</div>
			<div class="form-group row">
				<label class="form-control-label col-md-3">{PHP.L.Gender}:</label>
				<div class="col-md-9">{USERS_EDIT_GENDER}</div>
			</div>
			<div class="form-group row">
				<label class="form-control-label col-md-3">{PHP.L.Signature}:</label>
				<div class="col-md-9">{USERS_EDIT_TEXT}</div>
			</div>
			<div class="form-group row">
				<label class="form-control-label col-md-3">{PHP.L.Registered}:</label>
				<div class="col-md-9">{USERS_EDIT_REGDATE}</div>
			</div>
			<div class="form-group row">
				<label class="form-control-label col-md-3">{PHP.L.Lastlogged}:</label>
				<div class="col-md-9">{USERS_EDIT_LASTLOG}</div>
			</div>
			<div class="form-group row">
				<label class="form-control-label col-md-3">{PHP.L.users_lastip}:</label>
				<div class="col-md-9">{USERS_EDIT_LASTIP}</div>
			</div>
			<div class="form-group row">
				<label class="form-control-label col-md-3">{PHP.L.users_logcounter}:</label>
				<div class="col-md-9">{USERS_EDIT_LOGCOUNT}</div>
			</div>
			<div class="form-group row">
				<label class="form-control-label col-md-3">{PHP.L.users_deleteuser}:</label>
				<div class="col-md-9">{USERS_EDIT_DELETE}</div>
			</div>
			<button type="submit" class="btn btn-success">{PHP.L.Update}</button>
		</form>
	</div>
</div>

<!-- END: MAIN -->