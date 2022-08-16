<!-- BEGIN: MAIN --> {FILE "{PHP.cfg.themes_dir}/admin/{PHP.cfg.admintheme}/warnings.tpl"}
<!-- BEGIN: CONFIG_URL -->
<ul>
  <li>
    <a title="{PHP.L.Configuration}" href="{ADMIN_EXTENSIONS_CONFIG_URL}">{PHP.L.Configuration}: {PHP.R.admin_icon_config}</a>
  </li>
</ul>
<!-- END: CONFIG_URL -->
<!-- BEGIN: DETAILS -->

<!-- IF !{PHP.isinstalled} -->
<div class="uk-margin uk-margin-top uk-alert-danger uk-padding uk-panel uk-border-rounded" uk-alert>
  <a class="uk-alert-close" uk-close></a>
  <p class="uk-h4 uk-text-middle">
    <span class="uk-margin-small-right uk-text-danger" uk-icon="icon: warning; ratio: 1.5"></span> {PHP.L.Warning} !!!
  </p>
  <div>
    <p class="">{PHP.L.Ctrl_Install_New_Extention_backup_DB}</p>
  </div>
</div>
<!-- ENDIF -->
<div class="uk-margin uk-margin-top uk-card uk-card-default uk-padding-small uk-width-expand uk-border-rounded uk-box-shadow" uk-height-viewport="expand: true">
  <div>
    <span class="uk-margin-small-right">
      <!-- IF {ADMIN_EXTENSIONS_ICO} -->
      <img src="{ADMIN_EXTENSIONS_ICO}" width="27" height="27">
      <!-- ELSE -->
      <img src="{PHP.cfg.system_dir}/admin/img/plugins32.png" width="27" height="27">
      <!-- ENDIF -->
    </span>
    <span class="uk-text-bold uk-text-middle uk-text-capitalize uk-link-text uk-h3">{ADMIN_EXTENSIONS_TYPE}: {ADMIN_EXTENSIONS_NAME}</span>
  </div>
  <blockquote>
    <p class="uk-margin-small-bottom">{ADMIN_EXTENSIONS_DESCRIPTION}</p>
  </blockquote>
  <div class="uk-grid-match uk-grid-small" uk-grid>
    <div class="uk-width-2-3@l">
      <div class="uk-overflow-auto">
        <table class="uk-table uk-table-striped uk-table-hover uk-table-middle uk-table-divider">
          <tr>
            <th>
              <span class="uk-text-bold uk-text-capitalize uk-link-text uk-h5">{PHP.L.Code}:</span>
            </th>
            <td>
              <code>{ADMIN_EXTENSIONS_CODE}</code>
            </td>
          </tr>
          <tr>
            <th>
              <span class="uk-text-bold uk-text-capitalize uk-link-text uk-h5">{PHP.L.Version}:</span>
            </th>
            <td>
              <!-- IF {PHP.isinstalled} AND {ADMIN_EXTENSIONS_VERSION_COMPARE} > 0 -->
              <span uk-tooltip="{PHP.L.Version}" class="uk-label uk-label-warning">{ADMIN_EXTENSIONS_VERSION_INSTALLED}</span>
              <span uk-tooltip="{PHP.L.Version}" class="uk-label uk-label-success">{ADMIN_EXTENSIONS_VERSION}</span>
              <!-- ELSE -->
              <span uk-tooltip="{PHP.L.Version}" class="uk-label">{ADMIN_EXTENSIONS_VERSION}</span>
              <!-- ENDIF -->
            </td>
          </tr>
          <tr>
            <th>
              <span class="uk-text-bold uk-text-capitalize uk-link-text uk-h5">{PHP.L.Date}:</span>
            </th>
            <td>{ADMIN_EXTENSIONS_DATE}</td>
          </tr>
          <tr>
            <th>
              <span class="uk-text-bold uk-text-capitalize uk-link-text uk-h5">{PHP.L.Author}:</span>
            </th>
            <td>{ADMIN_EXTENSIONS_AUTHOR}</td>
          </tr>
          <tr>
            <th>
              <span class="uk-text-bold uk-text-capitalize uk-link-text uk-h5">{PHP.L.Copyright}:</span>
            </th>
            <td>{ADMIN_EXTENSIONS_COPYRIGHT}</td>
          </tr>
          <tr>
            <th>
              <span class="uk-text-bold uk-text-capitalize uk-link-text uk-h5">{PHP.L.Notes}:</span>
            </th>
            <td>{ADMIN_EXTENSIONS_NOTES}</td>
          </tr>
          <!-- BEGIN: DEPENDENCIES -->
          <tr>
            <th>
              <span class="uk-text-bold uk-text-capitalize uk-link-text uk-h5">{ADMIN_EXTENSIONS_DEPENDENCIES_TITLE}:</span>
            </th>
            <td>
              <!-- BEGIN: DEPENDENCIES_ROW -->
              <a href="{ADMIN_EXTENSIONS_DEPENDENCIES_ROW_URL}">
                <span class="
<!-- IF {ADMIN_EXTENSIONS_DEPENDENCIES_ROW_CLASS} -->
	<!-- IF {ADMIN_EXTENSIONS_DEPENDENCIES_ROW_CLASS} == 'highlight_red' -->uk-label uk-label-danger<!-- ELSE -->uk-label uk-label-success<!-- ENDIF -->
	<!-- ELSE -->uk-label
<!--ENDIF -->">{ADMIN_EXTENSIONS_DEPENDENCIES_ROW_NAME} </span>
              </a>
              <!-- END: DEPENDENCIES_ROW -->
            </td>
          </tr>
          <!-- END: DEPENDENCIES -->
        </table>
      </div>
    </div>
    <div class="uk-width-1-3@l">
      <ul class="uk-nav uk-nav-divider">
        <!-- IF {PHP.isinstalled} AND {PHP.exists} -->
        <!-- IF {ADMIN_EXTENSIONS_JUMPTO_URL} -->
        <li>
		<a uk-tooltip="{PHP.L.Open}" class="uk-link-text" href="{ADMIN_EXTENSIONS_JUMPTO_URL}">
			<span class="uk-text-middle">
				<i class="ti ti-screen-share uk-h2 uk-text-warning"></i>
			</span>
		  <span class="uk-text-middle uk-text-medium uk-margin-small-left">{PHP.L.Open}</span>
		</a>
        </li>
        <!-- ENDIF -->
        <!-- IF {ADMIN_EXTENSIONS_JUMPTO_URL_TOOLS} -->
        <li>
		<a uk-tooltip="{PHP.L.Administration}" class="uk-link-text" href="{ADMIN_EXTENSIONS_JUMPTO_URL_TOOLS}">
			<span class="uk-text-middle">
				<i class="ti ti-steering-wheel uk-h2 uk-text-warning"></i>
			</span>
		  <span class="uk-text-middle uk-text-medium uk-margin-small-left">{PHP.L.Administration}</span>
		</a>
        </li>
        <!-- ENDIF -->
        <!-- IF {ADMIN_EXTENSIONS_TOTALCONFIG} > 0 -->
        <li>
		<a uk-tooltip="{PHP.L.Configuration}" class="uk-link-text" href="{ADMIN_EXTENSIONS_CONFIG_URL}">
			<span class="uk-text-middle">
				<i class="ti ti-adjustments-alt uk-h2 uk-text-warning"></i>
			</span>
		  <span class="uk-text-middle uk-text-medium uk-margin-small-left">{PHP.L.Configuration} ({ADMIN_EXTENSIONS_TOTALCONFIG})</span>
		</a>
        </li>
        <!-- ENDIF -->
		<li>
		<a uk-tooltip="{PHP.L.short_rights}" class="uk-link-text" href="{ADMIN_EXTENSIONS_RIGHTS}">
			<span class="uk-text-middle">
				<i class="ti ti-scale uk-h2 uk-text-warning"></i>
			</span>
		  <span class="uk-text-middle uk-text-medium uk-margin-small-left">{PHP.L.short_rights}</span>
		</a>
        </li>
        <!-- IF {ADMIN_EXTENSIONS_JUMPTO_URL_STRUCT} -->
		<li>
		<a uk-tooltip="{PHP.L.Structure}" class="uk-link-text" href="{ADMIN_EXTENSIONS_JUMPTO_URL_STRUCT}">
			<span class="uk-text-middle">
				<i class="ti ti-list-numbers uk-h2 uk-text-warning"></i>
			</span>
		  <span class="uk-text-middle uk-text-medium uk-margin-small-left">{PHP.L.Structure}</span>
		</a>
        </li>
        <!-- ENDIF -->
        <!-- ENDIF -->
        <!-- IF !{PHP.isinstalled} -->
        <li>
		<a uk-tooltip="{PHP.L.adm_opt_install_explain}" class="uk-link-text" href="{ADMIN_EXTENSIONS_INSTALL_URL}">
			<span class="uk-text-middle">
				<i class="ti ti-asset uk-h2 uk-text-warning"></i>
			</span>
		  <span class="uk-text-middle uk-text-medium uk-margin-small-left">{PHP.L.adm_opt_install}</span>
		</a>
        </li>
        <!-- ELSE -->
        <!-- IF {PHP.exists} -->
        <li>
		<a uk-tooltip="{PHP.L.adm_opt_install_explain}" class="uk-link-text" href="{ADMIN_EXTENSIONS_UPDATE_URL}">
			<span class="uk-text-middle">
				<i class="ti ti-refresh-dot uk-h2 uk-text-warning"></i>
			</span>
		  <span class="uk-text-middle uk-text-medium uk-margin-small-left">{PHP.L.adm_opt_update}</span>
		</a>
        </li>
        <!-- ENDIF -->
        <li>
		<a uk-tooltip="{PHP.L.adm_opt_pauseall_explain}" class="uk-link-text" href="{ADMIN_EXTENSIONS_PAUSE_URL}">
			<span class="uk-text-middle">
				<i class="ti ti-player-pause uk-h2 uk-text-warning"></i>
			</span>
		  <span class="uk-text-middle uk-text-medium uk-margin-small-left">{PHP.L.adm_opt_pauseall}</span>
		</a>
        </li>
        <!-- IF {PHP.exists} -->
        <li>
		<a uk-tooltip="{PHP.L.adm_opt_unpauseall_explain}" class="uk-link-text" href="{ADMIN_EXTENSIONS_UNPAUSE_URL}">
			<span class="uk-text-middle">
				<i class="ti ti-player-play uk-h2 uk-text-warning"></i>
			</span>
		  <span class="uk-text-middle uk-text-medium uk-margin-small-left">{PHP.L.adm_opt_unpauseall}</span>
		</a>
        </li>
        <!-- ENDIF -->
        <li>
		<a uk-tooltip="{PHP.L.adm_opt_uninstall_explain}" class="uk-link-text" href="{ADMIN_EXTENSIONS_UNINSTALL_URL}">
			<span class="uk-text-middle">
				<i class="ti ti-trash uk-h2 uk-text-danger"></i>
			</span>
		  <span class="uk-text-middle uk-text-medium uk-margin-small-left">{PHP.L.adm_opt_uninstall}</span>
		</a>
        </li>
        <!-- ENDIF -->
      </ul>
    </div>
  </div>
</div>
<div class="uk-margin uk-margin-top uk-card uk-card-default uk-padding-small uk-width-expand uk-border-rounded uk-box-shadow">
  <h3>{PHP.L.Tags}:</h3>
  <div class="uk-overflow-auto">
    <table class="uk-table uk-table-striped uk-table-hover uk-table-small uk-table-middle uk-table-divider">
      <thead class="uk-background-secondary uk-text-warning">
        <tr>
          <th>#</th>
          <th>{PHP.L.Part}</th>
          <th>{PHP.L.Files} / {PHP.L.Tags}</th>
        </tr>
      </thead>
      <tbody>
        <!-- BEGIN: ROW_ERROR_TAGS -->
        <tr>
          <td>{ADMIN_EXTENSIONS_DETAILS_ROW_I_1}</td>
          <td>{ADMIN_EXTENSIONS_DETAILS_ROW_PART}</td>
          <td>{PHP.L.None}</td>
        </tr>
        <!-- END: ROW_ERROR_TAGS -->
        <!-- BEGIN: ROW_TAGS -->
        <tr>
          <td>{ADMIN_EXTENSIONS_DETAILS_ROW_I_1}</td>
          <td>{ADMIN_EXTENSIONS_DETAILS_ROW_PART}</td>
          <td>{ADMIN_EXTENSIONS_DETAILS_ROW_LISTTAGS}</td>
        </tr>
        <!-- END: ROW_TAGS -->
      </tbody>
    </table>
  </div>
</div>
<div class="uk-margin uk-margin-top uk-card uk-card-default uk-padding-small uk-width-expand uk-border-rounded uk-box-shadow">
  <h3>{PHP.L.Parts}:</h3>
  <div class="uk-overflow-auto">
    <table class="uk-table uk-table-striped uk-table-hover uk-table-small uk-table-middle uk-table-divider">
      <thead class="uk-background-secondary uk-text-warning">
        <tr>
          <th>#</th>
          <th>{PHP.L.Part}</th>
          <th>{PHP.L.File}</th>
          <th>{PHP.L.Hooks}</th>
          <th>{PHP.L.Order}</th>
          <th>{PHP.L.Status}</th>
          <th>{PHP.L.Action}</th>
        </tr>
      </thead>
      <tbody>
        <!-- BEGIN: ROW_ERROR_PART -->
        <tr>
          <td colspan="3">{ADMIN_EXTENSIONS_DETAILS_ROW_X}</td>
          <td colspan="4">{ADMIN_EXTENSIONS_DETAILS_ROW_ERROR}</td>
        </tr>
        <!-- END: ROW_ERROR_PART -->
        <!-- BEGIN: ROW_PART -->
        <tr>
          <td>{ADMIN_EXTENSIONS_DETAILS_ROW_I_1}</td>
          <td>{ADMIN_EXTENSIONS_DETAILS_ROW_PART}</td>
          <td>{ADMIN_EXTENSIONS_DETAILS_ROW_FILE}</td>
          <td>{ADMIN_EXTENSIONS_DETAILS_ROW_HOOKS}</td>
          <td>{ADMIN_EXTENSIONS_DETAILS_ROW_ORDER}</td>
          <td>{ADMIN_EXTENSIONS_DETAILS_ROW_STATUS}</td>
          <td>
            <!-- BEGIN: ROW_PART_NOTINSTALLED --> &ndash;
            <!-- END: ROW_PART_NOTINSTALLED -->
            <!-- BEGIN: ROW_PART_PAUSE -->
            <a uk-tooltip="{PHP.L.adm_opt_pause}" class="uk-icon-button uk-button-warning" href="{ADMIN_EXTENSIONS_DETAILS_ROW_PAUSEPART_URL}" uk-icon="ratio: 1.2" title="{PHP.L.adm_opt_pause}">
              <i class="ti ti-player-pause"></i>
            </a>
            <!-- END: ROW_PART_PAUSE -->
            <!-- BEGIN: ROW_PART_UNPAUSE -->
            <a uk-tooltip="{PHP.L.adm_opt_unpause}" class="uk-icon-button uk-button-success" href="{ADMIN_EXTENSIONS_DETAILS_ROW_UNPAUSEPART_URL}" uk-icon="ratio: 1.2" title="{PHP.L.adm_opt_unpause}">
              <i class="ti ti-player-play"></i>
            </a>
            <!-- END: ROW_PART_UNPAUSE -->
          </td>
        </tr>
        <!-- END: ROW_PART -->
      </tbody>
    </table>
  </div>
</div>
<!-- END: DETAILS -->
<!-- BEGIN: HOOKS -->

<div class="uk-margin uk-margin-top uk-card uk-card-default uk-padding-small uk-width-expand uk-border-rounded uk-box-shadow">
  <h3>{PHP.L.Hooks} ({ADMIN_EXTENSIONS_CNT_HOOK}):</h3>
  <div class="uk-overflow-auto">
    <table class="uk-table uk-table-striped uk-table-hover uk-table-small uk-table-middle uk-table-divider">
      <thead class="uk-background-secondary uk-text-warning">
        <tr>
          <th class="uk-text-nowrap">{PHP.L.Hooks}</th>
          <th class="uk-table-expand uk-text-nowrap">{PHP.L.Plugin}</th>
          <th class="uk-table-expand uk-text-nowrap">{PHP.L.Order}</th>
          <th class="uk-table-expand uk-text-nowrap">{PHP.L.Active}</th>
        </tr>
      </thead>
      <tbody>
        <!-- BEGIN: HOOKS_ROW -->
        <tr>
          <td>{ADMIN_EXTENSIONS_HOOK}</td>
          <td>{ADMIN_EXTENSIONS_CODE}</td>
          <td>{ADMIN_EXTENSIONS_ORDER}</td>
          <td>{ADMIN_EXTENSIONS_ACTIVE}</td>
        </tr>
        <!-- END: HOOKS_ROW -->
      </tbody>
    </table>
  </div>
</div>
<!-- END: HOOKS -->
<!-- BEGIN: DEFAULT -->
<div class="uk-margin uk-margin-top uk-card uk-card-default uk-padding-small uk-width-expand uk-border-rounded uk-box-shadow">
  <div class="uk-grid-small uk-flex-center uk-text-center" uk-grid>
    <div>
      <a class="uk-button uk-button-small 
				
						
						<!-- IF {ADMIN_EXTENSIONS_SORT_ALP_SEL} --> uk-button-warning 
				
						
						<!-- ELSE -->uk-button-primary
				
						
						<!-- ENDIF -->" href="{ADMIN_EXTENSIONS_SORT_ALP_URL}">{PHP.L.adm_sort_alphabet} </a>
    </div>
    <div>
      <a class="uk-button uk-button-small 
				
						
						<!-- IF {ADMIN_EXTENSIONS_SORT_CAT_SEL} --> uk-button-warning 
				
						
						<!-- ELSE -->uk-button-primary
				
						
						<!-- ENDIF -->" href="{ADMIN_EXTENSIONS_SORT_CAT_URL}">{PHP.L.adm_sort_category} </a>
    </div>
    <div>
      <a class="uk-button uk-button-small 
				
						
						<!-- IF {ADMIN_EXTENSIONS_ONLY_INSTALLED_SEL} --> uk-button-warning 
				
						
						<!-- ELSE -->uk-button-primary
				
						
						<!-- ENDIF -->" href="{PHP.sort_urlp|cot_url('admin', 'm=extensions&inst=1$this')}">{PHP.L.adm_only_installed} </a>
    </div>
    <div>
      <a class="uk-button uk-button-small uk-button-primary" href="{ADMIN_EXTENSIONS_HOOKS_URL}">{PHP.L.Hooks}</a>
    </div>
  </div>
</div>
<!-- BEGIN: SECTION-->
<h3>{ADMIN_EXTENSIONS_SECTION_TITLE} ({ADMIN_EXTENSIONS_CNT_EXTP}):</h3>

      <!-- BEGIN: ROW -->
      <!-- BEGIN: ROW_ERROR_EXT-->
      <!-- IF {ADMIN_EXTENSIONS_ERROR_MSG} -->
      <ul class="uk-list uk-list-striped">
        <li class="uk-text-danger"> {ADMIN_EXTENSIONS_X_ERR} </li>
        <li class="uk-text-warning"> {ADMIN_EXTENSIONS_ERROR_MSG} </li>
      </ul>
      <!-- ENDIF -->
      <!-- END: ROW_ERROR_EXT -->
      <!-- BEGIN: ROW_CAT -->
      <ul class="uk-list uk-list-striped">
        <li class="">
          <span class="">
            <i class="ti ti-chevrons-down uk-h3 uk-text-danger"></i>
          </span>
          <span class="uk-h3 uk-text-bold uk-link-text">{ADMIN_EXTENSIONS_CAT_TITLE}</span>
        </li>
      </ul>
      <!-- END: ROW_CAT -->
      <div class="uk-margin uk-card uk-card-default uk-padding-small uk-width-expand uk-border-rounded uk-box-shadow">
        <div class="" uk-grid>
          <div class="uk-width-1-2@m uk-flex uk-flex-middle">
            <ul class="uk-list uk-list-divider uk-width-1-1">
              <li>
                <a uk-tooltip="{PHP.L.Ctrl_Name_Extention}" class="uk-link-text" href="{ADMIN_EXTENSIONS_DETAILS_URL}">
                  <!-- IF {ADMIN_EXTENSIONS_ICO} -->
                  <img src="{ADMIN_EXTENSIONS_ICO}" uk-tooltip="" title="" class="uk-margin-small-right" width="27" height="27">
                  <!-- ELSE -->
                  <img class="uk-margin-small-right" src="{PHP.cfg.mainurl}/{PHP.cfg.themes_dir}/admin/controlcot/img/cotonti-controlcot-by-webitproff.png" width="27" height="27">
                  <!-- ENDIF -->
                  <span class="uk-text-middle uk-text-medium">{ADMIN_EXTENSIONS_NAME}</span>
                </a>
              </li>
              <li>
                <span uk-tooltip="{PHP.L.Ctrl_Descr_Extention}">{ADMIN_EXTENSIONS_DESCRIPTION}</span>
              </li>
              <li>
                <div class="uk-grid-small uk-child-width-1-2 uk-flex" uk-grid>
                  <div>
                    <div class="uk-tile uk-padding-remove uk-flex uk-flex-left">{ADMIN_EXTENSIONS_STATUS}</div>
                  </div>
                  <div>
                    <div class="uk-tile uk-padding-remove uk-flex uk-flex-right">
                      <!-- IF {PHP.part_status} != 3 AND {ADMIN_EXTENSIONS_VERSION_COMPARE} > 0 -->
                      <span uk-tooltip="{PHP.L.Version}" class="uk-label uk-label-warning">{ADMIN_EXTENSIONS_VERSION_INSTALLED}</span>
                      <span uk-tooltip="{PHP.L.Version}" class="uk-label uk-label-success">{ADMIN_EXTENSIONS_VERSION}</span>
                      <!-- ELSE -->
                      <span uk-tooltip="{PHP.L.Version}" class="uk-label">{ADMIN_EXTENSIONS_VERSION}</span>
                      <!-- ENDIF -->
                    </div>
                  </div>
                </div>
              </li>
            </ul>
          </div>
          <div class="uk-visible@m uk-width-1-4@m">
            <div class="uk-child-width-1-2" uk-grid>
              <div>
                <code>{ADMIN_EXTENSIONS_CODE_X}</code>
              </div>
              <div> {ADMIN_EXTENSIONS_PARTSCOUNT} </div>
            </div>
          </div>
          <div class="uk-width-1-4@m">
            <!-- IF {PHP.part_status} != 3 -->
            <div class="uk-grid-small uk-flex-center uk-text-center" uk-grid>
              <!-- IF {PHP.if_plg_standalone} -->
              <div>
                <a uk-tooltip="{PHP.L.short_open}" class="uk-icon-button uk-button-primary" href="{ADMIN_EXTENSIONS_JUMPTO_URL}" uk-icon="icon: link; ratio: 1.2" title=""></a>
              </div>
              <!-- ENDIF -->
              <!-- IF {ADMIN_EXTENSIONS_TOTALCONFIG} -->
              <div>
                <a uk-tooltip="{PHP.L.Options} {PHP.L.Configuration}" class="uk-icon-button uk-button-warning" href="{ADMIN_EXTENSIONS_EDIT_URL}" uk-icon="icon: settings; ratio: 1.2" title="{PHP.L.short_config}"></a>
              </div>
              <!-- ENDIF -->
              <!-- IF {PHP.ifstruct} -->
              <div>
                <a uk-tooltip="{PHP.L.Structure}" class="uk-icon-button uk-box-shadow-medium uk-text-danger" href="{ADMIN_EXTENSIONS_JUMPTO_URL_STRUCT}" uk-icon="icon: list; ratio: 1.2" title="{PHP.L.Structure}"></a>
              </div>
              <!-- ENDIF -->
              <!-- IF {PHP.totalinstalled} -->
              <div>
                <a uk-tooltip="{PHP.L.Rights}" class="uk-icon-button uk-button-success" href="{ADMIN_EXTENSIONS_RIGHTS_URL}" uk-icon="icon: users; ratio: 1.2" title="{PHP.L.short_rights}"></a>
              </div>
              <!-- ENDIF -->
              <!-- IF {PHP.ifthistools} -->
              <div>
                <a uk-tooltip="{PHP.L.Administration}" class="uk-icon-button uk-button-danger" href="{ADMIN_EXTENSIONS_JUMPTO_URL_TOOLS}" uk-icon="icon: cog; ratio: 1.2" title=""></a>
              </div>
              <!-- ENDIF -->
            </div>
            <!-- ENDIF -->
          </div>
        </div>
      </div>

<!-- END: ROW -->
<!-- BEGIN: ROW_ERROR -->
<ul class="uk-list uk-list-striped">
  <li class="uk-text-danger"> {ADMIN_EXTENSIONS_X} </li>
  <li class="uk-text-danger"> {PHP.L.adm_opt_setup_missing} </li>
</ul>
<!-- END: ROW_ERROR -->

<!-- END: SECTION -->
<!-- END: DEFAULT -->
<!-- BEGIN: EDIT -->
<div class="uk-margin uk-card uk-card-default uk-padding-small uk-width-expand uk-border-rounded uk-box-shadow">
  <h2>{ADMIN_EXTENSIONS_EDIT_TITLE}</h2>
  <ul class="uk-list uk-list-striped">
    <li>
      <a href="{ADMIN_EXTENSIONS_EDIT_RESULT}" class="uk-button uk-button-small uk-button-primary">{ADMIN_EXTENSIONS_EDIT_LOG}</a>
    </li>
    <li>
      <a href="{ADMIN_EXTENSIONS_EDIT_CONTINUE_URL}" class="ajax uk-button uk-button-small uk-button-danger">{PHP.L.Clickhere}</a>
    </li>
  </ul>
</div>
<!-- END: EDIT -->
<div class="uk-margin-vertical uk-alert-primary uk-alert" uk-alert="">
  <a class="uk-alert-close uk-icon uk-close" uk-close=""></a>
  <p>Шаблон:</p>
  <code>admin.extensions.tpl</code>
</div>
<!-- END: MAIN -->