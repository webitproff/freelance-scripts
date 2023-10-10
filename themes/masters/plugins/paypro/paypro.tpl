<!-- BEGIN: MAIN -->

<h1 class="m-y-2 text-xs-center">{PHP.L.paypro_buypro_title}</h1>

<div class="row">
	<div class="col-md-6 col-md-offset-3">
		{FILE "{PHP.cfg.themes_dir}/{PHP.cfg.defaulttheme}/warnings.tpl"}
		<form action="{PRO_FORM_ACTION}" method="post" class="form-horizontal">
			<div class="form-group row">
				<label class="col-md-6 form-control-label text-xs-right">{PHP.L.paypro_costofmonth}:</label>
				<div class="col-md-6 form-control-label">{PRO_FORM_COST} {PHP.cfg.plugin.paypro.cost} {PHP.cfg.payments.valuta}</div>
			</div>
			<div class="form-group row">
				<label class="col-md-6 form-control-label text-xs-right">{PHP.L.paypro_error_months}:</label>
				<div class="col-md-4">
					<div class="input-group">
						{PRO_FORM_PERIOD} 
						<div class="input-group-addon">{PHP.L.paypro_month}</div>
					</div>
				</div>
			</div>
			<!-- IF {PRO_FORM_USER_NAME} -->
			<div class="form-group row">
				<label class="col-md-6 form-control-label text-xs-right">{PHP.L.paypro_giftfor}:</label>
				<div class="col-md-6">{PRO_FORM_USER_NAME}</div>
			</div>
			<!-- ENDIF -->
			<div class="text-xs-center">
				<button class="btn btn-success">{PHP.L.paypro_buy}</button>
			</div>
		</form>
	</div>
</div>

<!-- END: MAIN -->