<!-- BEGIN: MAIN -->

<h3>{PHP.L.services}</h3>

<div class="well">	
	<form action="{SEARCH_ACTION_URL}" method="get">
		<input type="hidden" name="m" value="{PHP.m}" />
		<input type="hidden" name="p" value="{PHP.p}" />
		<input type="hidden" name="c" value="{PHP.c}" />
		<table width="100%" cellpadding="5" cellspacing="0">
			<tr>
				<td width="100">{PHP.L.Search}:</td>
				<td>{SEARCH_SQ}</td>
			</tr>
			<tr>
				<td width="100">{PHP.L.Location}:</td>
				<td>{SEARCH_LOCATION}</td>
			</tr>
			<tr>
				<td >{PHP.L.Category}:</td>
				<td>{SEARCH_CAT}</td>
			</tr>
			<tr>
				<td>{PHP.L.Order}:</td>
				<td>{SEARCH_SORTER}</td>
			</tr>
			<tr>
				<td></td>
				<td>{SEARCH_STATE}<br/></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" name="search" class="btn btn-success" value="{PHP.L.Search}" /></td>
			</tr>
		</table>		
	</form>
</div>

<form action="{PHP|cot_url('admin','m=services'),'',true}" id="serv_form" method="POST">
<div id="listservices">
	<!-- BEGIN: SERV_ROWS -->
	<div class="media">
		<!-- IF {SERV_ROW_MAVATAR.1} -->
		<div class="pull-left">
			<a href="{SERV_ROW_URL}"><div class="thumbnail"><img src="{SERV_ROW_MAVATAR.1|cot_mav_thumb($this, 100, 100, crop)}" /></div></a>
		</div>
		<!-- ENDIF -->
		<h4><!-- IF {SERV_ROW_COST} > 0 --><div class="cost pull-right">{SERV_ROW_COST} {PHP.cfg.payments.valuta}</div><!-- ENDIF --><a href="{SERV_ROW_URL}">{SERV_ROW_SHORTTITLE}</a></h4>
		<label><input type="checkbox" name="serv_arr[]" value="{SERV_ROW_ID}">Отметить</label>
		<p class="owner">{SERV_ROW_OWNER_NAME} <span class="date">[{SERV_ROW_DATE}]</span> &nbsp;{SERV_ROW_COUNTRY} {SERV_ROW_REGION} {SERV_ROW_CITY} &nbsp; {SERV_ROW_ADMIN_EDIT}</p>
		<div class="pull-right">
			<!-- IF {SERV_ROW_STATE} == 2 -->
			<a href="{SERV_ROW_VALIDATE_URL}" class="button btn btn-success">{PHP.L.Validate}</a>
			<!-- ENDIF -->
			<a href="{SERV_ROW_DELETE_URL}" class="button btn btn-warning">{PHP.L.Delete}</a>
		</div>
		<p class="text">{SERV_ROW_SHORTTEXT}</p>
		<p class="type"><a href="{SERV_ROW_CATURL}">{SERV_ROW_CATTITLE}</a></p>
	</div>
		<!-- END: SERV_ROWS -->
</div>	
<hr>
<div class="row">
	<div class="span3">
		<select name="serv_action" id="serv_action">
			<option value="0">---</option>
			<option value="delete">{PHP.L.Delete}</option>
			<option value="validate">{PHP.L.Validate}</option>
		</select>		
	</div>
	<div class="span9">
		<button type="submit" class="btn btn-default">{PHP.L.Confirm}</button>
	</div>
</div>

<!-- IF {PAGENAV_COUNT} > 0 -->	
<div class="pagination"><ul>{PAGENAV_PAGES}</ul></div>
<!-- ELSE -->
<div class="alert">{PHP.L.services_notfound}</div>
<!-- ENDIF -->
</form>	
<!-- END: MAIN -->