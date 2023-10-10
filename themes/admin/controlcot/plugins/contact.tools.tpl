<!-- BEGIN: MAIN -->
<div class="uk-container uk-container-large">
  <div> {FILE "{PHP.cfg.themes_dir}/{PHP.usr.theme}/warnings.tpl"} </div>
  <div class="uk-card uk-card-small uk-border-rounded uk-card-default uk-margin-top uk-margin-bottom">
    <div class="uk-card-body">
          <h3 class="badge bg-lightblue color-palette card-title d-flex align-items-center">
            <i class="fa-solid fa-envelope fs-5 flex-shrink-0"></i>
            <span class="flex-grow-1 ms-3 text-uppercase p-1">
              <strong>{PHP.L.contact_title}</strong>
            </span>
          </h3>
      </div>
    </div>
  <!-- BEGIN: VIEW -->
  <div class="uk-card uk-card-small uk-border-rounded uk-card-default uk-margin-top uk-margin-bottom">
    <div class="uk-card-body">
      
        <h3 class="card-title text-light">
          <i class="fa-solid fa-eye"></i> {PHP.L.contact_view} #{CONTACT_ID} (
          <!-- IF {CONTACT_SUBJECT} -->{CONTACT_SUBJECT}
          <!-- ELSE -->{PHP.L.contact_nosubject}
          <!-- ENDIF -->)
        </h3>
      
      <form action="{CONTACT_FORM_SEND}" method="post" name="contact_form" class="uk-form-horizontal">
    <div class="uk-margin">
        <label class="uk-form-label">{PHP.L.Date}:</label>
        <div class="uk-form-controls"> {CONTACT_DATE}</div>
    </div>
    <div class="uk-margin">
        <label class="uk-form-label">{PHP.L.Username}:</label>
        <div class="uk-form-controls">{CONTACT_USER}</div>
    </div>
    <div class="uk-margin">
        <label class="uk-form-label">{PHP.L.Email}:</label>
        <div class="uk-form-controls"> {CONTACT_EMAIL}</div>
    </div>
    <div class="uk-margin">
        <label class="uk-form-label"></label>
        <div class="uk-form-controls"><!-- IF {CONTACT_SUBJECT} -->{CONTACT_SUBJECT}
              <!-- ELSE -->{PHP.L.contact_nosubject}
              <!-- ENDIF --></div>
    </div>
    <div class="uk-margin">
        <label class="uk-form-label">{PHP.L.Message}:</label>
        <div class="uk-form-controls">{CONTACT_TEXT}</div>
    </div>

          <!-- BEGIN: EXTRAFLD -->
    <div class="uk-margin">
        <label class="uk-form-label">{CONTACT_EXTRAFLD_TITLE}:</label>
        <div class="uk-form-controls">{CONTACT_EXTRAFLD}</div>
    </div>
          <!-- END: EXTRAFLD -->
          <!-- IF {CONTACT_REPLY} -->
    <div class="uk-margin">
        <label class="uk-form-label">{PHP.L.contact_sent}:</label>
        <div class="uk-form-controls"> {CONTACT_REPLY}</div>
    </div>
          <!-- ENDIF -->
    <div class="uk-margin">
        <label class="uk-form-label">{PHP.L.Reply}:</label>
        <div class="uk-form-controls">{CONTACT_FORM_TEXT}</div>
    </div>
    <div class="uk-margin">
        <button class="uk-button uk-button-primary" type="submit">{PHP.L.Submit}</button>
    </div>
      </form>
	  </div>
    </div>
  <!-- END: VIEW -->
  <!-- BEGIN: DATA -->
  <div class="uk-card uk-card-small uk-border-rounded uk-card-default uk-margin-top uk-margin-bottom">
  <div class="uk-card-body">
    <div class="uk-grid-small" uk-grid>
      <div class="uk-width-auto@m">
        <span class="uk-text-bold">{CONTACT_DATE}</span>
        <br />
        <!-- IF {CONTACT_VAL} == val -->
        <span class="uk-label"> {PHP.L.contact_shortnew} </span>
        <!-- ENDIF -->
      </div>
      <div class="uk-width-1-5@m">
        <p class="m-0">{CONTACT_USER} <br />
          <span>{CONTACT_EMAIL} </span>
        </p>
      </div>
      <div class="uk-width-2-5@m">
        <span class="text-wrap px-lg-3"> {CONTACT_TEXTSHORT} </span>
      </div>
      <div class="uk-width-expand@m">
        <div class="uk-grid-small uk-flex-right" uk-grid>
			<div>
				<a href="{CONTACT_VIEWLINK}" title="{PHP.L.View} {PHP.L.Open}" class=""><span class="uk-icon-button uk-button-default"><i class="fa-solid fa-eye fa-xl"></i></span></a>
			</div>
            <!-- IF {CONTACT_VAL} == val -->
			<div>
            <a href="{CONTACT_READLINK}" title="{PHP.L.contact_markread} {PHP.L.contact_unread}" class=""><span class="uk-icon-button uk-button-warning"><i class="fa-regular fa-envelope fa-xl"></i></span></a>
			</div>
            <!-- ELSE -->
			<div>
            <a href="{CONTACT_UNREADLINK}" title="{PHP.L.contact_markunread} {PHP.L.contact_read}" class=""><span class="uk-icon-button uk-button-success"><i class="fa-regular fa-envelope-open fa-xl"></i></span></a>
			</div>
            <!-- ENDIF -->
			<div>
            <a href="{CONTACT_DELLINK}" title="{PHP.L.Delete}" class="">
<span class="uk-icon-button uk-button-danger"><i class="fa-solid fa-trash-can fa-xl"></i></span></a>
			</div>
          
        </div>
      </div>
    </div>
  </div>
  </div>
  <!-- END: DATA -->
  <div>
<ul class="uk-pagination">
    {CONTACT_PREV}{CONTACT_PAGINATION}{CONTACT_NEXT}
</ul>
    <p></p>
  </div>
</div>
<!-- END: MAIN -->