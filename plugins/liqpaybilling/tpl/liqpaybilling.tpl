<!-- BEGIN: MAIN -->

<div class="breadcrumb">{PHP.L.liqpaybilling_title}</div>

<!-- BEGIN: BILLINGFORM -->
	<div class="alert alert-info">{PHP.L.liqpaybilling_formtext}</div>
	<script>
		$(document).ready(function(){
			setTimeout(function() {
				$("#liqpayform").submit();
			}, 3000);
		});
	</script>
	{BILLING_FORM}
<!-- END: BILLINGFORM -->

<!-- BEGIN: ERROR -->
	<h4>{BILLING_TITLE}</h4>
	{BILLING_ERROR}
<!-- END: ERROR -->


<!-- END: MAIN -->