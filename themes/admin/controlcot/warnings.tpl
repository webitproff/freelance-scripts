<!-- BEGIN: ERROR -->
<div class="uk-card uk-border-rounded border-fuchsia uk-card-small uk-alert-danger my-3" uk-alert>
  <a class="uk-alert-close text-navy" uk-close></a>
  <div class="uk-card-header">
    <div class="uk-grid-small uk-flex-middle" uk-grid>
      <div class="uk-width-auto">
        <i class="fa-solid fa-triangle-exclamation fs-1 text-fuchsia"></i>
      </div>
      <div class="uk-width-expand">
        <h3 class="uk-card-title text-navy uk-margin-remove-bottom">{PHP.L.Error}</h3>
      </div>
    </div>
  </div>
  <div class="uk-card-body">
    <ul class="uk-list uk-list-divider text-navy">
      <!-- BEGIN: ERROR_ROW -->
      <li>{ERROR_ROW_MSG}</li>
      <!-- END: ERROR_ROW -->
    </ul>
  </div>
</div>
<!-- END: ERROR -->
<!-- BEGIN: WARNING -->
<div class="uk-card uk-border-rounded border-navy uk-card-small uk-alert-warning my-3" uk-alert>
  <a class="uk-alert-close text-navy" uk-close></a>
  <div class="uk-card-header">
    <div class="uk-grid-small uk-flex-middle" uk-grid>
      <div class="uk-width-auto">
        <i class="fa-solid fa-person-circle-exclamation fs-1"></i>
      </div>
      <div class="uk-width-expand">
        <h3 class="uk-card-title text-navy uk-margin-remove-bottom">{PHP.L.Warning}</h3>
      </div>
    </div>
  </div>
  <div class="uk-card-body">
    <ul class="uk-list uk-list-divider text-navy">
      <!-- BEGIN: WARNING_ROW -->
      <li>{WARNING_ROW_MSG}</li>
      <!-- END: WARNING_ROW -->
    </ul>
  </div>
</div>
<!-- END: WARNING -->
<!-- BEGIN: DONE -->
<div class="uk-card uk-border-rounded uk-card-small uk-alert-success uk-margin-top" uk-alert>
  <a class="uk-alert-close" uk-close></a>
  <div class="uk-card-header">
    <div class="uk-grid-small uk-flex-middle" uk-grid>
      <div class="uk-width-auto">
        <i class="fa-solid fa-circle-check fa-2xl"></i>
      </div>
      <div class="uk-width-expand">
        <h3 class="uk-card-title uk-margin-remove-bottom">{PHP.L.Done}</h3>
      </div>
    </div>
  </div>
  <div class="uk-card-body">
    <ul class="uk-list uk-list-divider text-navy">
      <!-- BEGIN: DONE_ROW -->
      <li>{DONE_ROW_MSG}</li>
      <!-- END: DONE_ROW -->
    </ul>
  </div>
</div>
<!-- END: DONE -->