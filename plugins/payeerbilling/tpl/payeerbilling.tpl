<!-- BEGIN: MAIN -->

<div class="breadcrumb">{PHP.L.payeerbilling_title}</div>

<!-- BEGIN: BILLINGFORM -->
	<div class="alert alert-info">{PHP.L.payeerbilling_formtext}</div>
	<script>
		$(document).ready(function(){
			setTimeout(function() {
				$("#payeerform").submit();
			}, 3000);
		});
	</script>
	{BILLING_FORM}
<!-- END: BILLINGFORM -->

<!-- BEGIN: ERROR -->
	<h4>{BILLING_TITLE}</h4>
	{BILLING_ERROR}
	
	<!-- IF {BILLING_REDIRECT_URL} -->
	<br/>
	<p class="small">{BILLING_REDIRECT_TEXT}</p>
	<script>
		$(function(){
			setTimeout(function () {
				location.href='{BILLING_REDIRECT_URL}';
			}, 5000);
		});
	</script>
	<!-- ENDIF -->
	
<!-- END: ERROR -->


<!-- END: MAIN -->