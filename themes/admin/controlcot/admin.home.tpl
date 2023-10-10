<!-- BEGIN: MAIN -->     
<div class="uk-card uk-card-small uk-card-default uk-card-body uk-border-rounded uk-margin-top">
  <div class="uk-flex-middle" uk-grid>
    <div class="uk-width-4-5@m">
      <h3>
        <a class="uk-link-heading" href="{PHP.cfg.mainurl}" target="_blank" title="{PHP.L.hea_viewsite}">{PHP.cfg.maintitle}</a>
      </h3>
      <div class="uk-nav-subtitle">{PHP.cfg.subtitle}</div>
    </div>
    <div class="uk-width-auto@m uk-flex-first">
      <img src="{PHP.cfg.mainurl}/apple-touch-icon.png" width="120" height="120">
    </div>
  </div>
  <ul class="uk-list uk-list-divider">
    <li> {PHP.L.System} & {PHP.L.Version} <span class="uk-label">v. {PHP.cfg.version}</span>
    </li>
    <li> {PHP.L.core_time} {PHP|$this,cot_date("datetime_fulltext")} </li>
  </ul>
</div>      
<!-- BEGIN: UPDATE -->
	<div class="uk-background-secondary uk-light uk-padding uk-panel">
		<h3>{PHP.L.home_update_notice}:</h3>
		<p>{ADMIN_HOME_UPDATE_REVISION} {ADMIN_HOME_UPDATE_MESSAGE}</p>
	</div>
<!-- END: UPDATE -->
<div class="uk-margin">
	{FILE "{PHP.cfg.themes_dir}/admin/{PHP.cfg.admintheme}/warnings.tpl"}
</div>
<!-- BEGIN: MAINPANEL -->
<div class="uk-margin">
	{ADMIN_HOME_MAINPANEL}
</div>
<!-- END: MAINPANEL -->
<div class="uk-grid-match uk-grid-small uk-child-width-1-2@m uk-child-width-1-3@l" uk-grid>
<!-- BEGIN: SIDEPANEL -->
    <div>
        <div class="uk-card uk-card-small uk-card-default uk-card-body uk-border-rounded">
			{ADMIN_HOME_SIDEPANEL}
		</div>
    </div>
<!-- END: SIDEPANEL -->
</div>

	
<hr/>
<!-- IF {PHP.cot_plugins_active.pagelist} -->
<div class="uk-grid-small uk-child-width-1-2@m" uk-grid>
    <div>
        <div class="uk-card uk-background-default uk-border-rounded uk-box-shadow">
		{PHP|cot_pagelist('pagelist.admin', 7, 'page_count DESC', 'page_count > 0')} 
		</div>
    </div>
    <div>
        <div class="uk-card uk-background-default uk-border-rounded uk-box-shadow">
		{PHP|cot_pagelist('pagelist.admin', '7', 'page_date DESC')}
		</div>
    </div>
</div>
<!-- ENDIF -->

	<!-- IF {PHP.cot_plugins_active.adminstats} -->
	<div class="uk-grid-match uk-grid-small uk-child-width-1-2@m uk-child-width-1-3@l" uk-grid>
		<div>
			<div class="uk-margin uk-card uk-card-default uk-padding-small uk-width-expand uk-border-rounded uk-box-shadow">
				<h5><i class="mdi mdi-database"></i> {PHP.L.Database}:</h5>
				<div class="uk-overflow-auto">
					<table class="uk-table uk-table-striped uk-table-hover uk-table-middle uk-table-divider">
						<tr>
							<td>{PHP.adminstats.database.title}</td>
							<td class="text-right">{PHP.adminstats.database.value}</td>
						</tr>
						<tr>
							<td>{PHP.adminstats.mysqlcharset.title}</td>
							<td class="text-right">{PHP.adminstats.mysqlcharset.value}</td>
						</tr>
						<tr>
							<td>{PHP.adminstats.db_counts.title}</td>
							<td class="text-right">{PHP.adminstats.db_counts.value}</td>
						</tr>
						<tr>
							<td>{PHP.adminstats.db_rows.title}</td>
							<td class="text-right">{PHP.adminstats.db_rows.value}</td>
						</tr>
						<tr>
							<td>{PHP.adminstats.db_indexsize.title}</td>
							<td class="text-right">{PHP.adminstats.db_indexsize.value}</td>
						</tr>
						<tr>
							<td>{PHP.adminstats.db_datassize.title}</td>
							<td class="text-right">{PHP.adminstats.db_datassize.value}</td>
						</tr>
						<tr>
							<td>{PHP.adminstats.db_totalsize.title}</td>
							<td class="text-right">{PHP.adminstats.db_totalsize.value}</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div>
			<div class="uk-margin uk-card uk-card-default uk-padding-small uk-width-expand uk-border-rounded uk-box-shadow">
				<h5><i class="mdi mdi-power-plug"></i> {PHP.L.Extensions}:</h5>
				<div class="uk-overflow-auto">
					<table class="uk-table uk-table-striped uk-table-hover uk-table-middle uk-table-divider">
						<tr>
							<td>{PHP.adminstats.active_modules.title}</td>
							<td class="text-right">{PHP.adminstats.active_modules.value} {PHP.L.Of} {PHP.adminstats.modules.value}</td>
						</tr>
						<tr>
							<td>{PHP.adminstats.active_plugins.title}</td>
							<td class="text-right">{PHP.adminstats.active_plugins.value} {PHP.L.Of} {PHP.adminstats.plugins.value}</td>
						</tr>
						<tr>
							<td>{PHP.adminstats.active_hooks.title}</td>
							<td class="text-right">{PHP.adminstats.active_hooks.value} {PHP.L.Of} {PHP.adminstats.hooks.value}</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div>
			<div class="uk-margin uk-card uk-card-default uk-padding-small uk-width-expand uk-border-rounded uk-box-shadow">
				<h5><i class="mdi mdi-cached"></i> {PHP.L.Ctrl_Cache}:</h5>
				<div class="uk-overflow-auto">
					<table class="uk-table uk-table-striped uk-table-hover uk-table-middle uk-table-divider">
						<tr>
							<td>{PHP.adminstats.cache.title}</td>
							<td class="text-right lower">{PHP.adminstats.cache.value}</td>
						</tr>
						<!-- IF {PHP.adminstats.cache.value} != {PHP.L.Disabled} -->
						<tr>
							<td>{PHP.adminstats.cache_drv.title}</td>
							<td class="text-right">{PHP.adminstats.cache_drv.value}</td>
						</tr>
						<!-- ENDIF -->
						<tr>
							<td>{PHP.adminstats.xtpl_cache.title}</td>
							<td class="text-right lower">{PHP.adminstats.xtpl_cache.value}</td>
						</tr>
						<tr>
							<td>{PHP.adminstats.html_cleanup.title}</td>
							<td class="text-right lower">{PHP.adminstats.html_cleanup.value}</td>
						</tr>
						<tr>
							<td>{PHP.adminstats.cache_index.title}</td>
							<td class="text-right lower">{PHP.adminstats.cache_index.value}</td>
						</tr>
						<tr>
							<td>{PHP.adminstats.cache_page.title}</td>
							<td class="text-right lower">{PHP.adminstats.cache_page.value}</td>
						</tr>
						<tr>
							<td>{PHP.adminstats.cache_forums.title}</td>
							<td class="text-right lower">{PHP.adminstats.cache_forums.value}</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div>
			<div class="uk-margin uk-card uk-card-default uk-padding-small uk-width-expand uk-border-rounded uk-box-shadow">
				<h5><i class="mdi mdi-security"></i> {PHP.L.Security}:</h5>
				<div class="uk-overflow-auto">
					<table class="uk-table uk-table-striped uk-table-hover uk-table-middle uk-table-divider">
						<tr>
							<td>{PHP.adminstats.debug_mode.title}</td>
							<td class="text-right lower">{PHP.adminstats.debug_mode.value}</td>
						</tr>
						<tr>
							<td>{PHP.adminstats.display_errors.title}</td>
							<td class="text-right lower">{PHP.adminstats.display_errors.value}</td>
						</tr>
						<tr>
							<td>
								{PHP.adminstats.ipcheck.title}</td>
							<td class="text-right lower">{PHP.adminstats.ipcheck.value}</td>
						</tr>
						<tr>
							<td>{PHP.adminstats.authcache.title}</td>
							<td class="text-right lower">{PHP.adminstats.authcache.value}</td>
						</tr>
						<tr>
							<td>{PHP.adminstats.useremailduplicate.title}</td>
							<td class="text-right lower">{PHP.adminstats.useremailduplicate.value}</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- ELSE -->
		<div class="uk-margin uk-card uk-card-default uk-padding-small uk-width-expand uk-border-rounded uk-box-shadow">
			<h3>Cotonti</h3>
			<div class="uk-overflow-auto">
			<table class="uk-table uk-table-striped uk-table-hover uk-table-middle uk-table-divider">
				<tr>
					<td class="width80">{PHP.L.Version}</td>
					<td class="textcenter width20">{ADMIN_HOME_VERSION}</td>
				</tr>
				<tr>
					<td>{PHP.L.Database}</td>
					<td class="textcenter">{ADMIN_HOME_DB_VERSION}</td>
				</tr>
				<tr>
					<td>{PHP.L.home_db_rows}</td>
					<td class="textcenter">{ADMIN_HOME_DB_TOTAL_ROWS}</td>
				</tr>
				<tr>
					<td>{PHP.L.home_db_indexsize}</td>
					<td class="textcenter">{ADMIN_HOME_DB_INDEXSIZE}</td>
				</tr>
				<tr>
					<td>{PHP.L.home_db_datassize}</td>
					<td class="textcenter">{ADMIN_HOME_DB_DATASSIZE}</td>
				</tr>
				<tr>
					<td>{PHP.L.home_db_totalsize}</td>
					<td class="textcenter">{ADMIN_HOME_DB_TOTALSIZE}</td>
				</tr>
				<tr>
					<td>{PHP.L.Plugins}</td>
					<td class="textcenter">{ADMIN_HOME_TOTALPLUGINS}</td>
				</tr>
				<tr>
					<td>{PHP.L.Hooks}</td>
					<td class="textcenter">{ADMIN_HOME_TOTALHOOKS}</td>
				</tr>
			</table>
			</div>
		</div>
	<!-- ENDIF -->
<!-- END: MAIN -->