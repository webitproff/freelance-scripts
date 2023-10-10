<!-- BEGIN: MAIN -->
<div class="uk-panel">
  <div uk-grid="" class="uk-flex-middle uk-grid">
    <div class="uk-width-expand">
      <h1 class="uk-text-uppercase uk-text-bold uk-link-text uk-h4 uk-margin-top">
        <span class="uk-txt-sldlight uk-margin-small-right">
          <i class="fa-solid fa-user-shield fa-2xl"></i>
        </span>{PHP.L.sbr}
      </h1>
    </div>
    <div class="uk-width-auto">
      <a uk-tooltip="{PHP.L.Help}" class="uk-icon-button uk-button-warning" target="_blank" href="https://freelance-script.abuyfile.com/sdelka-bez-riska-plugin-freelance-cotonti/" uk-icon="icon: question; ratio: 1.2" title=""></a>
    </div>
  </div>
  <div class="uk-grid-small" uk-grid>
    <div class="uk-width-1-3@m">
      <div class="uk-card uk-card-default uk-card-body uk-border-rounded uk-box-shadow-medium">
        <div class="uk-text-center"></div>
        <ul class="uk-list uk-list-divider nav nav-tabs" id="myTab">
          <li <!-- IF !{PHP.status} --> class="active"
            <!-- ENDIF -->> <a href="{PHP|cot_url('admin', 'm=other&p=sbr')}">{PHP.L.All}</a>
          </li>
          <!-- BEGIN: STATUS_ROW -->
          <li> <a  <!-- IF {PHP.status}=={STATUS_ROW_ID} --> class=""
            <!-- ENDIF --> href="{STATUS_ROW_ID|cot_url('admin', 'm=other&p=sbr&status='$this)}">{STATUS_ROW_TITLE}</a>
          </li>
          <!-- END: STATUS_ROW -->
        </ul>
      </div>
    </div>
    <div class="uk-width-2-3@m">
      <div class="uk-card uk-card-default uk-card-body uk-border-rounded uk-box-shadow-medium">
        <div class="uk-overflow-auto" id="listservices">
          <table class="uk-table uk-table-small uk-table-divider table">
            <!-- BEGIN: SBR_ROW -->
            <tr>
              <td>{SBR_ROW_ID}</td>
              <td>
                <a href="{SBR_ROW_URL}" target="blank">{SBR_ROW_SHORTTITLE}</a>
              </td>
              <td>
                <!-- IF {CREATEDATE_STAMP} -->{SBR_ROW_CREATEDATE}
                <!-- ENDIF -->
              </td>
              <td>{SBR_ROW_COST} {PHP.cfg.payments.valuta}</td>
              <td>
                <!-- IF !{PHP.status} -->
                <span class="label label-{SBR_ROW_LABELSTATUS}">{SBR_ROW_LOCALSTATUS}</span>
                <!-- ENDIF -->
              </td>
            </tr>
            <!-- END: SBR_ROW -->
          </table>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- END: MAIN -->