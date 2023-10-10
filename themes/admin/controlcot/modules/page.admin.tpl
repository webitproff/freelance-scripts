<!-- BEGIN: MAIN -->

<div class="uk-margin uk-margin-top uk-card uk-card-default uk-padding-small uk-width-expand uk-border-rounded uk-box-shadow"  uk-height-viewport="expand: true">
	<h2><span class="uk-h3 uk-text-bold uk-link-text">{PHP.L.Pages} ({ADMIN_PAGE_TOTALDBPAGES})</span></h2>

		{FILE "{PHP.cfg.themes_dir}/{PHP.theme}/warnings.tpl"}
  <div class="uk-grid-small uk-child-width-1-2@m uk-child-width-1-4@l" uk-grid>
	<div>
	  <a uk-tooltip="{PHP.L.Configuration}" class="uk-link-text" href="{ADMIN_PAGE_URL_CONFIG}">
	    <div class="uk-tile uk-background-muted uk-padding-small uk-width-1-1 uk-box-shadow-medium uk-margin-small-bottom uk-border-rounded">
	      <div class="uk-flex uk-flex-middle uk-flex-left uk-flex-center@s">
	        <img src="{PHP.cfg.mainurl}/themes/admin/controlcot/img/equalizer_settings_icon.svg" title="" class=" uk-margin-small-right" width="32" height="32" uk-svg="uk-preserve">
	        <span class="uk-text-medium uk-text-bold uk-text-capitalize">{PHP.L.Configuration}</span>
	      </div>
	    </div>
	  </a>
	</div>
	<div>
	  <a uk-tooltip="{PHP.L.adm_extrafields_desc}" class="uk-link-text" href="{ADMIN_PAGE_URL_EXTRAFIELDS}">
	    <div class="uk-tile uk-background-muted uk-padding-small uk-width-1-1 uk-box-shadow-medium uk-margin-small-bottom uk-border-rounded">
	      <div class="uk-flex uk-flex-middle uk-flex-left uk-flex-center@s">
	        <img src="{PHP.cfg.mainurl}/themes/admin/controlcot/img/extrafield_layout_icon.svg" title="" class=" uk-margin-small-right" width="32" height="32" uk-svg="uk-preserve">
	        <span class="uk-text-medium uk-text-bold uk-text-capitalize">{PHP.L.adm_extrafields}</span>
	      </div>
	    </div>
	  </a>
	</div>
	<div>
	  <a uk-tooltip="" class="uk-link-text" href="{ADMIN_PAGE_URL_STRUCTURE}">
	    <div class="uk-tile uk-background-muted uk-padding-small uk-width-1-1 uk-box-shadow-medium uk-margin-small-bottom uk-border-rounded">
	      <div class="uk-flex uk-flex-middle uk-flex-left uk-flex-center@s">
	        <img src="{PHP.cfg.mainurl}/themes/admin/controlcot/img/structure.svg" title="" class=" uk-margin-small-right" width="32" height="32" uk-svg="uk-preserve">
	        <span class="uk-text-medium uk-text-bold uk-text-capitalize">{PHP.L.Categories}</span>
	      </div>
	    </div>
	  </a>
	</div>
	<div>
	  <a uk-tooltip="" class="uk-link-text" href="{ADMIN_PAGE_URL_ADD}">
	    <div class="uk-tile uk-background-muted uk-padding-small uk-width-1-1 uk-box-shadow-medium uk-margin-small-bottom uk-border-rounded">
	      <div class="uk-flex uk-flex-middle uk-flex-left uk-flex-center@s">
	        <img src="{PHP.cfg.mainurl}/themes/admin/controlcot/img/add_sign_icon.svg" title="" class=" uk-margin-small-right" width="32" height="32" uk-svg="uk-preserve">
	        <span class="uk-text-medium uk-text-bold uk-text-capitalize">{PHP.L.page_addtitle}</span>
	      </div>
	    </div>
	  </a>
	</div>
  </div>	

		
			<h3><span class="uk-text-medium uk-text-bold uk-text-capitalize">{PHP.L.Pages}:</span></h3>
			<form id="form_valqueue" name="form_valqueue" method="post" action="{ADMIN_PAGE_FORM_URL}">
<div class="uk-grid-small" uk-grid>
	<input type="hidden" name="paction" value="" />
	<!-- IF {ADMIN_PAGE_TOTALITEMS} > 1 -->
    <div class="uk-width-expand@l">
		<div class="uk-margin">
			<label class="uk-form-label"><span uk-tooltip="" class="uk-h4 uk-text-warning">{PHP.L.adm_sort}</span></label>
			<div class="uk-form-controls">
				<div class="uk-grid-small" uk-grid>
					<div class="uk-width-1-2@m">
					{ADMIN_PAGE_ORDER}
					</div>
					<div class="uk-width-1-2@m">
					{ADMIN_PAGE_WAY}
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ENDIF -->
    <div class="uk-width-1-3@l">
		<div class="uk-margin">
			<label class="uk-form-label"><span uk-tooltip="" class="uk-h4 uk-text-warning">{PHP.L.Show}</span></label>
			<div class="uk-form-controls">
				{ADMIN_PAGE_FILTER}
			</div>
		</div>
	</div>
    <div class="uk-width-auto@l uk-flex uk-flex-bottom uk-flex-center">
		<div>
			<input class="uk-button uk-button-primary" name="paction" type="submit" value="{PHP.L.Filter}" onclick="this.form.paction.value=this.value" />
		</div>
	</div>
</div>

		<!-- IF {PHP.cfg.jquery} -->
		<div class="uk-margin">
			<label class="uk-form-label"><span uk-tooltip="" class="uk-h4 uk-text-warning">{PHP.L.All}</span></label>
			<div class="uk-form-controls">
				<input name="allchek" class="uk-checkbox" type="checkbox" value="" onclick="$('.checkbox').attr('checked', this.checked);" />
			</div>
		</div>
		<!-- ENDIF -->





<ul class="uk-list uk-list-striped">
<!-- BEGIN: PAGE_ROW -->

<li>
<div class="uk-grid-small" uk-grid>
		<div class="uk-width-3-4@m">
			<div class="uk-grid-small" uk-grid>
				<div class="uk-width-auto@m">
					<div class="uk-grid-small" uk-grid>
						<div class=" uk-flex uk-flex-middle {ADMIN_PAGE_ODDEVEN}">
							<input name="s[{ADMIN_PAGE_ID}]" type="checkbox"  class="uk-checkbox" />
						</div>
						<div class="{ADMIN_PAGE_ODDEVEN}">
							<span uk-tooltip="{PHP.L.Id}" class="uk-h4 uk-text-bold uk-link-text">{ADMIN_PAGE_ID}</span>
						</div>
					</div>
				</div>
				<div class="uk-width-expand@m {ADMIN_PAGE_ODDEVEN}">
<ul uk-accordion="multiple: false">
    <li>
        <a class="uk-accordion-title uk-link-text" href="#mor_{PHP.ii}"><span uk-tooltip="{PHP.L.Title}" class="uk-h4">{ADMIN_PAGE_SHORTTITLE}</span></a>
        <div class="uk-accordion-content" id="mor_{PHP.ii}">
			<dl class="uk-description-list uk-description-list-divider">
				<dt>{PHP.L.Category}:</dt>
				<dd>{ADMIN_PAGE_CATPATH_SHORT}</dd>
				<!-- IF {ADMIN_PAGE_DESC} -->
				<dt>{PHP.L.Description}:</dt>
				<dd>{ADMIN_PAGE_DESC}</dd>
				<!-- ENDIF -->
				<dt>{PHP.L.Text}:</dt>
				<dd>{ADMIN_PAGE_TEXT}</dd>
			</dl>
        </div>
    </li>
</ul>

				</div>
			</div>
		</div>
		<div class="uk-width-1-4@m">
            <div class="uk-grid-small uk-flex-center uk-text-center {ADMIN_PAGE_ODDEVEN}" uk-grid>
              <div>
                <a uk-tooltip="{PHP.L.short_open}" target="_blank" class="uk-icon-button uk-button-primary" href="{ADMIN_PAGE_ID_URL}" uk-icon="icon: link; ratio: 1.2" title=""></a>
              </div>
              <div>
                <a uk-tooltip="{PHP.L.Edit}" target="_blank" class="uk-icon-button uk-button-warning" href="{ADMIN_PAGE_URL_FOR_EDIT}" uk-icon="icon: file-edit; ratio: 1.2" title=""></a>
              </div>
              <div>
                <a uk-tooltip="{PHP.L.Delete}" class="uk-icon-button uk-button-danger" href="{ADMIN_PAGE_URL_FOR_DELETED}" uk-icon="icon: trash; ratio: 1.2" title=""></a>
              </div>
			  <!-- IF {PHP.row.page_state} == 1 -->
              <div>
                <a uk-tooltip="{PHP.L.Validate}" class="uk-icon-button uk-button-success" href="{ADMIN_PAGE_URL_FOR_VALIDATED}" uk-icon="icon: check; ratio: 1.2" title=""></a>
              </div>
			  <!-- ENDIF -->
			</div>
		</div>
</div>
</li>

<!-- END: PAGE_ROW -->
</ul>
<!-- IF {PHP.is_row_empty} -->
<div class="uk-alert-warning" uk-alert>
    <a class="uk-alert-close" uk-close></a>
    <p>{PHP.L.None}</p>
</div>
<!-- ENDIF -->

					<div class="uk-grid-small" uk-grid>
						<!-- IF {PHP.filter} != 'validated' -->
						<div>
							<input class="uk-button uk-button-success" name="paction" type="submit" value="{PHP.L.Validate}" onclick="this.form.paction.value=this.value" class="confirm" />
						</div>
						<!-- ENDIF -->
						<div>
							<input class="uk-button uk-button-danger" name="paction" type="submit" value="{PHP.L.Delete}" onclick="this.form.paction.value=this.value" />
						</div>
					</div>


	<nav><ul class="uk-pagination uk-flex-center uk-margin-top uk-margin-bottom">{ADMIN_PAGE_PAGINATION_PREV}{ADMIN_PAGE_PAGNAV}{ADMIN_PAGE_PAGINATION_NEXT}</ul></nav>
			<p class="paging">
				<span>{PHP.L.Total}: {ADMIN_PAGE_TOTALITEMS}, {PHP.L.Onpage}: {ADMIN_PAGE_ON_PAGE}</span>
			</p>
			</form>
	</div>
<div class="uk-visible@m uk-margin-vertical uk-alert-primary uk-alert" uk-alert="">
  <a class="uk-alert-close uk-icon uk-close" uk-close=""></a>
  <p>Шаблон:</p>
  <code>/themes/admin/controlcot/modules/page.admin.tpl</code>
</div>
<!-- END: MAIN -->