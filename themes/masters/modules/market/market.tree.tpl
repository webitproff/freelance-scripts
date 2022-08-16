<!-- BEGIN: MAIN -->
<ul<!-- IF {LEVEL} == 0 --> class="nav nav-pills nav-stacked"<!-- ENDIF -->>
	<!-- IF {LEVEL} == 0 -->
	<li class="nav-item"><a class="nav-link<!-- IF !{PHP.c} --> active<!-- ENDIF -->" href="{HREF}">{PHP.L.All}</a></li>		
	<!-- ENDIF -->
	<!-- BEGIN: CATS -->
	<li class="nav-item"><a class="nav-link<!-- IF {ROW_SELECTED} --> active<!-- ENDIF -->" href="{ROW_HREF}">{ROW_TITLE} ({ROW_COUNT})</a>
		<!-- IF {ROW_SUBCAT} -->
		{ROW_SUBCAT}
		<!-- ENDIF -->
	</li>
	<!-- END: CATS -->
</ul>
<!-- END: MAIN -->