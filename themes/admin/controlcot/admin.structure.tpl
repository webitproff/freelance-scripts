<!-- BEGIN: LIST -->
<div class="uk-margin uk-margin-top uk-card uk-card-default uk-padding-small uk-width-expand uk-border-rounded uk-box-shadow" uk-height-viewport="expand: true">
  <h2>
    <span class="uk-h3 uk-text-bold uk-link-text">{PHP.L.Modules}</span>
  </h2>
  <div class="uk-flex uk-flex-middle">
    <ul class="uk-list uk-list-divider uk-width-expand">
      <!-- BEGIN: ADMIN_STRUCTURE_EXT -->
      <li>
        <a class="uk-link-text" href="{ADMIN_STRUCTURE_EXT_URL}">
          <!-- IF {ADMIN_STRUCTURE_EXT_ICO} -->
          <img src="{ADMIN_STRUCTURE_EXT_ICO}" class="uk-margin-small-right" width="27" height="27">
          <!-- ELSE -->
          <img src="{PHP.cfg.system_dir}/admin/img/plugins32.png" class="uk-margin-small-right" width="27" height="27">
          <!-- ENDIF -->
          <span class="uk-text-middle uk-text-medium">{ADMIN_STRUCTURE_EXT_NAME}</span>
        </a>
      </li>
      <!-- END: ADMIN_STRUCTURE_EXT -->
    </ul>
  </div>
  <!-- BEGIN: ADMIN_STRUCTURE_EMPTY -->
  <div class="uk-alert uk-alert-warning">{PHP.L.adm_listisempty}</div>
  <!-- END: ADMIN_STRUCTURE_EMPTY -->
</div>
<!-- END: LIST -->
<!-- BEGIN: MAIN -->
<div class="uk-margin uk-margin-top uk-card uk-card-default uk-padding-small uk-width-expand uk-border-rounded uk-box-shadow" uk-height-viewport="expand: true">
  <h2>
    <span class="uk-h3 uk-text-bold uk-link-text">{PHP.L.Structure}</span>
  </h2>
  <h2></h2> {FILE "{PHP.cfg.themes_dir}/admin/{PHP.cfg.admintheme}/warnings.tpl"} <div class="uk-grid-small uk-flex-center uk-text-center" uk-grid>
    <!-- IF {ADMIN_STRUCTURE_I18N_URL} -->
    <div>
      <a href="{ADMIN_STRUCTURE_I18N_URL}" class="uk-button uk-button-small uk-button-primary">{PHP.L.i18n_structure}</a>
    </div>
    <!-- ENDIF -->
    <div>
      <a class="uk-button uk-button-small uk-button-primary" href="{ADMIN_STRUCTURE_URL_EXTRAFIELDS}">{PHP.L.adm_extrafields}</a>
    </div>
    <div></div>
    <div>
      <a class="uk-button uk-button-small uk-button-primary" href="{ADMIN_PAGE_STRUCTURE_RESYNCALL}" title="{PHP.L.adm_tpl_resyncalltitle}">{PHP.L.Resync}</a>
    </div>
  </div>
  <!-- BEGIN: OPTIONS -->
  <div class="uk-margin uk-margin-top">
    <form class="uk-form-horizontal uk-margin" name="savestructure" id="savestructure" action="{ADMIN_STRUCTURE_UPDATE_FORM_URL}" method="post" enctype="multipart/form-data">
      <div class="uk-margin">
        <label class="uk-margin uk-text-medium uk-form-label">{PHP.L.Path}: <span class="uk-text-danger uk-margin-left">{PHP.L.adm_required}</span>
        </label>
        <div class="uk-form-controls"> {ADMIN_STRUCTURE_PATH} </div>
      </div>
      <div class="uk-margin">
        <label class="uk-margin uk-text-medium uk-form-label">{PHP.L.Code}: <span class="uk-text-danger uk-margin-left">{PHP.L.adm_required}</span>
        </label>
        <div class="uk-form-controls"> {ADMIN_STRUCTURE_CODE} </div>
      </div>
      <div class="uk-margin">
        <label class="uk-margin uk-text-medium uk-form-label">{PHP.L.Title}: <span class="uk-text-danger uk-margin-left">{PHP.L.adm_required}</span>
        </label>
        <div class="uk-form-controls"> {ADMIN_STRUCTURE_TITLE} </div>
      </div>
      <div class="uk-margin">
        <label class="uk-margin uk-text-medium uk-form-label">{PHP.L.Description}:</label>
        <div class="uk-form-controls"> {ADMIN_STRUCTURE_DESC} </div>
      </div>
      <div class="uk-margin">
        <label class="uk-margin uk-text-medium uk-form-label">{PHP.L.Icon}:</label>
        <div class="uk-form-controls"> {ADMIN_STRUCTURE_ICON} </div>
      </div>
      <div class="uk-margin">
        <label class="uk-margin uk-text-medium uk-form-label">{PHP.L.Locked}:</label>
        <div class="uk-form-controls"> {ADMIN_STRUCTURE_LOCKED} </div>
      </div>
      <div class="uk-margin">
        <label class="uk-margin uk-text-medium uk-form-label">{PHP.L.adm_tpl_mode}:</label>
        <hr>
        <div class="uk-form-controls"> {ADMIN_STRUCTURE_TPLMODE}
          <hr>{ADMIN_STRUCTURE_SELECT} {PHP.L.adm_tpl_quickcat}: {ADMIN_STRUCTURE_TPLQUICK}
        </div>
      </div>
      <!-- BEGIN: EXTRAFLD -->
      <div class="uk-margin">
        <label class="uk-margin uk-text-medium uk-form-label">{ADMIN_STRUCTURE_EXTRAFLD_TITLE}:</label>
        <div class="uk-form-controls {ADMIN_STRUCTURE_ODDEVEN}"> {ADMIN_STRUCTURE_EXTRAFLD} </div>
      </div>
      <!-- END: EXTRAFLD -->
      <!-- BEGIN: CONFIG -->
      <h2>
        <span class="uk-h3 uk-text-bold uk-link-text">{PHP.L.Configuration}</span>
      </h2>{CONFIG_HIDDEN} {ADMIN_CONFIG_EDIT_CUSTOM} <div class="uk-tile uk-background-muted uk-padding-small uk-width-1-1 uk-box-shadow-medium uk-margin-bottom uk-border-rounded">
        <!-- BEGIN: ADMIN_CONFIG_ROW -->
        <!-- BEGIN: ADMIN_CONFIG_FIELDSET_BEGIN -->
        <div class="uk-margin">
          <label class="uk-margin uk-text-medium uk-text-primary uk-form-label">{ADMIN_CONFIG_FIELDSET_TITLE}</label>
          <div class="uk-form-controls"></div>
        </div>
        <!-- END: ADMIN_CONFIG_FIELDSET_BEGIN -->
        <div class="uk-flex uk-flex-middle uk-grid-small" uk-grid>
          <!-- BEGIN: ADMIN_CONFIG_ROW_OPTION -->
          <div class="uk-width-expand@l">
            <div class="uk-margin">
              <dl>
                <dt class="uk-text-normal">
                  <span class="uk-text-medium uk-link-text">{ADMIN_CONFIG_ROW_CONFIG_TITLE}:</span>
                </dt>
                <dd class="adminconfigmore">{ADMIN_CONFIG_ROW_CONFIG_MORE}</dd>
              </dl>
            </div>
          </div>
          <div class="uk-width-2-3@l">
            <div class="uk-form-controls"> {ADMIN_CONFIG_ROW_CONFIG} </div>
          </div>
          <div class="uk-width-auto@l">
            <a href="{ADMIN_CONFIG_ROW_CONFIG_MORE_URL}" class="ajax uk-width-1-1 uk-button uk-button-danger uk-button-small"> {PHP.L.Reset}</a>
          </div>
          <!-- END: ADMIN_CONFIG_ROW_OPTION -->
        </div>
        <!-- END: ADMIN_CONFIG_ROW -->
      </div>
      <!-- END: CONFIG -->
      <div class="uk-margin">
        <div class="uk-form-controls valid">
          <input type="submit" class="submit uk-button uk-button-success" value="{PHP.L.Update}" />
        </div>
      </div>
    </form>
  </div>
  <!-- END: OPTIONS -->
  <!-- BEGIN: DEFAULT -->
  <div class="">
    <h3><span class="uk-h4 uk-text-bold uk-link-text">{PHP.L.editdeleteentries}:</span></h3>
    <form name="savestructure" id="savestructure" action="{ADMIN_STRUCTURE_UPDATE_FORM_URL}" method="post" class="uk-form-horizontal uk-margin ajax" enctype="multipart/form-data">
      <!-- BEGIN: ROW -->
      <div class="uk-tile uk-background-muted uk-padding-small uk-width-1-1 uk-box-shadow-medium uk-margin-bottom uk-border-rounded">
        <div class="uk-margin">
          <label class="uk-form-label">{PHP.L.Path}</label>
          <div class="uk-form-controls {ADMIN_STRUCTURE_ODDEVEN}"> {ADMIN_STRUCTURE_SPACEIMG}{ADMIN_STRUCTURE_PATH} </div>
        </div>
        <div class="uk-margin">
          <label class="uk-form-label">{PHP.L.Code}</label>
          <div class="uk-form-controls {ADMIN_STRUCTURE_ODDEVEN}"> {ADMIN_STRUCTURE_CODE} </div>
        </div>
        <div class="uk-margin">
          <label class="uk-form-label">{PHP.L.Title}</label>
          <div class="uk-form-controls {ADMIN_STRUCTURE_ODDEVEN}"> {ADMIN_STRUCTURE_TITLE} </div>
        </div>
        <div class="uk-margin">
          <label class="uk-form-label">{PHP.L.TPL}</label>
          <div class="uk-form-controls {ADMIN_STRUCTURE_ODDEVEN}"> {ADMIN_STRUCTURE_TPLQUICK} </div>
        </div>
        <div class="uk-margin">
          <label class="uk-form-label">{PHP.L.Pages}</label>
          <div class="uk-form-controls {ADMIN_STRUCTURE_ODDEVEN}"> {ADMIN_STRUCTURE_COUNT} </div>
        </div>
        <div class="uk-margin">
          <label class="uk-form-label">{PHP.L.Action}</label>
          <div class="uk-form-controls {ADMIN_STRUCTURE_ODDEVEN}">
            <div class="uk-grid-small" uk-grid>
              <div>
                <a uk-tooltip="{PHP.L.Options} {PHP.L.short_config}" class="ajax uk-icon-button uk-button-warning" href="{ADMIN_STRUCTURE_OPTIONS_URL}" uk-icon="icon: settings; ratio: 1.2" title="{PHP.L.short_config}"></a>
              </div>
              <!-- IF {ADMIN_STRUCTURE_RIGHTS_URL} -->
              <div>
                <a uk-tooltip="{PHP.L.short_rights}" class="uk-icon-button uk-button-success" href="{ADMIN_STRUCTURE_RIGHTS_URL}" uk-icon="icon: users; ratio: 1.2" title="{PHP.L.short_rights}"></a>
              </div>
              <!-- ENDIF -->
              <!-- IF {PHP.dozvil} -->
              <div>
                <a uk-tooltip="{PHP.L.Delete}" class="uk-icon-button uk-button-danger" href="{ADMIN_STRUCTURE_UPDATE_DEL_URL}" uk-icon="icon: trash; ratio: 1.2" title=""></a>
              </div>
              <!-- ENDIF -->
              <div>
                <a uk-tooltip="{PHP.L.short_open}" target="_blank" class="uk-icon-button uk-button-primary" href="{ADMIN_STRUCTURE_JUMPTO_URL}" uk-icon="icon: link; ratio: 1.2" title=""></a>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- END: ROW -->
      <div class="uk-margin">
        <div class="uk-form-controls valid">
          <input type="submit" class="submit uk-button uk-button-success" value="{PHP.L.Update}" />
        </div>
      </div>
    </form>
    <div class="pagination">
      <ul class="uk-pagination" uk-margin>{ADMIN_STRUCTURE_PAGINATION_PREV}{ADMIN_STRUCTURE_PAGNAV}{ADMIN_STRUCTURE_PAGINATION_NEXT}</ul>
    </div>
    <p>
      <span>{PHP.L.Total}: {ADMIN_STRUCTURE_TOTALITEMS}, {PHP.L.Onpage}: {ADMIN_STRUCTURE_COUNTER_ROW}</span>
    </p>
  </div>
  <!-- END: DEFAULT -->
</div>
<!-- BEGIN: NEWCAT -->
<div class="uk-margin uk-margin-top uk-card uk-card-default uk-padding-small uk-width-expand uk-border-rounded uk-box-shadow" uk-height-viewport="expand: true">
  <h3>{PHP.L.Add}:</h3>
  <form name="addstructure" id="addstructure" action="{ADMIN_STRUCTURE_URL_FORM_ADD}" method="post" class="ajax" enctype="multipart/form-data">
    <div class="uk-tile uk-background-muted uk-padding-small uk-width-1-1 uk-box-shadow-medium uk-margin-bottom uk-border-rounded">
      <div class="uk-margin">
        <label class="uk-margin uk-text-medium uk-form-label">{PHP.L.Path}: <span class="uk-text-danger uk-margin-left">{PHP.L.adm_required}</span>
        </label>
        <div class="uk-form-controls"> {ADMIN_STRUCTURE_PATH} </div>
      </div>
      <div class="uk-margin">
        <label class="uk-margin uk-text-medium uk-form-label">{PHP.L.Code}: <span class="uk-text-danger uk-margin-left">{PHP.L.adm_required}</span>
        </label>
        <div class="uk-form-controls"> {ADMIN_STRUCTURE_CODE} </div>
      </div>
      <div class="uk-margin">
        <label class="uk-margin uk-text-medium uk-form-label">{PHP.L.Title}: <span class="uk-text-danger uk-margin-left">{PHP.L.adm_required}</span>
        </label>
        <div class="uk-form-controls"> {ADMIN_STRUCTURE_TITLE} </div>
      </div>
      <div class="uk-margin">
        <label class="uk-margin uk-text-medium uk-form-label">{PHP.L.Description}:</label>
        <div class="uk-form-controls"> {ADMIN_STRUCTURE_DESC} </div>
      </div>
      <div class="uk-margin">
        <label class="uk-margin uk-text-medium uk-form-label">{PHP.L.Icon}:</label>
        <div class="uk-form-controls"> {ADMIN_STRUCTURE_ICON} </div>
      </div>
      <div class="uk-margin">
        <div class="uk-form-controls">
          <label class="uk-margin uk-margin-right uk-text-medium uk-form-label">{PHP.L.Locked}:</label>{ADMIN_STRUCTURE_LOCKED}
        </div>
      </div>
      <!-- BEGIN: EXTRAFLD -->
      <div class="uk-margin">
        <label class="uk-margin uk-text-medium uk-form-label">{ADMIN_STRUCTURE_EXTRAFLD_TITLE}:</label>
        <div class="uk-form-controls"> {ADMIN_STRUCTURE_EXTRAFLD} </div>
      </div>
      <!-- END: EXTRAFLD -->
      <div class="uk-margin">
        <input type="submit" class="submit uk-button uk-button-success" value="{PHP.L.Add}" />
      </div>
  </form>
</div>
<!-- END: NEWCAT -->
<!-- END: MAIN -->