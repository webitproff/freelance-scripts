<!-- BEGIN: MAIN -->
<div class="col-md-12">
  <div> {FILE "{PHP.cfg.themes_dir}/{PHP.usr.theme}/warnings.tpl"} </div>
  <div class="card card-lightblue card-outline">
    <div class="card-header" style="background-color: var(--bs-dark-bg-subtle);">
      <!-- About using style="background-color: var(--bs-dark-bg-subtle);" read here https://getbootstrap.com/docs/5.3/customize/color/#colors -->
      <div class="row">
        <div class="col-md-6 col-sm-10 d-flex align-items-center justify-content-sm-start justify-content-center my-1">
          <h3 class="badge bg-lightblue color-palette card-title d-flex align-items-center">
            <i class="fa-solid fa-envelope fs-5 flex-shrink-0"></i>
            <span class="flex-grow-1 ms-3 text-uppercase p-1">
              <strong>{PHP.L.contactcallme_adm_title}</strong>
            </span>
          </h3>
          <div class="d-none d-lg-block">
            <h3 class="ms-3 badge bg-lightblue color-palette card-title d-flex align-items-center">
              <i class="fa-solid fa-gavel fs-5 flex-shrink-0"></i>
              <span class="flex-grow-1 ms-2 p-1">{PHP.L.contactcallme_title_adm}</span>
            </h3>
          </div>
        </div>
        <div class="col-md-6 col-sm-2 d-flex justify-content-md-end justify-content-center my-1">
          <a data-bs-toggle="tooltip" data-bs-title="{PHP.L.details_title_extention}" href="{PHP.cfg.mainurl}/admin.php?m=extensions&a=details&pl=contactcallme" class=" me-x d-flex align-items-center">
            <i class="fa-brands fa-elementor fs-1 flex-shrink-0 text-navy my-0"></i>
            <span class="flex-grow-1 d-inline-block"></span>
          </a>
          <a class="mx-2 d-flex align-items-center" href="{PHP.R.Link_Forum_Cotonti}" target="_blank" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="{PHP.L.Find_out_more}">
            <i class="fa-solid fa-book fs-1 flex-shrink-0 text-indigo my-0"></i>
          </a>
          <a data-bs-toggle="tooltip" data-bs-title="{PHP.L.Ask_Engine_community_forum}" href="{PHP.R.Link_Forum_Cotonti}" target="_blank" class="mx-2 d-flex align-items-center">
            <i class="fa-solid fa-comments fs-1 flex-shrink-0 text-orange my-0"></i>
            <span class="flex-grow-1 d-inline-block"></span>
          </a>
          <a data-bs-toggle="tooltip" data-bs-title="{PHP.L.source_on_GitHub}" href="https://github.com/Cotonti/Cotonti/tree/master/plugins/contactcallme" target="_blank" class="me-4 d-flex align-items-center">
            <i class="fa-brands fa-square-github fs-1 flex-shrink-0 text-black my-0"></i>
            <span class="flex-grow-1 d-inline-block"></span>
          </a>
        </div>
      </div>
    </div>
  </div>
  <!-- BEGIN: VIEW -->
    <div class="card elevation-2">
      <div class="card-header" style="background-color: #586c81 !important;">
        <h3 class="card-title text-light">
          <i class="fa-solid fa-eye"></i> {PHP.L.contactcallme_view} #{CONTACTCALLME_ID} (
          <!-- IF {CONTACTCALLME_PHONE} -->{CONTACTCALLME_PHONE}
          <!-- ELSE -->{PHP.L.contactcallme_nosubject}
          <!-- ENDIF -->)
        </h3>
      </div>
      <form action="{CONTACTCALLME_FORM_SEND}" method="post" name="contactcallme_form" class="form-horizontal">
        <div class="card-body">
          <div class="mb-3 row">
            <label class="col-sm-2 col-form-label">{PHP.L.Date}:</label>
            <div class="col-sm-10"> {CONTACTCALLME_DATE} </div>
          </div>
          <div class="mb-3 row">
            <label class="col-sm-2 col-form-label">{PHP.L.Username}:</label>
            <div class="col-sm-10"> {CONTACTCALLME_USER} </div>
          </div>
          <div class="mb-3 row">
            <label class="col-sm-2 col-form-label">{PHP.L.Email}:</label>
            <div class="col-sm-10"> {CONTACTCALLME_EMAIL} </div>
          </div>
          <div class="mb-3 row">
            <label class="col-sm-2 col-form-label">{PHP.L.Subject}:</label>
            <div class="col-sm-10">
              <!-- IF {CONTACTCALLME_PHONE} -->{CONTACTCALLME_PHONE}
              <!-- ELSE -->{PHP.L.contactcallme_nosubject}
              <!-- ENDIF -->
            </div>
          </div>
          <div class="mb-3 row">
            <label class="col-sm-2 col-form-label">{PHP.L.Message}:</label>
            <div class="col-sm-10">
              <div class="direct-chat-text"> {CONTACTCALLME_TEXT} </div>
            </div>
          </div>
          <!-- BEGIN: EXTRAFLD -->
          <div class="mb-3 row">
            <label class="col-sm-2 col-form-label">{CONTACTCALLME_EXTRAFLD_TITLE}:</label>
            <div class="col-sm-10"> {CONTACTCALLME_EXTRAFLD} </div>
          </div>
          <!-- END: EXTRAFLD -->
          <!-- IF {CONTACTCALLME_REPLY} -->
          <div class="mb-3 row">
            <label class="col-sm-2 col-form-label">{PHP.L.contactcallme_sent}:</label>
            <div class="col-sm-10"> {CONTACTCALLME_REPLY} </div>
          </div>
          <!-- ENDIF -->
          <div class="mb-3 row">
            <label class="col-sm-2 col-form-label">{PHP.L.Reply}:</label>
            <div class="col-sm-10"> {CONTACTCALLME_FORM_TEXT} </div>
          </div>
        </div>
        <div class="card-footer d-flex justify-content-md-end justify-content-center py-3">
          <button class="btn bg-gradient-primary btn-lg elevation-4" type="submit">{PHP.L.Submit}</button>
        </div>
      </form>
    </div>
  <!-- END: VIEW -->
  <!-- BEGIN: DATA -->
  <div class="card p-md-3 p-2 mb-3 elevation-1">
    <div class="row g-2">
      <div class="col-lg-2 col-md-6 col-xs-12">
        <span class="fs-6 fw-bold">{CONTACTCALLME_DATE}</span>
        <br />
        <!-- IF {CONTACTCALLME_VAL} == val -->
        <span class="badge badge-danger"> {PHP.L.contactcallme_shortnew} </span>
        <!-- ENDIF -->
        <hr class="d-none d-block d-md-none mt-2" style="background-color: var(--bs-gray-700);">
      </div>
      <div class="col-lg-2 col-md-6 col-xs-12">
        <p class="m-0">{CONTACTCALLME_USER} <br />
          <span>{CONTACTCALLME_EMAIL} </span>
        </p>
        <hr class="d-none d-block d-md-none mt-2" style="background-color: var(--bs-gray-700);">
      </div>
      <div class="col-lg-2 col-md-6 col-xs-12">
        <span class="text-wrap px-lg-3"> {CONTACTCALLME_PHONE} </span>
        <hr class="d-none d-block d-md-none mt-2" style="background-color: var(--bs-gray-700);">
      </div>
      <div class="col-lg-3 col-md-3 col-xs-12">
        <span class="text-wrap px-lg-3"> {CONTACTCALLME_TEXTSHORT} </span>
        <hr class="d-none d-block d-md-none mt-2" style="background-color: var(--bs-gray-700);">
      </div>
      <div class="col-lg-3 col-md-6 col-xs-12">
        <div class="row py-2  ">
          <div class="col-12 mx-auto d-flex  justify-content-md-end justify-content-center">
            <a href="{CONTACTCALLME_VIEWLINK}" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="{PHP.L.View}" class="btn btn-success w-30 m-1">{PHP.L.Open}</a>
            <!-- IF {CONTACTCALLME_VAL} == val -->
            <a href="{CONTACTCALLME_READLINK}" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="{PHP.L.contactcallme_markread}" class="btn btn-secondary w-40 m-1">{PHP.L.contactcallme_read}</a>
            <!-- ELSE -->
            <a href="{CONTACTCALLME_UNREADLINK}" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="{PHP.L.contactcallme_markunread}" class="text-nowrap btn btn-warning w-40 m-1">{PHP.L.contactcallme_unread}</a>
            <!-- ENDIF -->
            <a href="{CONTACTCALLME_DELLINK}" title="{PHP.L.Delete}" class="btn btn-danger w-30 m-1">{PHP.L.Delete}</a>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- END: DATA -->
  <div>
    <p>{CONTACTCALLME_PREV}{CONTACTCALLME_PAGINATION}{CONTACTCALLME_NEXT}</p>
  </div>
</div>
<!-- END: MAIN -->