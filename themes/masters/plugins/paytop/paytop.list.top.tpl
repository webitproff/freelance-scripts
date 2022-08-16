<!-- BEGIN: MAIN -->
<div class="row">
	<!-- BEGIN: TOP_ROW -->
	<div class="col-md-3">
		<div class="profile_paytop media m-b-2">
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

	<!-- IF {PAYTOP_COUNT} <= 4 -->
		<!-- FOR {INDEX} IN {PHP|range(1, 4)} -->
			<!-- IF 4 - {INDEX} >= {PAYTOP_COUNT} -->
			<div class="col-md-3">
				<div class="profile_paytop media m-b-2">
					<div class="media-left">
						<img class="avatar" src="datas/defaultav/blank.png">
					</div>
					<div class="media-body">
						<div class="media-heading">{PHP.L.paytop_default_text}</div>
					</div>
				</div>
			</div>
			<!-- ENDIF -->
		<!-- ENDFOR -->
	<!-- ENDIF -->

</div>	
<!-- IF {PHP.usr.id} -->
<p class="m-t-1 text-xs-center"><a href="{PAYTOP_BUY_URL}">{PHP.L.paytop_how}</a></p>
<!-- ENDIF -->

<!-- END: MAIN -->