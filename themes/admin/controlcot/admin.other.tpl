<!-- BEGIN: MAIN -->
<div class="uk-margin uk-margin-top uk-card uk-card-default uk-padding-small uk-width-expand uk-border-rounded uk-box-shadow">
  <h2>
    <span class="uk-h3 uk-text-bold uk-link-text">{PHP.L.Core}</span>
  </h2>
  <dl class="uk-description-list uk-description-list-divider">
    <dt>
      <a class="uk-link-text" href="{ADMIN_OTHER_URL_CACHE}">
        <span class="uk-margin-small-righr">
          <i class="ti ti-device-heart-monitor uk-h2 uk-text-middle"></i>
        </span>
        <span class="uk-text-bold uk-text-capitalize uk-text-middle uk-text-medium" uk-tooltip="{PHP.L.adm_internalcache_desc}"> {PHP.L.adm_internalcache}</span>
      </a>
    </dt>
    <dd>{PHP.L.adm_internalcache_desc}</dd>
    <dt>
      <a class="uk-link-text" href="{ADMIN_OTHER_URL_DISKCACHE}">
        <span class="uk-margin-small-righr">
          <i class="ti ti-gauge uk-h2 uk-text-middle uk-text-danger"></i>
        </span>
        <span class="uk-text-bold uk-text-capitalize uk-text-middle uk-text-medium" uk-tooltip="{PHP.L.adm_diskcache_desc}"> {PHP.L.adm_diskcache}</span>
      </a>
    </dt>
    <dd>{PHP.L.adm_diskcache_desc}</dd>
    <dt>
      <a class="uk-link-text" href="{ADMIN_OTHER_URL_LOG}">
        <span class="uk-margin-small-righr">
          <i class="ti ti-device-analytics uk-h2 uk-text-middle uk-text-muted"></i>
        </span>
        <span class="uk-text-bold uk-text-capitalize uk-text-middle uk-text-medium" uk-tooltip="{PHP.L.adm_log_desc}"> {PHP.L.adm_log}</span>
      </a>
    </dt>
    <dd>{PHP.L.adm_log_desc}</dd>
    <dt>
      <a class="uk-link-text" href="{ADMIN_OTHER_URL_EXFLDS}">
        <span class="uk-margin-small-righr">
          <i class="ti ti-tools uk-h2 uk-text-middle uk-text-warning"></i>
        </span>
        <span class="uk-text-bold uk-text-capitalize uk-text-middle uk-text-medium" uk-tooltip="{PHP.L.adm_extrafields_desc}"> {PHP.L.adm_extrafields}</span>
      </a>
    </dt>
    <dd>{PHP.L.adm_extrafields_desc}</dd>
    <dt>
      <a class="uk-link-text" href="{ADMIN_OTHER_URL_INFOS}">
        <span class="uk-margin-small-righr">
          <i class="ti ti-info-square uk-h2 uk-text-middle uk-text-primary"></i>
        </span>
        <span class="uk-text-bold uk-text-capitalize uk-text-middle uk-text-medium" uk-tooltip="{PHP.L.adm_infos_desc}"> {PHP.L.adm_infos}</span>
      </a>
    </dt>
    <dd>{PHP.L.adm_infos_desc}</dd>
  </dl>
</div>
<!-- BEGIN: SECTION -->
<div class="uk-margin uk-margin-top uk-card uk-card-default uk-padding-small uk-width-expand uk-border-rounded uk-box-shadow">
  <h2>
    <span class="uk-h3 uk-text-bold uk-link-text">{ADMIN_OTHER_SECTION}</span>
  </h2>
  <dl class="uk-description-list uk-description-list-divider">
    <!-- BEGIN: ROW -->
    <dt>
      <a uk-tooltip="{ADMIN_OTHER_EXT_DESC}" class="uk-link-text" href="{ADMIN_OTHER_EXT_URL}">
        <!-- IF {ADMIN_OTHER_EXT_ICO} -->
        <img src="{ADMIN_OTHER_EXT_ICO}" width="32" height="32" />
        <!-- ELSE -->
        <img class="uk-margin-small-right" src="{PHP.cfg.mainurl}/{PHP.cfg.themes_dir}/admin/controlcot/img/cotonti-controlcot-by-webitproff.png" width="27" height="27">
        <!-- ENDIF -->
        <span class="uk-text-bold uk-text-capitalize uk-text-middle uk-text-medium">{ADMIN_OTHER_EXT_NAME}</span>
      </a>
    </dt>
    <dd>{ADMIN_OTHER_EXT_DESC}</dd>
    <!-- END: ROW -->
  </dl>
  <!-- BEGIN: EMPTY -->
  <p>{PHP.L.adm_listisempty}</p>
  <!-- END: EMPTY -->
</div>
<!-- END: SECTION -->
<div class="uk-margin-vertical uk-alert-primary uk-alert" uk-alert="">
  <a class="uk-alert-close uk-icon uk-close" uk-close=""></a>
  <p>Шаблон:</p>
  <code>admin.other.tpl</code>
</div>
<!-- END: MAIN -->