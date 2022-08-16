<!-- BEGIN: MAIN -->
<div class="centerwrap">
 <div class="w780 mAuto clearfix">
	<div class="block block-msg">
		<h2>{PHP.L.yabilling_title}</h2>

    <!-- BEGIN: BILLINGFORM -->
    	<!-- IF !{PHP.cfg.plugin.yabilling.typechoise} -->
      	<div class="alert alert-info">{PHP.L.yabilling_formtext}</div>
      	<script>
      		$(document).ready(function(){
      			setTimeout(function() {
      				$("#yandexform").submit();
      			}, 3000);
      		});
      	</script>
    	<!-- ELSE -->
    	 <div class="alert alert-info">{PHP.L.yabilling_formtext1}</div>
    	<!-- ENDIF -->
    	{BILLING_FORM}
    <!-- END: BILLINGFORM -->

    <!-- BEGIN: ERROR -->
    <div class="alert alert-success">
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
    </div>
    <!-- END: ERROR -->
	</div>
 </div>
</div>
<!-- END: MAIN -->