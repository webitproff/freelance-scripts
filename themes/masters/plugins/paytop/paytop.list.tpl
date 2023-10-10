<!-- BEGIN: MAIN -->
<div class="row">
	<!-- BEGIN: TOP_ROW -->
	<div class="col-md-3">
		<div class="media m-b-2">
			<div class="media-left">
				<a href="{TOP_ROW_DETAILSLINK}">{TOP_ROW_AVATAR}</a>
			</div>
			<div class="media-body">
				<div class="media-heading"><a href="{TOP_ROW_DETAILSLINK}">{TOP_ROW_FULL_NAME}</a></div>
				<p>
					<!-- IF {TOP_ROW_ISPRO} -->
					<span class="label label-success">PRO</span> 
					<!-- ENDIF -->
					<span class="label label-info">{TOP_ROW_USERPOINTS}</span>
				</p>
			</div>
		</div>
	</div>
	<!-- END: TOP_ROW -->
</div>	
<div class="pull-right"><a href="{PAYTOP_BUY_URL}">{PHP.L.paytop_how}</a></div>
<hr/>
<!-- END: MAIN -->