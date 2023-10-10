<!-- BEGIN: MAIN -->
<div class="uk-card uk-card-default uk-card-body uk-border-rounded uk-margin-bottom uk-margin-top">
<h3>{PHP.L.orderservices}</h3>

<ul class="uk-list uk-list-divider nav nav-tabs" id="myTab">
	<li><a class="<!-- IF !{PHP.status} --> uk-button uk-button-warning uk-text-secondary <!-- ENDIF -->uk-link-heading" href="{PHP|cot_url('admin', 'm=other&p=orderservices')}">{PHP.L.All}</a></li>
	<!-- IF {PHP.cfg.plugin.orderservices.showneworderswithoutpayment} -->
	<li><a class="<!-- IF {PHP.status} == 'new' --> uk-button uk-button-warning uk-text-secondary<!-- ENDIF --> uk-link-heading" href="{PHP|cot_url('admin', 'm=other&p=orderservices&status=new')}">{PHP.L.orderservices_purchases_new}</a></li>
	<!-- ENDIF -->
	<li><a class="<!-- IF {PHP.status} == 'paid' --> uk-button uk-button-warning uk-text-secondary<!-- ENDIF --> uk-link-heading" href="{PHP|cot_url('admin', 'm=other&p=orderservices&status=paid')}">{PHP.L.orderservices_sales_paidorders}</a></li>
	<li><a class="<!-- IF {PHP.status} == 'done' -->  uk-button uk-button-warning uk-text-secondary<!-- ENDIF --> uk-link-heading" href="{PHP|cot_url('admin', 'm=other&p=orderservices&status=done')}">{PHP.L.orderservices_sales_doneorders}</a></li>
	<li><a class="<!-- IF {PHP.status} == 'claim' -->uk-button uk-button-warning uk-text-secondary<!-- ENDIF --> uk-link-heading" href="{PHP|cot_url('admin', 'm=other&p=orderservices&status=claim')}">{PHP.L.orderservices_sales_claimorders}</a></li>
	<li><a class="<!-- IF {PHP.status} == 'cancel' --> uk-button uk-button-warning uk-text-secondary<!-- ENDIF --> uk-link-heading" href="{PHP|cot_url('admin', 'm=other&p=orderservices&status=cancel')}">{PHP.L.orderservices_sales_cancelorders}</a></li>
</ul>
</div>


<ul class="uk-list">
<!-- BEGIN: ORDER_ROW -->
<li>
<div class="uk-card uk-card-small uk-card-default uk-card-hover uk-card-body uk-border-rounded uk-margin-bottom">
	<div class="pull-right">{ORDER_ROW_COST} {PHP.cfg.payments.valuta}</div>
	<div class="span2">
		<div class="media-header"><a href="{ORDER_ROW_URL}">№ {ORDER_ROW_ID} [<!-- IF {ORDER_ROW_PAID} > 0 -->{ORDER_ROW_PAID|date('d.m.Y H:i', $this)}<!-- ELSE -->{ORDER_ROW_DATE|date('d.m.Y H:i', $this)}<!-- ENDIF -->]</a></div>
	</div>
	<div class="span6">
		<a href="{ORDER_ROW_SERV_URL}">{ORDER_ROW_SERV_SHORTTITLE}</a> ({ORDER_ROW_SELLER_NAME})
	</div>
	<div class="span2">
		<!-- IF {ORDER_ROW_CUSTOMER_ID} > 0 -->{ORDER_ROW_CUSTOMER_NAME}<!-- ELSE -->{ORDER_ROW_EMAIL}<!-- ENDIF -->
	</div>
</div>
</li>
<!-- END: ORDER_ROW -->
</ul>
<!-- IF {PAGENAV_COUNT} > 0 -->
<div class="pagination"><ul class="uk-pagination uk-flex-center uk-margin-medium-top" uk-margin>{PAGENAV_PAGES}</ul></div>
<!-- ELSE -->
<div class="uk-alert-danger" uk-alert>
    <a class="uk-alert-close" uk-close></a>
    <p>{PHP.L.orderservices_empty}</p>
</div>
<!-- ENDIF -->

<!-- END: MAIN -->
