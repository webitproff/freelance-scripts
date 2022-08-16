<!-- BEGIN: MAIN -->
<ul<!-- IF {CAT_LEVEL} == 0 --> id="ucats_list" class="nav nav-pills nav-stacked"<!-- ENDIF -->>
	<!-- BEGIN: CAT_ROW -->
	<!-- IF {CAT_ROW_SELECTED} -->
	<li class="nav-item"><a class="nav-link" href="{CAT_ROW_URL}">{CAT_ROW_TITLE}</a>
		<!-- IF {CAT_ROW_SUBCAT} -->
		{CAT_ROW_SUBCAT}
		<!-- ENDIF -->
	</li>
	<!-- ENDIF -->
	<!-- END: CAT_ROW -->
</ul>
<!-- END: MAIN -->