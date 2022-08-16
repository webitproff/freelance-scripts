<!-- BEGIN: MAIN -->

<h3>{PHP.L.orderservices_sales_title}</h3>

<ul class="nav nav-tabs" id="myTab">
	<li<!-- IF !{PHP.status} --> class="active"<!-- ENDIF -->><a href="{PHP|cot_url('admin', 'm=other&p=orderservices')}">{PHP.L.All}</a></li>
	<!-- IF {PHP.cfg.plugin.orderservices.showneworderswithoutpayment} -->
	<li<!-- IF {PHP.status} == 'new' --> class="active"<!-- ENDIF -->><a href="{PHP|cot_url('admin', 'm=other&p=orderservices&status=new')}">{PHP.L.orderservices_purchases_new}</a></li>
	<!-- ENDIF -->
	<li<!-- IF {PHP.status} == 'paid' --> class="active"<!-- ENDIF -->><a href="{PHP|cot_url('admin', 'm=other&p=orderservices&status=paid')}">{PHP.L.orderservices_sales_paidorders}</a></li>
	<li<!-- IF {PHP.status} == 'done' --> class="active"<!-- ENDIF -->><a href="{PHP|cot_url('admin', 'm=other&p=orderservices&status=done')}">{PHP.L.orderservices_sales_doneorders}</a></li>
	<li<!-- IF {PHP.status} == 'claim' --> class="active"<!-- ENDIF -->><a href="{PHP|cot_url('admin', 'm=other&p=orderservices&status=claim')}">{PHP.L.orderservices_sales_claimorders}</a></li>
	<li<!-- IF {PHP.status} == 'cancel' --> class="active"<!-- ENDIF -->><a href="{PHP|cot_url('admin', 'm=other&p=orderservices&status=cancel')}">{PHP.L.orderservices_sales_cancelorders}</a></li>
</ul>

<!-- BEGIN: ORDER_ROW -->
<div class="media">
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
<hr/>
<!-- END: ORDER_ROW -->

<!-- IF {PAGENAV_COUNT} > 0 -->
<div class="pagination"><ul>{PAGENAV_PAGES}</ul></div>
<!-- ELSE -->
<div class="alert">{PHP.L.orderservices_empty}</div>
<!-- ENDIF -->

<!-- END: MAIN -->
