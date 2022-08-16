<!-- BEGIN: MAIN -->
<div class="breadcrumb">{BREADCRUMBS}</div>
<h1>{PHP.L.marketorders_sales_title}</h1>

<ul class="nav nav-tabs m-b-1" id="myTab">
	<li class="nav-item"><a class="nav-link<!-- IF !{PHP.status} --> active<!-- ENDIF -->" href="{PHP|cot_url('marketorders', 'm=sales')}">{PHP.L.All}</a></li>
	<li class="nav-item"><a class="nav-link<!-- IF {PHP.status} == 'paid' --> active<!-- ENDIF -->" href="{PHP|cot_url('marketorders', 'm=sales&status=paid')}">{PHP.L.marketorders_sales_paidorders}</a></li>
	<li class="nav-item"><a class="nav-link<!-- IF {PHP.status} == 'done' --> active<!-- ENDIF -->" href="{PHP|cot_url('marketorders', 'm=sales&status=done')}">{PHP.L.marketorders_sales_doneorders}</a></li>
	<li class="nav-item"><a class="nav-link<!-- IF {PHP.status} == 'claim' --> active<!-- ENDIF -->" href="{PHP|cot_url('marketorders', 'm=sales&status=claim')}">{PHP.L.marketorders_sales_claimorders}</a></li>
	<li class="nav-item"><a class="nav-link<!-- IF {PHP.status} == 'cancel' --> active<!-- ENDIF -->" href="{PHP|cot_url('marketorders', 'm=sales&status=cancel')}">{PHP.L.marketorders_sales_cancelorders}</a></li>
</ul>

<!-- BEGIN: ORDER_ROW -->	
<div class="card">
	<div class="card-block">
		<div class="media">
			<div class="pull-xs-right">{ORDER_ROW_COST} {PHP.cfg.payments.valuta}</div>
			<div class="media-body">
				<div class="media-header"><a href="{ORDER_ROW_URL}">№ {ORDER_ROW_ID} [{ORDER_ROW_PAID|date('d.m.Y H:i', $this)}]</a></div>
				<p>[ID {ORDER_ROW_PRD_ID}] <a href="{ORDER_ROW_PRD_URL}">{ORDER_ROW_PRD_SHORTTITLE}</a></p>
				<p><!-- IF {ORDER_ROW_CUSTOMER_ID} > 0 -->{ORDER_ROW_CUSTOMER_NAME}<!-- ELSE -->{ORDER_ROW_EMAIL}<!-- ENDIF --></p>
			</div>
		</div>	
	</div>	
</div>	
<!-- END: ORDER_ROW -->

<!-- IF {PAGENAV_COUNT} > 0 -->	
<nav><ul class="pagination">{PAGENAV_PAGES}</ul></nav>
<!-- ELSE -->
<div class="text-muted">{PHP.L.marketorders_empty}</div>
<!-- ENDIF -->

<!-- END: MAIN -->