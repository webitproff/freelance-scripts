<!-- BEGIN: MAIN -->
<ul<!-- IF {CAT_LEVEL} == 1 --> id="ucats_tree" class="nav nav-pills nav-stacked"<!-- ENDIF -->>
	<!-- IF {CAT_LEVEL} == 1 -->
	<li class="nav-item"><a class="nav-link" href="{CAT_URL}">{PHP.L.All}</a></li>		
	<!-- ENDIF -->
	<!-- BEGIN: CAT_ROW -->
	<li class="nav-item"><a class="nav-link<!-- IF {CAT_ROW_SELECTED} --> active<!-- ENDIF -->" href="{CAT_ROW_URL}">{CAT_ROW_TITLE} ({CAT_ROW_COUNT})</a>
		<!-- IF {CAT_ROW_SUBCAT} -->
		{CAT_ROW_SUBCAT}
		<!-- ENDIF -->
	</li>
	<!-- END: CAT_ROW -->
</ul>
<!-- END: MAIN -->