<!-- BEGIN: MAIN -->

<h3>{PHP.L.payments_history} <!-- IF {PHP.p} == 'payouts' --> <span class="uk-text-warning">{PHP.L.payments_payouts_wallet}</span><!-- ENDIF --><!-- IF {PHP.p} == 'payoutscard' --> <span class="uk-text-warning">{PHP.L.payments_payouts_card}</span><!-- ENDIF --><!-- IF {PHP.p} == 'payoutsbank' --><span class="uk-text-warning">{PHP.L.payments_payouts_bank}</span> <!-- ENDIF --></h3>	
<div class="uk-card uk-card-body uk-card-small uk-background-default uk-border-rounded uk-margin-bottom button-toolbar well">
<div>
    <ul class="uk-child-width-expand@m uk-text-center" uk-grid>
        <li><a href="{PHP|cot_url('admin', 'm=payments')}" class="uk-button uk-button-small<!-- IF !{PHP.p} --> uk-button-primary<!-- ENDIF -->">{PHP.L.payments_allusers}</a></li>
        <li><a href="{PHP|cot_url('admin', 'm=payments&p=payouts')}" class="uk-button uk-button-small<!-- IF {PHP.p} == 'payouts' --> uk-button-primary<!-- ENDIF -->">{PHP.L.payments_payouts_wallet}</a></li>
        <li><a href="{PHP|cot_url('admin', 'm=payments&p=payoutscard')}" class="uk-button uk-button-small<!-- IF {PHP.p} == 'payoutscard' --> uk-button-primary<!-- ENDIF -->">{PHP.L.payments_payouts_card}</a></li>
        <li><a href="{PHP|cot_url('admin', 'm=payments&p=payoutsbank')}" class="uk-button uk-button-small<!-- IF {PHP.p} == 'payoutsbank' --> uk-button-primary<!-- ENDIF -->">{PHP.L.payments_payouts_bank}</a></li>
        <li><a href="{PHP|cot_url('admin', 'm=payments&p=transfers')}" class="uk-button uk-button-small<!-- IF {PHP.p} == 'transfers' --> uk-button-primary<!-- ENDIF -->">{PHP.L.payments_transfers}</a></li>
    </ul>
</div>

	<form action="{PHP.p|cot_url('admin', 'm=payments&p='$this)}" method="post" class="uk-form-stacked form-inline">
    <div class="uk-margin" uk-margin>
        <div uk-form-custom="target: true">
            <input type="text" class="uk-input uk-width-large" name="sq" value="{PHP.sq}">
        </div>
        <button type="submit" class="uk-button uk-button-primary">{PHP.L.Search}</button>
    </div>
	</form>
</div>
<!-- BEGIN: PAYMENTS -->
<div class="uk-card uk-card-body uk-card-small uk-background-default uk-border-rounded uk-margin-bottom button-toolbar well">
<h4>{PHP.L.payments_siteinvoices}:</h4>
<ul class="uk-list">
<!-- IF {PHP.cfg.payments.balance_enabled} -->
    <li>
		<div class="uk-grid-small" uk-grid>
			<div class="uk-width-expand" uk-leader>{PHP.L.payments_debet}: </div>
			<div>{INBALANCE} {PHP.cfg.payments.valuta}</div>
		</div>
	</li>
    <li>
		<div class="uk-grid-small" uk-grid>
			<div class="uk-width-expand" uk-leader>{PHP.L.payments_credit}: </div>
			<div>{OUTBALANCE} {PHP.cfg.payments.valuta}</div>
		</div>
	</li>
    <li>
		<div class="uk-grid-small" uk-grid>
			<div class="uk-width-expand" uk-leader>{PHP.L.payments_balance}: </div>
			<div>{BALANCE} {PHP.cfg.payments.valuta}</div>
		</div>
	</li>
<!-- ENDIF -->
    <li>
		<div class="uk-grid-small" uk-grid>
			<div class="uk-width-expand" uk-leader><b>{PHP.L.payments_allpayments}:</b></div>
			<div><b> {CREDIT} {PHP.cfg.payments.valuta}</b> </div>
		</div>
	</li>
</ul>

</div>

<div class="uk-overflow-auto">
<table class="uk-table uk-table-striped uk-table-hover uk-table-middle uk-table-divider uk-background-default">
<thead class="uk-background-secondary">
	<tr>
		<th class="uk-table-shrink"><span class="uk-text-bold uk-light">#</span></th>
		<th class="uk-table-shrink"></th>
		<th class="uk-table-shrink"><span class="uk-text-bold uk-text-capitalize uk-light">{PHP.L.User}</span></th>
		<th class="uk-table-shrink"><span class="uk-text-bold uk-text-capitalize uk-light">{PHP.L.Date}</span></th>
		<th class="uk-table-shrink"></th>
		<th class="uk-table-shrink"><span class="uk-text-bold uk-text-capitalize uk-light">{PHP.L.payments_summ}</span></th>
		<th class="uk-table-shrink"><span class="uk-text-bold uk-text-capitalize uk-light">{PHP.L.payments_desc}</span></th>
		<th class="uk-table-shrink"><span class="uk-text-bold uk-text-capitalize uk-light">{PHP.L.payments_area}</span></th>
		<th class="uk-table-shrink"><span class="uk-text-bold uk-text-capitalize uk-light">{PHP.L.payments_code}</span></th>
		<th class="uk-table-shrink"><span class="uk-text-bold uk-text-capitalize uk-light">{PHP.L.Status}</span></th>
	</tr>
	</thead>
	<tbody>
	<!-- BEGIN: PAY_ROW -->
	<tr>
		<td id="{PAY_ROW_ID}">{PAY_ROW_ID}</td>
		<td>
		  <a class="uk-link-heading" uk-tooltip="Страница пользователя" href="{PAY_ROW_USER_DETAILSLINK}">
		    <!-- IF {PAY_ROW_USER_AVATAR_SRC} -->
		    <img class="uk-preserve-width uk-border-rounded" src="{PAY_ROW_USER_AVATAR_SRC}" width="50" height="50" alt="">
		    <!-- ELSE -->
		    <img class="uk-preserve-width uk-border-rounded" src="{PHP.cfg.mainurl}/{PHP.cfg.themes_dir}/{PHP.cfg.defaulttheme}/img/avatar.png" width="50" height="50" alt="">
		    <!-- ENDIF -->
		  </a>
		</td>
		<td>
		  <a class="uk-link-heading" uk-tooltip="Все платежи пользователя" href="{PAY_ROW_USER_ID|cot_url('admin', 'm=payments&id='$this)}">
		    <span class="uk-text-middle uk-text-bold">
		      <!-- IF {PAY_ROW_USER_NAME_COMPANY} --> {PAY_ROW_USER_NAME_COMPANY} <span class="uk-link-text uk-margin-small-left"> [{PAY_ROW_USER_NICKNAME}]</span>
		      <!-- ELSE -->
		      <!-- IF {PAY_ROW_USER_FIRST_SECOND_NAME} -->
		      <span class="uk-text-warning"> {PAY_ROW_USER_FIRST_SECOND_NAME} <span class="uk-link-text uk-margin-small-left"> [{PAY_ROW_USER_NICKNAME}]</span>
		      </span>
		      <!-- ELSE -->
		      <span class="uk-link-text uk-margin-small-left"> {PAY_ROW_USER_NICKNAME} </span>
		      <!-- ENDIF -->
		      <!-- ENDIF -->
		    </span>
		  </a>
		</td>
		<td>{PAY_ROW_ADATE|date('d.m.Y H:i',$this)}</td>
		<td class="uk-text-center"><!-- IF {PAY_ROW_AREA} == 'balance' --><span class="uk-text-success" uk-tooltip="Поступило"><i class="fa-regular fa-square-plus fa-xl"></i></span><!-- ELSE --><span class="uk-text-danger" uk-tooltip="Убыло"><i class="fa-regular fa-square-minus fa-xl"></i></span><!-- ENDIF --></td>
		<td>{PAY_ROW_SUMM|number_format($this, 2, '.', ' ')}</td>
		<td>{PAY_ROW_DESC}</td>
		<td>{PAY_ROW_AREA}</td>
		<td>{PAY_ROW_CODE}</td>
		<td>{PAY_ROW_STATUS}</td>
	</tr>
	<!-- END: PAY_ROW -->
	</tbody>
	</table>
	
	<div class="uk-margin-top uk-flex uk-flex-center">
		<ul class="uk-pagination">{PAGENAV_PREV}{PAGENAV_PAGES}{PAGENAV_NEXT}</ul>
	</div>	
</div>
	
<!-- END: PAYMENTS -->

<!-- BEGIN: PAYOUTS -->
<div class="uk-overflow-auto">
<table class="uk-table uk-table-striped uk-table-hover uk-table-middle uk-table-divider uk-background-default">
<thead class="uk-background-secondary uk-light">
	<tr>
		<th class="uk-table-shrink"></th>
		<th class="uk-table-shrink"><span class="uk-text-bold uk-light">{PHP.L.User}</span></th>
		<th class="uk-table-shrink"><span class="uk-text-bold uk-light">{PHP.L.payments_summ}</span></th>
		<th class="uk-table-shrink"><span class="uk-text-bold uk-light">{PHP.L.payments_payouts_wallet_name}</span></th>
		<th class="uk-table-shrink"><span class="uk-text-bold uk-light">{PHP.L.payments_payouts_wallet_number}</span></th>		
		<th class="uk-table-shrink"><span class="uk-text-bold uk-light">{PHP.L.Description}</span></th>
		<th class="uk-table-shrink"><span class="uk-text-bold uk-light">{PHP.L.Date}</span></th>
		<th class="uk-table-shrink"><span class="uk-text-bold uk-light">{PHP.L.Status}</span></th>
		<th class="uk-table-shrink"><span class="uk-text-bold uk-light">{PHP.L.Action}</span></th>
	</tr>
</thead>	
<!-- BEGIN: PAYOUT_ROW -->
<!-- IF {PHP.payout.pay_area} == "payout" -->
	<tr>
		<td>
		  <a class="uk-link-heading" uk-tooltip="Страница пользователя" href="{PAYOUT_ROW_USER_DETAILSLINK}">
		    <!-- IF {PAYOUT_ROW_USER_AVATAR_SRC} -->
		    <img class="uk-preserve-width uk-border-rounded" src="{PAYOUT_ROW_USER_AVATAR_SRC}" width="50" height="50" alt="">
		    <!-- ELSE -->
		    <img class="uk-preserve-width uk-border-rounded" src="{PHP.cfg.mainurl}/{PHP.cfg.themes_dir}/{PHP.cfg.defaulttheme}/img/avatar.png" width="50" height="50" alt="">
		    <!-- ENDIF -->
		  </a>
		</td>
		<td>
		  <a class="uk-link-heading" uk-tooltip="Все платежи пользователя" href="{PAYOUT_ROW_USER_ID|cot_url('admin', 'm=payments&id='$this)}">
		    <span class="uk-text-middle uk-text-bold">
		      <!-- IF {PAYOUT_ROW_USER_NAME_COMPANY} --> {PAYOUT_ROW_USER_NAME_COMPANY} <span class="uk-link-text uk-margin-small-left"> [{PAYOUT_ROW_USER_NICKNAME}]</span>
		      <!-- ELSE -->
		      <!-- IF {PAYOUT_ROW_USER_FIRST_SECOND_NAME} -->
		      <span class="uk-text-warning"> {PAYOUT_ROW_USER_FIRST_SECOND_NAME} <span class="uk-link-text uk-margin-small-left"> [{PAYOUT_ROW_USER_NICKNAME}]</span>
		      </span>
		      <!-- ELSE -->
		      <span class="uk-link-text uk-margin-small-left"> {PAYOUT_ROW_USER_NICKNAME} </span>
		      <!-- ENDIF -->
		      <!-- ENDIF -->
		    </span>
		  </a>
		</td>
		<td>{PAYOUT_ROW_SUMM}</td>
		<td>{PAYOUT_ROW_WALLET_NAME}</td>
		<td>{PAYOUT_ROW_WALLET_NUMBER}</td>
		<td>{PAYOUT_ROW_DETAILS}</td>
		<td><!-- IF {PAYOUT_ROW_DATE} > 0 -->{PAYOUT_ROW_DATE|cot_date('d.m.Y H:i',$this)}<!-- ELSE -->&mdash;<!-- ENDIF --></td>
		<td>
<!-- IF {PAYOUT_ROW_STATUS} == 'done' --><span class="uk-button uk-button-small uk-button-primary">{PAYOUT_ROW_LOCALSTATUS}</span><!-- ELSE --><span class="uk-button uk-button-small uk-button-warning">{PAYOUT_ROW_LOCALSTATUS}</span><!-- ENDIF -->
	</td>
		<td>
			<!-- IF {PAYOUT_ROW_STATUS} == 'process' -->
			<p uk-margin>
			<a class="uk-button uk-button-small uk-button-success" href="{PAYOUT_ROW_DONE_URL}">{PHP.L.Confirm}</a> 
			<a class="uk-button uk-button-small uk-button-danger" href="{PAYOUT_ROW_CANCEL_URL}">{PHP.L.Cancel}</a>
			</p>
			<!-- ENDIF -->
		</td>
	</tr>
<!-- ENDIF -->
<!-- END: PAYOUT_ROW -->
</table>
</div>
<!-- END: PAYOUTS -->

<!-- BEGIN: PAYOUTSCARD -->
<div class="uk-overflow-auto">
<table class="uk-table uk-table-striped uk-table-hover uk-table-middle uk-table-divider uk-background-default">
<thead class="uk-background-secondary uk-light">
	<tr>
		<th class="uk-table-shrink"></th>
		<th class="uk-table-shrink"><span class="uk-text-bold uk-light">{PHP.L.User}</span></th>
		<th class="uk-table-shrink"><span class="uk-text-bold uk-light">{PHP.L.payments_summ}</span></th>
				        <th class="uk-table-shrink">
				          <span class="uk-text-bold uk-light">{PHP.L.payments_balance_payoutform_card_number_short}</span>
						</th>
				        <th class="uk-table-shrink">
				          <span class="uk-text-bold uk-light">{PHP.L.payments_balance_payoutform_card_bank_short}</span>
						</th>
		<th class="uk-table-shrink"><span class="uk-text-bold uk-light">{PHP.L.Description}</span></th>
		<th class="uk-table-shrink"><span class="uk-text-bold uk-light">{PHP.L.Date}</span></th>
		<th class="uk-table-shrink"><span class="uk-text-bold uk-light">{PHP.L.Status}</span></th>
		<th class="uk-table-shrink"><span class="uk-text-bold uk-light">{PHP.L.Action}</span></th>
	</tr>
</thead>	
<!-- BEGIN: PAYOUTSCARD_ROW -->
<!-- IF {PHP.payoutcard.pay_area} == "payoutcard" -->
	<tr>
		<td>
		  <a class="uk-link-heading" uk-tooltip="Страница пользователя" href="{PAYOUTSCARD_ROW_USER_DETAILSLINK}">
		    <!-- IF {PAYOUTSCARD_ROW_USER_AVATAR_SRC} -->
		    <img class="uk-preserve-width uk-border-rounded" src="{PAYOUTSCARD_ROW_USER_AVATAR_SRC}" width="50" height="50" alt="">
		    <!-- ELSE -->
		    <img class="uk-preserve-width uk-border-rounded" src="{PHP.cfg.mainurl}/{PHP.cfg.themes_dir}/{PHP.cfg.defaulttheme}/img/avatar.png" width="50" height="50" alt="">
		    <!-- ENDIF -->
		  </a>
		</td>
		<td>
		  <a class="uk-link-heading" uk-tooltip="Все платежи пользователя" href="{PAYOUTSCARD_ROW_USER_ID|cot_url('admin', 'm=payments&id='$this)}">
		    <span class="uk-text-middle uk-text-bold">
		      <!-- IF {PAYOUTSCARD_ROW_USER_NAME_COMPANY} --> {PAYOUTSCARD_ROW_USER_NAME_COMPANY} <span class="uk-link-text uk-margin-small-left"> [{PAYOUTSCARD_ROW_USER_NICKNAME}]</span>
		      <!-- ELSE -->
		      <!-- IF {PAYOUTSCARD_ROW_USER_FIRST_SECOND_NAME} -->
		      <span class="uk-text-warning"> {PAYOUTSCARD_ROW_USER_FIRST_SECOND_NAME} <span class="uk-link-text uk-margin-small-left"> [{PAYOUTSCARD_ROW_USER_NICKNAME}]</span>
		      </span>
		      <!-- ELSE -->
		      <span class="uk-link-text uk-margin-small-left"> {PAYOUTSCARD_ROW_USER_NICKNAME} </span>
		      <!-- ENDIF -->
		      <!-- ENDIF -->
		    </span>
		  </a>
		</td>
		<td>{PAYOUTSCARD_ROW_SUMM}</td>
		<td>{PAYOUTSCARD_ROW_NUMBER}</td>
		<td>{PAYOUTSCARD_ROW_BANK}</td>
		<td>{PAYOUTSCARD_ROW_DETAILS}</td>
		<td><!-- IF {PAYOUTSCARD_ROW_DATE} > 0 -->{PAYOUTSCARD_ROW_DATE|cot_date('d.m.Y H:i',$this)}<!-- ELSE -->&mdash;<!-- ENDIF --></td>
		<td>
<!-- IF {PAYOUTSCARD_ROW_STATUS} == 'done' --><span class="uk-button uk-button-small uk-button-primary">{PAYOUTSCARD_ROW_LOCALSTATUS}</span><!-- ELSE --><span class="uk-button uk-button-small uk-button-warning">{PAYOUTSCARD_ROW_LOCALSTATUS}</span><!-- ENDIF -->
	</td>
		<td>
			<!-- IF {PAYOUTSCARD_ROW_STATUS} == 'process' -->
			<p uk-margin>
			<a class="uk-button uk-button-small uk-button-success" href="{PAYOUTSCARD_ROW_DONE_URL}">{PHP.L.Confirm}</a> 
			<a class="uk-button uk-button-small uk-button-danger" href="{PAYOUTSCARD_ROW_CANCEL_URL}">{PHP.L.Cancel}</a>
			</p>
			<!-- ENDIF -->
		</td>
	</tr>
<!-- ENDIF -->
<!-- END: PAYOUTSCARD_ROW -->
</table>
</div>
<!-- END: PAYOUTSCARD -->

<!-- BEGIN: PAYOUTSBANK -->
<div class="uk-overflow-auto">
<table class="uk-table uk-table-striped uk-table-hover uk-table-middle uk-table-divider uk-background-default">
<thead class="uk-background-secondary uk-light">
	<tr>
		<th class="uk-table-shrink"></th>
		<th class="uk-table-shrink"><span class="uk-text-bold uk-light">{PHP.L.User}</span></th>
		<th class="uk-table-shrink"><span class="uk-text-bold uk-light">{PHP.L.payments_summ}</span></th>
		<th class="uk-table-shrink"><span class="uk-text-bold uk-light">{PHP.L.Description}</span></th>
		<th class="uk-table-shrink"><span class="uk-text-bold uk-light">{PHP.L.payments_balance_payoutform_req_fio_short}</span></th>
		<th class="uk-table-shrink"><span class="uk-text-bold uk-light">{PHP.L.payments_balance_payoutform_req_inn_short}</span></th>
		<th class="uk-table-shrink"><span class="uk-text-bold uk-light">{PHP.L.payments_balance_payoutform_req_kpp_short}</span></th>
		<th class="uk-table-shrink"><span class="uk-text-bold uk-light">{PHP.L.payments_balance_payoutform_req_bik_short}</span></th>
		<th class="uk-table-shrink"><span class="uk-text-bold uk-light">{PHP.L.payments_balance_payoutform_req_bankaccount_short}</span></th>
		<th class="uk-table-shrink"><span class="uk-text-bold uk-light">{PHP.L.Date}</span></th>
		<th class="uk-table-shrink"><span class="uk-text-bold uk-light">{PHP.L.Status}</span></th>
		<th class="uk-table-shrink"><span class="uk-text-bold uk-light">{PHP.L.Action}</span></th>
	</tr>
</thead>	
<!-- BEGIN: PAYOUTBANK_ROW -->
<!-- IF {PHP.payoutbank.pay_area} == "payoutbank" -->
	<tr>
		<td>
		  <a class="uk-link-heading" uk-tooltip="Страница пользователя" href="{PAYOUTBANK_ROW_USER_DETAILSLINK}">
		    <!-- IF {PAYOUTBANK_ROW_USER_AVATAR_SRC} -->
		    <img class="uk-preserve-width uk-border-rounded" src="{PAYOUTBANK_ROW_USER_AVATAR_SRC}" width="50" height="50" alt="">
		    <!-- ELSE -->
		    <img class="uk-preserve-width uk-border-rounded" src="{PHP.cfg.mainurl}/{PHP.cfg.themes_dir}/{PHP.cfg.defaulttheme}/img/avatar.png" width="50" height="50" alt="">
		    <!-- ENDIF -->
		  </a>
		</td>
		<td>
		  <a class="uk-link-heading" uk-tooltip="Все платежи пользователя" href="{PAYOUTBANK_ROW_USER_ID|cot_url('admin', 'm=payments&id='$this)}">
		    <span class="uk-text-middle uk-text-bold">
		      <!-- IF {PAYOUTBANK_ROW_USER_NAME_COMPANY} --> {PAYOUTBANK_ROW_USER_NAME_COMPANY} <span class="uk-link-text uk-margin-small-left"> [{PAYOUTBANK_ROW_USER_NICKNAME}]</span>
		      <!-- ELSE -->
		      <!-- IF {PAYOUTBANK_ROW_USER_FIRST_SECOND_NAME} -->
		      <span class="uk-text-warning"> {PAYOUTBANK_ROW_USER_FIRST_SECOND_NAME} <span class="uk-link-text uk-margin-small-left"> [{PAYOUTBANK_ROW_USER_NICKNAME}]</span>
		      </span>
		      <!-- ELSE -->
		      <span class="uk-link-text uk-margin-small-left"> {PAYOUTBANK_ROW_USER_NICKNAME} </span>
		      <!-- ENDIF -->
		      <!-- ENDIF -->
		    </span>
		  </a>
		</td>
		<td>{PAYOUTBANK_ROW_SUMM}</td>
		<td>{PAYOUTBANK_ROW_DETAILS}</td>
		<td>{PAYOUTBANK_ROW_REQ_FIO}</td>
		<td>{PAYOUTBANK_ROW_REQ_INN}</td>
		<td>{PAYOUTBANK_ROW_REQ_KPP}</td>
		<td>{PAYOUTBANK_ROW_REQ_BIK}</td>
		<td>{PAYOUTBANK_ROW_REQ_BANK_ACCOUNT}</td>
		<td><!-- IF {PAYOUTBANK_ROW_DATE} > 0 -->{PAYOUTBANK_ROW_DATE|cot_date('d.m.Y H:i',$this)}<!-- ELSE -->&mdash;<!-- ENDIF --></td>
		<td>
<!-- IF {PAYOUTBANK_ROW_STATUS} == 'done' --><span class="uk-button uk-button-small uk-button-primary">{PAYOUTBANK_ROW_LOCALSTATUS}</span><!-- ELSE --><span class="uk-button uk-button-small uk-button-warning">{PAYOUTBANK_ROW_LOCALSTATUS}</span><!-- ENDIF -->
	</td>
		<td>
			<!-- IF {PAYOUTBANK_ROW_STATUS} == 'process' -->
			<p uk-margin>
			<a class="uk-button uk-button-small uk-button-success" href="{PAYOUTBANK_ROW_DONE_URL}">{PHP.L.Confirm}</a> 
			<a class="uk-button uk-button-small uk-button-danger" href="{PAYOUTBANK_ROW_CANCEL_URL}">{PHP.L.Cancel}</a>
			</p>
			<!-- ENDIF -->
		</td>
	</tr>
<!-- ENDIF -->
<!-- END: PAYOUTBANK_ROW -->
</table>
</div>
<!-- END: PAYOUTSBANK -->

<!-- BEGIN: TRANSFERS -->
<table class="cells table table-bordered table-striped">
<thead>
	<tr>
		<th class="span2">{PHP.L.payments_balance_transfers_from}</th>
		<th class="span2">{PHP.L.payments_balance_transfers_for}</th>
		<th class="span2">{PHP.L.payments_summ}</th>
		<th>{PHP.L.Description}</th>
		<th>{PHP.L.Date}</th>
		<th>{PHP.L.Done}</th>
		<th>{PHP.L.Status}</th>
		<th>{PHP.L.Action}</th>
	</tr>
</thead>	
<!-- BEGIN: TRANSFER_ROW -->
	<tr>
		<td><a href="{TRANSFER_ROW_FROM_DETAILSLINK}">{TRANSFER_ROW_FROM_FULL_NAME}</a></td>
		<td><a href="{TRANSFER_ROW_FOR_DETAILSLINK}">{TRANSFER_ROW_FOR_FULL_NAME}</a></td>
		<td>{TRANSFER_ROW_SUMM}</td>
		<td>{TRANSFER_ROW_COMMENT}</td>
		<td>{TRANSFER_ROW_DATE|cot_date('d.m.Y H:i',$this)}</td>
		<td><!-- IF {TRANSFER_ROW_DONE} > 0 -->{TRANSFER_ROW_DONE|cot_date('d.m.Y H:i',$this)}<!-- ELSE -->&mdash;<!-- ENDIF --></td>
		<td>{TRANSFER_ROW_LOCALSTATUS}</td>
		<td>
			<!-- IF {TRANSFER_ROW_STATUS} == 'process' -->
			<a href="{TRANSFER_ROW_DONE_URL}">{PHP.L.Confirm}</a>
			<a href="{TRANSFER_ROW_CANCEL_URL}">{PHP.L.Cancel}</a>
			<!-- ENDIF -->
		</td>
	</tr>
<!-- END: TRANSFER_ROW -->
</table>
<!-- END: TRANSFERS -->
			
<!-- END: MAIN -->