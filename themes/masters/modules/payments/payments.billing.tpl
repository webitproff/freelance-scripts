<!-- BEGIN: MAIN -->


<!-- BEGIN: BILLINGS -->
	<h3 class="m-y-2">{PHP.L.payments_billing_title}</h3>
	<!-- BEGIN: BILL_ROW -->
	<div class="media">
		<div class="media-left">
			<img src="<!-- IF {BILL_ROW_ICON} -->{BILL_ROW_ICON}<!-- ELSE -->apps/payments/images/billing_blank.png<!-- ENDIF -->" />
		</div>
		<div class="media-body">
			<h5><a href="{BILL_ROW_URL}">{BILL_ROW_TITLE}</a></h5>
		</div>
	</div>
	<!-- END: BILL_ROW -->
<!-- END: BILLINGS -->

<!-- BEGIN: EMPTYBILLINGS -->
	<h3 class="m-y-2">{PHP.L.payments_billing_title}</h3>
	<div class="text text-danger">{PHP.L.payments_emptybillings}</div>
<!-- END: EMPTYBILLINGS -->


<!-- END: MAIN -->