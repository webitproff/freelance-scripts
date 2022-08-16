<!-- BEGIN: MAIN -->

<div class="pull-xs-right paddingtop10"><span class="label label-info">{ORDER_LOCALSTATUS}</span></div>
<h1 class="m-y-2">{PHP.L.marketorders_title} № {ORDER_ID}</h1>
<div class="card">
	<div class="card-block">
		<div class="form-group row">
			<label class="col-md-3 form-control-label">{PHP.L.marketorders_product}:</label>
			<div class="col-md-9 form-control-static"><!-- IF {ORDER_PRD_SHORTTITLE} --><a href="{ORDER_PRD_URL}" target="blank">[ID {ORDER_PRD_ID}] {ORDER_PRD_SHORTTITLE}</a><!-- ELSE -->{ORDER_TITLE}<!-- ENDIF --></div>
		</div>
		<div class="form-group row">
			<label class="col-md-3 form-control-label">{PHP.L.marketorders_count}:</label>
			<div class="col-md-9 form-control-static">{ORDER_COUNT}</div>
		</div>
		<div class="form-group row">
			<label class="col-md-3 form-control-label">{PHP.L.marketorders_comment}:</label>
			<div class="col-md-9 form-control-static">{ORDER_COMMENT}</div>
		</div>
		<div class="form-group row">
			<label class="col-md-3 form-control-label">{PHP.L.marketorders_cost}:</label>
			<div class="col-md-9 form-control-static">{ORDER_COST} {PHP.cfg.payments.valuta}</div>
		</div>
		<div class="form-group row">
			<label class="col-md-3 form-control-label">{PHP.L.marketorders_paid}:</label>
			<div class="col-md-9 form-control-static">{ORDER_PAID|date('d.m.Y H:i', $this)}</div>
		</div>
		<div class="form-group row">
			<label class="col-md-3 form-control-label">{PHP.L.marketorders_warranty}:</label>
			<div class="col-md-9 form-control-static">{ORDER_WARRANTYDATE|date('d.m.Y H:i', $this)}</div>
		</div>
		<!-- IF {ORDER_DOWNLOAD} -->
		<div class="form-group row">
			<label class="col-md-3 form-control-label">{PHP.L.marketorders_file_for_download}:</label>
			<div class="col-md-9 form-control-static"><a href="{ORDER_DOWNLOAD}" >{PHP.L.marketorders_file_download}</a></div>
		</div>
		<!-- ENDIF -->

		<!-- IF {ORDER_WARRANTYDATE} > {PHP.sys.now} AND {ORDER_STATUS} == 'paid' AND {PHP.usr.id} == {ORDER_CUSTOMER_ID} -->
		<a class="btn btn-warning" href="{ORDER_ID|cot_url('marketorders', 'm=addclaim&id='$this)}">{PHP.L.marketorders_addclaim_button}</a>
		<!-- ENDIF -->

		<!-- BEGIN: CLAIM -->
		<h3>{PHP.L.marketorders_claim_title}</h3>
		<div class="well">
			<div class="pull-xs-right">{CLAIM_DATE|date('d.m.Y H:i', $this)}</div>
			<p>{CLAIM_TEXT}</p>

			<!-- BEGIN: ADMINCLAIM -->
			<p>
				<a href="{ORDER_ID|cot_url('marketorders', 'a=acceptclaim&id='$this)}" class="btn btn-warning">{PHP.L.marketorders_claim_accept}</a>
				<a href="{ORDER_ID|cot_url('marketorders', 'a=cancelclaim&id='$this)}" class="btn btn-danger">{PHP.L.marketorders_claim_cancel}</a>
			</p>
			<!-- END: ADMINCLAIM -->
		</div>
		<!-- END: CLAIM -->

	</div>
</div>

<!-- END: MAIN -->