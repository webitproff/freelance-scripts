<!-- BEGIN: MAIN -->
	<h4><!-- IF {PHP.usr.id} == {PHP.urr.user_id} AND {ADDSERV_SHOWBUTTON} --><div class="pull-right"><a href="{SERV_ADDSERV_URL}" class="btn btn-success">{PHP.L.services_add_product}</a></div><!-- ENDIF -->{PHP.L.services}</h4>
	
	<ul class="nav nav-pills">
	  <li>
	 	  <a href="{PHP.urr.user_id|cot_url('users', 'm=details&id=$this&tab=services')}">{PHP.L.All}</a>
	  </li>
	  	<!-- BEGIN: CAT_ROW -->
	  		<li class="centerall <!-- IF {SERV_CAT_ROW_SELECT} -->active<!-- ENDIF -->">
	  				<a href="{SERV_CAT_ROW_URL}">
	  						<!-- IF {SERV_ROW_CAT_ICON} -->
	  							<img src="{SERV_CAT_ROW_ICON}" alt="{SERV_CAT_ROW_TITLE} ">
	  						<!-- ENDIF -->
	  						{SERV_CAT_ROW_TITLE} 
	  					<span class="badge badge-inverse">{SERV_CAT_ROW_COUNT_SERVICES}</span>
	  				</a>
	  		</li>
	  	<!-- END: CAT_ROW -->
	</ul>
	<hr>
	<div class="row">
	<!-- BEGIN: SERV_ROWS -->
		<div class="span3 pull-left">
			<h5><a href="{SERV_ROW_URL}">{SERV_ROW_SHORTTITLE}</a></h5>
			<!-- IF {SERV_ROW_USER_IS_ADMIN} --><span class="label label-info">{SERV_ROW_LOCALSTATUS}</span><!-- ENDIF -->
			<!-- IF {SERV_ROW_MAVATAR.1} -->
			<a href="{SERV_ROW_URL}"><img src="{SERV_ROW_MAVATAR.1|cot_mav_thumb($this, 200, 200, crop)}" /></a>
			<!-- ENDIF -->
			<!-- IF {SERV_ROW_COST} > 0 --><div class="cost">{SERV_ROW_COST} {PHP.cfg.payments.valuta}</div><!-- ENDIF -->
		</div>
	<!-- END: SERV_ROWS -->
	</div>
	
	<!-- IF {PAGENAV_COUNT} > 0 -->	
	<div class="pagination"><ul>{PAGENAV_PAGES}</ul></div>
	<!-- ELSE -->
	<div class="alert">{PHP.L.services_empty}</div>
	<!-- ENDIF -->

<!-- END: MAIN -->