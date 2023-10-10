<!-- BEGIN: MAIN -->

<div class="text-xs-center">
	<h1 class="m-y-2">{PHP.L.paytop_buytop_title} "{TOP_FORM_AREA_NAME}"</h1>

	{FILE "{PHP.cfg.themes_dir}/{PHP.cfg.defaulttheme}/warnings.tpl"}

	<form action="{TOP_FORM_ACTION}" method="post" class="form-horizontal">
		<div class="form-group">{PHP.L.paytop_cost}: {TOP_FORM_COST} {PHP.cfg.payments.valuta}</div>
		<button class="btn btn-success">{PHP.L.paytop_buy}</button>
	</form>
</div>

<!-- END: MAIN -->