<!-- BEGIN: MAIN -->
<div class="breadcrumb">{BREADCRUMBS}</div>
<h1>{PHP.L.orderservices_sales_title}</h1>

<ul class="nav nav-tabs" id="myTab">
	<li<!-- IF !{PHP.status} --> class="active"<!-- ENDIF -->><a href="{PHP|cot_url('orderservices', 'm=sales')}">{PHP.L.All}</a></li>
	<li<!-- IF {PHP.status} == 'paid' --> class="active"<!-- ENDIF -->><a href="{PHP|cot_url('orderservices', 'm=sales&status=paid')}">{PHP.L.orderservices_sales_paidorders}</a></li>
	<li<!-- IF {PHP.status} == 'done' --> class="active"<!-- ENDIF -->><a href="{PHP|cot_url('orderservices', 'm=sales&status=done')}">{PHP.L.orderservices_sales_doneorders}</a></li>
	<li<!-- IF {PHP.status} == 'claim' --> class="active"<!-- ENDIF -->><a href="{PHP|cot_url('orderservices', 'm=sales&status=claim')}">{PHP.L.orderservices_sales_claimorders}</a></li>
	<li<!-- IF {PHP.status} == 'cancel' --> class="active"<!-- ENDIF -->><a href="{PHP|cot_url('orderservices', 'm=sales&status=cancel')}">{PHP.L.orderservices_sales_cancelorders}</a></li>
</ul>

<!-- BEGIN: ORDER_ROW -->	
<div class="media">
	<div class="pull-right">{ORDER_ROW_COST} {PHP.cfg.payments.valuta}</div>
	<div class="span2">
		<div class="media-header"><a href="{ORDER_ROW_URL}">№ {ORDER_ROW_ID} [{ORDER_ROW_PAID|date('d.m.Y H:i', $this)}]</a></div>
	</div>
	<div class="span6">
		[ID {ORDER_ROW_SERV_ID}] <a href="{ORDER_ROW_SERV_URL}">{ORDER_ROW_SERV_SHORTTITLE}</a>
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