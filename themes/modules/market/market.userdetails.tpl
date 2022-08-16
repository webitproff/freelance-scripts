<!-- BEGIN: MAIN -->
	<h4><!-- IF {PHP.usr.id} == {PHP.urr.user_id} AND {ADDPRD_SHOWBUTTON} --><div class="pull-xs-right"><a href="{PRD_ADDPRD_URL}" class="btn btn-success">{PHP.L.market_add_product}</a></div><!-- ENDIF -->{PHP.L.market}</h4>
	
	<!-- IF {PAGENAV_COUNT} > 0 -->	
	<ul class="nav nav-inline">
		<a class="nav-link" href="{PHP.urr.user_id|cot_url('users', 'm=details&id=$this&tab=market')}">{PHP.L.All}</a>
	  	<!-- BEGIN: CAT_ROW -->
		<a class="nav-link<!-- IF {PRD_CAT_ROW_SELECT} --> active<!-- ENDIF -->" href="{PRD_CAT_ROW_URL}">
			<!-- IF {PRD_ROW_CAT_ICON} -->
				<img src="{PRD_CAT_ROW_ICON}" alt="{PRD_CAT_ROW_TITLE} ">
			<!-- ENDIF -->
			{PRD_CAT_ROW_TITLE} 
			<span class="badge badge-inverse">{PRD_CAT_ROW_COUNT_MARKET}</span>
		</a>
	  	<!-- END: CAT_ROW -->
	</ul>
	<hr>
	<div class="row">
	<!-- BEGIN: PRD_ROWS -->
		<div class="col-md-3">
			<div class="media">
				<div class="media-heading"><a href="{PRD_ROW_URL}">{PRD_ROW_SHORTTITLE}</a></div>
				<!-- IF {PRD_ROW_USER_IS_ADMIN} --><p class="label label-info">{PRD_ROW_LOCALSTATUS}</p><!-- ENDIF -->
				<!-- IF {PRD_ROW_MAVATAR.1} -->
				<p><a href="{PRD_ROW_URL}"><img src="{PRD_ROW_MAVATAR.1|cot_mav_thumb($this, 200, 200, crop)}" /></a></p>
				<!-- ENDIF -->
				<!-- IF {PRD_ROW_COST} > 0 --><p class="cost">{PRD_ROW_COST} {PHP.cfg.payments.valuta}</p><!-- ENDIF -->
			</div>
		</div>
	<!-- END: PRD_ROWS -->
	</div>
	
	<nav><ul class="pagination">{PAGENAV_PAGES}</ul></nav>
	<!-- ELSE -->
	<div class="text-muted">{PHP.L.market_empty}</div>
	<!-- ENDIF -->

<!-- END: MAIN -->