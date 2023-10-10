<!-- BEGIN: MAIN -->

<!-- IF {PHP.cfg.payments.balance_enabled} -->
<h4 class="pull-xs-right">{PHP.L.payments_balance}: <b>{BALANCE_SUMM|number_format($this, '2', '.', ' ')} {PHP.cfg.payments.valuta}</b></h4>
<!-- ENDIF -->
<h3 class="m-y-2">{PHP.L.payments_mybalance}</h3>	

<div class="row m-t-2">
	<div class="col-md-3">
		<ul class="nav nav-pills nav-stacked">
			<li class="nav-item"><a class="nav-link<!-- IF {PHP.n} == 'history' --> active<!-- ENDIF -->" href="{BALANCE_HISTORY_URL}">{PHP.L.payments_history}</a></li>
			<!-- IF {PHP.cfg.payments.balance_enabled} -->
			<li class="nav-item"><a class="nav-link<!-- IF {PHP.n} == 'billing' --> active<!-- ENDIF -->" href="{BALANCE_BILLING_URL}">{PHP.L.payments_paytobalance}</a></li>
			<!-- IF {PHP.cfg.payments.payouts_enabled} -->
			<li class="nav-item"><a class="nav-link<!-- IF {PHP.n} == 'payouts' --> active<!-- ENDIF -->" href="{BALANCE_PAYOUT_URL}">{PHP.L.payments_payouts}</a></li>
			<!-- ENDIF -->
			<!-- IF {PHP.cfg.payments.transfers_enabled} -->
			<li class="nav-item"><a class="nav-link<!-- IF {PHP.n} == 'transfers' --> active<!-- ENDIF -->" href="{BALANCE_TRANSFER_URL}">{PHP.L.payments_transfer}</a></li>
			<!-- ENDIF -->
			<!-- ENDIF -->
		</ul>
	</div>
	<div class="col-md-9">
		<div class="card shadow">
			<div class="card-block">
				<!-- BEGIN: BILLINGFORM -->
				<h6 class="m-b-2">{PHP.L.payments_balance_billing_desc}</h6>
				{FILE "{PHP.cfg.themes_dir}/{PHP.usr.theme}/warnings.tpl"}
				<p>{PHP.L.payments_balance_billing_summ}:</p>
				<form id="form_billing" name="form_billing" action="{BALANCE_FORM_ACTION_URL}" method="post" class="form-horizontal">
					<div class="form-group row custombox">
						<div class="col-md-2">
						    {BALANCE_FORM_SUMM}
				        </div>
						<div class="col-md-2 form-control-label">
						    {PHP.cfg.payments.valuta}
				        </div>
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-primary">{PHP.L.payments_paytobalance}</button>
					</div>
				</form>
				<!-- END: BILLINGFORM -->
				<!-- BEGIN: PAYOUTS -->

				<!-- IF {BALANCE_SUMM} > 0 -->
				<a class="pull-xs-right btn btn-primary" href="{PHP|cot_url('payments', 'm=balance&n=payouts&a=add')}">{PHP.L.payments_balance_payouts_button}</a>
				<h6 class="m-b-2">{PHP.L.payments_balance_payout_list}</h6>
				<!-- IF {PHP.payouts|count($this)} > 0 -->
				<table class="table table-striped">
					<thead>
						<tr>
							<th>ID</th>
							<th class="text-right">{PHP.L.payments_summ}</th>
							<th class="text-right">{PHP.L.Date}</th>
							<th class="text-right">{PHP.L.Status}</th>
						</tr>
					</thead>
					<!-- BEGIN: PAYOUT_ROW -->
					<tr>
						<td>{PAYOUT_ROW_ID}</td>
						<td class="text-right">{PAYOUT_ROW_SUMM|number_format($this, '2', '.', ' ')} {PHP.cfg.payments.valuta}</td>
						<td class="text-right">{PAYOUT_ROW_CDATE|cot_date('d.m.Y H:i', $this)}</td>
						<td class="text-right">{PAYOUT_ROW_LOCALSTATUS}</td>
					</tr>
					<!-- END: PAYOUT_ROW -->
				</table>
				<!-- ELSE -->
				<div class="text text-muted">{PHP.L.payments_history_empty}</div>
				<!-- ENDIF -->

				<!-- ELSE -->
				<h6 class="m-b-2">{PHP.L.payments_balance_payout_list}</h6>
				<div class="text text-muted">У вас пока нет средств для вывода</div>
				<!-- ENDIF -->
				<!-- END: PAYOUTS -->

				<!-- BEGIN: PAYOUTFORM -->
				<h6 class="m-b-2">{PHP.L.payments_balance_payout_title}</h6>
				{FILE "{PHP.cfg.themes_dir}/{PHP.usr.theme}/warnings.tpl"}
				<form action="{PAYOUT_FORM_ACTION_URL}" method="post" id="payoutform" class="form-horizontal">
					<div class="form-group row">
						<label class="col-md-3 control-label">{PHP.L.payments_balance_payout_details}:</label>
						<div class="col-md-6">{PAYOUT_FORM_DETAILS}</div>
					</div>
					<div class="form-group row">
						<label class="col-md-3 control-label">{PHP.L.payments_balance_payout_summ}:</label>
						<div class="col-md-2">
						    {PAYOUT_FORM_SUMM}
					    </div>
						<div class="col-md-2 form-control-label">
						    {PHP.cfg.payments.valuta}
					    </div>
					</div>
					<!-- IF {PHP.cfg.payments.payouttax} > 0 -->
					<div class="form-group row">
						<label class="col-md-3 control-label">{PHP.L.payments_balance_payout_tax} ({PHP.cfg.payments.payouttax}%):</label>
						<div class="col-md-2"><span id="payout_tax">{PAYOUT_FORM_TAX}</span> {PHP.cfg.payments.valuta}</div>
					</div>
					<div class="form-group row">
						<label class="col-md-3 control-label">{PHP.L.payments_balance_payout_total}:</label>
						<div class="col-md-2"><span id="payout_total">{PAYOUT_FORM_TOTAL}</span> {PHP.cfg.payments.valuta}</div>
					</div>
					<!-- ENDIF -->
					<div class="form-group row">
						<div class="col-md-2"><button class="btn btn-primary">{PHP.L.Submit}</button></td>
						</div>
					</div>
				</form>
						
				<!-- IF {PHP.cfg.payments.payouttax} > 0 -->		
				<script>
					$().ready(function() {
						$('#payoutform').bind('change click keyup', function (){
							var summ = parseFloat($("input[name='summ']").val());
							var tax = parseFloat({PHP.cfg.payments.payouttax});

							if(isNaN(summ)) summ = 0;

							var taxsumm = summ*tax/100;
							var totalsumm = summ + taxsumm;

							$('#payout_tax').html(taxsumm);
							$('#payout_total').html(totalsumm);
						});
					});
				</script>
				<!-- ENDIF -->

				<!-- END: PAYOUTFORM -->

				<!-- BEGIN: TRANSFERS -->
				<!-- IF {BALANCE_SUMM} > 0 -->
				<a class="pull-xs-right btn btn-primary" href="{PHP|cot_url('payments', 'm=balance&n=transfers&a=add')}">{PHP.L.payments_balance_transfers_button}</a>
				<h6 class="m-b-2">{PHP.L.payments_balance_transfers_list}</h6>
				<!-- IF {PHP.transfers|count($this)} > 0 -->
				<table class="table table-striped">
					<thead>
						<tr>
							<th>ID</th>
							<th>{PHP.L.payments_balance_transfers_for}</th>
							<th class="text-right">{PHP.L.payments_summ}</th>
							<th>{PHP.L.Description}</th>
							<th class="text-right">{PHP.L.Date}</th>
							<th class="text-right">{PHP.L.Done}</th>
							<th class="text-right">{PHP.L.Status}</th>
						</tr>
					</thead>
					<!-- BEGIN: TRANSFER_ROW -->
					<tr>
						<td>{TRANSFER_ROW_ID}</td>
						<td><a href="{TRANSFER_ROW_FOR_DETAILSLINK}">{TRANSFER_ROW_FOR_FULL_NAME}</a></td>
						<td class="text-right">{TRANSFER_ROW_SUMM|number_format($this, '2', '.', ' ')} {PHP.cfg.payments.valuta}</td>
						<td>{TRANSFER_ROW_COMMENT}</td>
						<td class="text-right">{TRANSFER_ROW_DATE|cot_date('d.m.Y H:i', $this)}</td>
						<td class="text-right">{TRANSFER_ROW_DONE|cot_date('d.m.Y H:i', $this)}</td>
						<td class="text-right">{TRANSFER_ROW_LOCALSTATUS}</td>
					</tr>
					<!-- END: TRANSFER_ROW -->
				</table>
				<!-- ELSE -->
				<div class="text text-muted">{PHP.L.payments_history_empty}</div>
				<!-- ENDIF -->
				<!-- ELSE -->
				<h6 class="m-b-2">{PHP.L.payments_balance_transfers_list}</h6>
				<div class="text text-muted">У вас пока нет средств для перевода</div>
				<!-- ENDIF -->
				<!-- END: TRANSFERS -->

				<!-- BEGIN: TRANSFERFORM -->	
				<h6 class="m-b-2">{PHP.L.payments_transfer}</h6>
				{FILE "{PHP.cfg.themes_dir}/{PHP.usr.theme}/warnings.tpl"}
				<form action="{TRANSFER_FORM_ACTION_URL}" method="post" id="transferform" class="form-horizontal">
					<div class="form-group row">
						<label class="col-md-3 control-label">{PHP.L.payments_balance_transfer_comment}:</label>
						<div class="col-md-6">{TRANSFER_FORM_COMMENT}</div>
					</div>
					<div class="form-group row">
						<label class="col-md-3 control-label">{PHP.L.payments_balance_transfer_username}:</label>
						<div class="col-md-4">{TRANSFER_FORM_USERNAME}</div>
					</div>
					<div class="form-group row">
						<label class="col-md-3 control-label">{PHP.L.payments_balance_transfer_summ}:</label>
						<div class="col-md-2">
						    {TRANSFER_FORM_SUMM}
					    </div>
						<div class="col-md-2 form-control-label">
						    {PHP.cfg.payments.valuta}
					    </div>
					</div>
					<!-- IF {PHP.cfg.payments.transfertax} > 0 AND !{PHP.cfg.payments.transfertaxfromrecipient} -->
					<div class="form-group row">
						<label class="col-md-3 control-label">{PHP.L.payments_balance_transfer_tax} ({PHP.cfg.payments.transfertax}%):</label>
						<div class="col-md-2"><span id="transfer_tax">{TRANSFER_FORM_TAX}</span> {PHP.cfg.payments.valuta}</div>
					</div>
					<div class="form-group row">
						<label class="col-md-3 control-label">{PHP.L.payments_balance_transfer_total}:</label>
						<div class="col-md-2">
							<span id="transfer_total">{TRANSFER_FORM_TOTAL}</span> {PHP.cfg.payments.valuta}
						
							<script>
								$().ready(function() {
									$('#transferform').bind('change click keyup', function (){
										var summ = parseFloat($("input[name='summ']").val());
										var tax = parseFloat({PHP.cfg.payments.transfertax});

										if(isNaN(summ)) summ = 0;

										var taxsumm = summ*tax/100;
										var totalsumm = summ + taxsumm;

										$('#transfer_tax').html(taxsumm);
										$('#transfer_total').html(totalsumm);
									});
								});
							</script>
							
						</div>
					</div>
					<!-- ENDIF -->
					<div class="form-group row">
						<label class="col-md-3 control-label"></label>
						<div class="col-md-2"><button class="btn btn-primary">{PHP.L.Submit}</button></div>
					</div>
				</form>

				<!-- END: TRANSFERFORM -->

				<!-- BEGIN: HISTORY -->
				<h6 class="m-b-2">{PHP.L.payments_history}</h6>
				<!-- IF {HISTORY_COUNT} > 0 -->
				<table class="table table-striped">
					<thead>
						<tr>
							<th>#</th>
							<th>{PHP.L.Date}</th>
							<th>{PHP.L.Description}</th>
							<th class="text-xs-right">{PHP.L.payments_summ}</th>
						</tr>
					</thead>
					<tbody>
						<!-- BEGIN: HIST_ROW -->
						<tr>
							<td>{HIST_ROW_ID}</td>
							<td>{HIST_ROW_PDATE|cot_date('d.m.Y H:i', $this)}</td>
							<td>{HIST_ROW_DESC}</td>
							<td class="text-xs-right"><!-- IF {HIST_ROW_AREA} == 'balance' -->+<!-- ELSE -->-<!-- ENDIF --> {HIST_ROW_SUMM|number_format($this, '2', '.', ' ')} {PHP.cfg.payments.valuta}</td>
						</tr>
						<!-- END: HIST_ROW -->
					</tbody>
				</table>
				<!-- IF {PAGENAV_PAGES} -->
				<nav>
					<ul class="pagination">{PAGENAV_PREV}{PAGENAV_PAGES}{PAGENAV_NEXT}</ul>
				</nav>
				<!-- ENDIF -->
				<!-- ELSE -->
				<div class="text text-muted">{PHP.L.payments_history_empty}</div>
				<!-- ENDIF -->
				<!-- END: HISTORY -->
			</div>
		</div>
	</div>
</div>


<!-- END: MAIN -->