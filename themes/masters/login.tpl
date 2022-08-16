<!-- BEGIN: MAIN -->

<!-- BEGIN: USERS_AUTH_MAINTENANCE -->
<div class="alert alert-warning m-t-1">
	<h4>{PHP.L.users_maintenance1}</h4>
	<p>{PHP.L.users_maintenance2}</p>
</div>
<!-- END: USERS_AUTH_MAINTENANCE -->

<div class="row m-t-1">
	<div class="col-md-4 col-md-offset-4">
		<div class="card card-block">
			<h4 class="card-title text-center">{USERS_AUTH_TITLE}</h4>
			{FILE "{PHP.cfg.themes_dir}/{PHP.usr.theme}/warnings.tpl"}
			<form id="login" name="login" action="{USERS_AUTH_SEND}" method="post" class="form-horizontal">
				<div class="form-group row">
					<label class="form-control-label col-md-4">{PHP.L.Username}:</label>
					<div class="col-md-8">{USERS_AUTH_USER}</div>
				</div>
				<div class="form-group row">
					<label class="form-control-label col-md-4">{PHP.L.Password}:</label>
					<div class="col-md-8">{USERS_AUTH_PASSWORD}</div>
				</div>
				<div class="form-group row">
					<label class="form-control-label col-md-4"></label>
					<div class="col-md-8">
						<div class="checkbox">
							<label>{USERS_AUTH_REMEMBER}&nbsp; {PHP.L.users_rememberme}</label>
						</div>
					</div>
				</div>
				<div class="form-group row">
					<label class="form-control-label col-md-4"></label>
					<div class="col-md-8"><button type="submit" name="rlogin" class="btn btn-success btn-block" value="0">{PHP.L.Login}</button></div>
				</div>
				<div class="text-right">
					<a href="{PHP|cot_url('users', 'm=passrecover')}">{PHP.L.users_lostpass}</a>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- END: MAIN -->