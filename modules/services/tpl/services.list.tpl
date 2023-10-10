<!-- BEGIN: MAIN -->
<div class="breadcrumb">
	{BREADCRUMBS}
</div>
<!-- IF {PHP.usr.auth_write} -->
<div class="pull-right padding15">
	<a class="btn btn-success" href="{PHP|cot_url('services', 'm=add')}">{PHP.L.services_add_product}</a>
</div>	
<!-- ENDIF -->
<h1>
<!-- IF {PHP.c} -->
	{CATTITLE}
<!-- ELSE -->
	{PHP.L.services}
<!-- ENDIF -->
</h1>
<!-- IF {CATDESC} -->
<div class="well">{CATDESC}</div>
<!-- ENDIF -->
<div class="row">
	<div class="span3">
		<!-- IF {CATALOG} --><div class="well well-small">{CATALOG}</div><!-- ENDIF -->
		
		<!-- IF {PHP.cot_plugins_active.tags} AND {PHP.cot_plugins_active.tagslance} AND {PHP.cfg.plugin.tagslance.services} -->
		<div class="mboxHD">{PHP.L.Tags}</div>
		{SERV_TAG_CLOUD}
		<!-- ENDIF -->
		
	</div>
	<div class="span9">
		<div class="well">	
			<form action="{SEARCH_ACTION_URL}" method="get">
				<input type="hidden" name="e" value="services" />
				<input type="hidden" name="l" value="{PHP.lang}" />
				<table width="100%" cellpadding="5" cellspacing="0">
					<tr>
						<td width="100">{PHP.L.Search}:</td>
						<td>{SEARCH_SQ}</td>
					</tr>
					<!-- IF {PHP.cot_plugins_active.locationselector} -->
					<tr>
						<td width="100">{PHP.L.Location}:</td>
						<td>{SEARCH_LOCATION}</td>
					</tr>
					<!-- ENDIF -->
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
						<td><input type="submit" name="search" class="btn" value="{PHP.L.Search}" /></td>
					</tr>
				</table>		
			</form>
		</div>

		<div id="listservices">
			<!-- BEGIN: SERV_ROWS -->
			<div class="media">
				<!-- IF {SERV_ROW_MAVATAR.1} -->
				<div class="pull-left">
					<a href="{SERV_ROW_URL}"><div class="thumbnail"><img src="{SERV_ROW_MAVATAR.1|cot_mav_thumb($this, 100, 100, crop)}" /></div></a>
				</div>
				<!-- ENDIF -->
				<h4><!-- IF {SERV_ROW_COST} > 0 --><div class="cost pull-right">{SERV_ROW_COST} {PHP.cfg.payments.valuta}</div><!-- ENDIF --><a href="{SERV_ROW_URL}">{SERV_ROW_SHORTTITLE}</a></h4>
				<p class="owner">{SERV_ROW_OWNER_NAME} <span class="date">[{SERV_ROW_DATE}]</span> &nbsp;{SERV_ROW_COUNTRY} {SERV_ROW_REGION} {SERV_ROW_CITY} &nbsp; {SERV_ROW_EDIT_URL}</p>
				<p class="text">{SERV_ROW_SHORTTEXT}</p>
				<p class="type"><a href="{SERV_ROW_CATURL}">{SERV_ROW_CATTITLE}</a></p>
				
				<!-- IF {PHP.cot_plugins_active.tags} AND {PHP.cot_plugins_active.tagslance} AND {PHP.cfg.plugin.tagslance.services} -->
				<p class="small">{PHP.L.Tags}: 
					<!-- BEGIN: SERV_ROW_TAGS_ROW --><!-- IF {PHP.tag_i} > 0 -->, <!-- ENDIF --><a href="{SERV_ROW_TAGS_ROW_URL}" title="{SERV_ROW_TAGS_ROW_TAG}" rel="nofollow">{SERV_ROW_TAGS_ROW_TAG}</a><!-- END: SERV_ROW_TAGS_ROW -->
					<!-- BEGIN: SERV_ROW_NO_TAGS -->{SERV_ROW_NO_TAGS}<!-- END: SERV_ROW_NO_TAGS -->
				</p>
				<!-- ENDIF -->
				
			</div>
			<!-- END: SERV_ROWS -->
		</div>	
			
		<!-- IF {PAGENAV_COUNT} > 0 -->	
		<div class="pagination"><ul>{PAGENAV_PAGES}</ul></div>
		<!-- ELSE -->
		<div class="alert">{PHP.L.services_notfound}</div>
		<!-- ENDIF -->
	</div>
</div>

<!-- END: MAIN -->