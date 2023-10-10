<!-- BEGIN: MAIN -->

<h1 class="m-y-2">{PHP.L.marketorders_neworder_title}</h1>
<div class="card">
	<div class="card-block">
		{FILE "{PHP.cfg.themes_dir}/{PHP.cfg.defaulttheme}/warnings.tpl"}
		<form action="{NEWORDER_FORM_SEND}" method="post" name="neworderform" class="form-horizontal">
			<div class="form-group row">
				<label class="col-md-3 form-control-label">{PHP.L.marketorders_neworder_product}:</label>
				<div class="col-md-9">[ID {NEWORDER_PRD_ID}] {NEWORDER_PRD_SHORTTITLE}</div>
			</div>
			<div class="form-group row">
				<label class="col-md-3 form-control-label">{PHP.L.marketorders_neworder_count}:</label>
				<div class="col-md-9">{NEWORDER_FORM_COUNT}</div>
			</div>
			<div class="form-group row">
				<label class="col-md-3 form-control-label">{PHP.L.marketorders_neworder_comment}:</label>
				<div class="col-md-9">{NEWORDER_FORM_COMMENT}</div>
			</div>
			<div class="form-group row">
				<label class="col-md-3 form-control-label">{PHP.L.marketorders_neworder_total}:</label>
				<div class="col-md-9"><span id="total">{NEWORDER_PRD_COST}</span> {PHP.cfg.payments.valuta}</div>
			</div>
			<!-- IF {PHP.usr.id} == 0 -->
			<div class="form-group row">
				<label class="col-md-3 form-control-label">{PHP.L.marketorders_neworder_email}:</label>
				<div class="col-md-9">{NEWORDER_FORM_EMAIL}</div>
			</div>
			<!-- ENDIF -->
			<input type="submit" class="btn btn-large btn-success" value="{PHP.L.marketorders_neworder_button}" />
		</form>
					
		<script>

			$().ready(function() {
				$('#count').bind('change click keyup', function (){
					var prdcost = {PHP.item.item_cost};
					var count = $('input[name="rcount"]').val();
					$('#total').html(prdcost*count);
				});
			});
			
		</script>

	</div>
</div>

<!-- END: MAIN -->