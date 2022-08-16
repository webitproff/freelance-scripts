<!-- BEGIN: MAIN -->

<h1 class="m-y-2">{USERS_PROFILE_SUBTITLE}</h1>
<div class="card">
	<div class="card-block">
		{FILE "{PHP.cfg.themes_dir}/{PHP.cfg.defaulttheme}/warnings.tpl"}
		<form action="{USERS_PROFILE_FORM_SEND}" method="post" enctype="multipart/form-data" name="profile" class="form-horizontal">
			<input type="hidden" name="userid" value="{USERS_PROFILE_ID}" />
			<!-- IF {USERS_PROFILE_GROUPSELECT} -->
			<div class="form-group row<!-- IF !{PHP.cfg.plugin.usergroupselector.allowchange} AND {PHP.cfg.plugin.usergroupselector.required} --> sr-only<!-- ENDIF -->">
				<label class="form-control-label col-md-3">{PHP.L.profile_group}:</label>
				<div class="col-md-9">{USERS_PROFILE_GROUPSELECT}</div>
			</div>
			<!-- ENDIF -->
			<div class="form-group row">
				<label class="form-control-label col-md-3">{PHP.L.Username}:</label>
				<div class="col-md-9">{USERS_PROFILE_NAME}</div>
			</div>
			<div class="form-group row">
				<label class="form-control-label col-md-3">{PHP.L.Category}:</label>
				<div class="col-md-9">{USERS_PROFILE_CAT}</div>
			</div>
			<div class="form-group row">
				<label class="form-control-label col-md-3">{PHP.L.Groupsmembership}:</label>
				<div class="col-md-9">
					<div id="usergrouplist">
						{USERS_PROFILE_GROUPS}
					</div>
				</div>
			</div>
			<div class="form-group row">
				<label class="form-control-label col-md-3">{PHP.L.Registered}:</label>
				<div class="col-md-9">{USERS_PROFILE_REGDATE}</div>
			</div>
<!-- BEGIN: USERS_PROFILE_EMAILCHANGE -->
			<div class="form-group row">
				<label class="form-control-label col-md-3">{PHP.L.Email}:</label>
				<div class="col-md-9" id="emailtd">
					<div class="width50 floatleft">
						{PHP.L.Email}:<br />{USERS_PROFILE_EMAIL}
					</div>
<!-- BEGIN: USERS_PROFILE_EMAILPROTECTION -->
					<script type="text/javascript">
						//<![CDATA[
						$(document).ready(function(){
							$("#emailnotes").hide();
							$("#emailtd").click(function(){$("#emailnotes").slideDown();});
						});
						//]]>
					</script>
					<div>
						{PHP.themelang.usersprofile_Emailpassword}:<br />{USERS_PROFILE_EMAILPASS}
					</div>
					<div class="small" id="emailnotes">{PHP.themelang.usersprofile_Emailnotes}</div>
<!-- END: USERS_PROFILE_EMAILPROTECTION -->
				</div>
			</div>
<!-- END: USERS_PROFILE_EMAILCHANGE -->
			<div class="form-group row">
				<label class="form-control-label col-md-3">{PHP.L.users_hideemail}:</label>
				<div class="col-md-9">{USERS_PROFILE_HIDEEMAIL}</div>
			</div>
<!-- IF {PHP.cot_modules.pm} -->
			<div class="form-group row">
				<label class="form-control-label col-md-3">{PHP.L.users_pmnotify}:</label>
				<div class="col-md-9">
					{USERS_PROFILE_PMNOTIFY}
					<p class="small">{PHP.L.users_pmnotifyhint}</p>
				</div>
			</div>
<!-- ENDIF -->
			<div class="form-group row">
				<label class="form-control-label col-md-3">{PHP.L.Theme}:</label>
				<div class="col-md-9">{USERS_PROFILE_THEME}</div>
			</div>
			<div class="form-group row">
				<label class="form-control-label col-md-3">{PHP.L.Language}:</label>
				<div class="col-md-9">{USERS_PROFILE_LANG}</div>
			</div>
			<!-- IF {PHP.cot_plugins_active.locationselector} -->
			<div class="form-group row">
				<label class="form-control-label col-md-3">{PHP.L.Country}:</label>
				<div class="col-md-9">{USERS_PROFILE_LOCATION}</div>
			</div>
			<!-- ELSE -->
			<div class="form-group row">
				<label class="form-control-label col-md-3">{PHP.L.Country}:</label>
				<div class="col-md-9">{USERS_PROFILE_LOCATION}</div>
			</div>
			<!-- ENDIF -->
			<div class="form-group row">
				<label class="form-control-label col-md-3">{PHP.L.Timezone}:</label>
				<div class="col-md-9">{USERS_PROFILE_TIMEZONE}</div>
			</div>
			<div class="form-group row">
				<label class="form-control-label col-md-3">{PHP.L.Birthdate}:</label>
				<div class="col-md-9">{USERS_PROFILE_BIRTHDATE}
				</div>
			</div>
			<div class="form-group row">
				<label class="form-control-label col-md-3">{PHP.L.Gender}:</label>
				<div class="col-md-9">{USERS_PROFILE_GENDER}</div>
			</div>
			<!-- IF {USERS_PROFILE_AVATAR} -->
			<div class="form-group row">
				<label class="form-control-label col-md-3">{PHP.L.Avatar}:</label>
				<div class="col-md-9">{USERS_PROFILE_AVATAR}</div>
			</div>
			<!-- ENDIF -->
			<!-- IF {USERS_PROFILE_PHOTO} -->
			<div class="form-group row">
				<label class="form-control-label col-md-3">{PHP.L.Photo}:</label>
				<div class="col-md-9">{USERS_PROFILE_PHOTO}</div>
			</div>
			<!-- ENDIF -->
			<div class="form-group row">
				<label class="form-control-label col-md-3">{PHP.L.Signature}:</label>
				<div class="col-md-9">{USERS_PROFILE_TEXT}</div>
			</div>
			<div class="form-group row">
				<label class="form-control-label col-md-3">
					{PHP.L.users_newpass}:
					<p class="small">{PHP.L.users_newpasshint1}</p>
				</label>
				<div class="col-md-9">
					{USERS_PROFILE_OLDPASS}
					<p class="small">{PHP.L.users_oldpasshint}</p>
					{USERS_PROFILE_NEWPASS1} {USERS_PROFILE_NEWPASS2}
					<p class="small">{PHP.L.users_newpasshint2}</p>
				</div>
			</div>
			<button class="btn btn-success">{PHP.L.Update}</button></td>
		</form>
	</div>
</div>

<!-- END: MAIN -->