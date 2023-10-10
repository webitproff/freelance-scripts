<!-- BEGIN: MAIN -->
	<script type="text/javascript">
		$(document).ready(function()
		{
			$('.moreinfo').hide();
			$(".mor_info_on_off").click(function()
			{
				var kk = $(this).attr('id');
				$('#'+kk).children('.moreinfo').slideToggle(100);
			});
		});
	</script>
<div class="uk-margin uk-margin-top uk-card uk-card-default uk-padding-small uk-width-expand uk-border-rounded uk-box-shadow"  uk-height-viewport="expand: true">
	<h2><span class="uk-h3 uk-text-bold uk-link-text">{PHP.L.Pages} ({ADMIN_PAGE_TOTALDBPAGES})</span></h2>

		{FILE "{PHP.cfg.themes_dir}/{PHP.theme}/warnings.tpl"}
		<div class=" button-toolbar block">
				<a title="{PHP.L.Configuration}" href="{ADMIN_PAGE_URL_CONFIG}" class="button">{PHP.L.Configuration}</a>
				<a href="{ADMIN_PAGE_URL_EXTRAFIELDS}" class="button">{PHP.L.adm_extrafields_desc}</a>
				<a href="{ADMIN_PAGE_URL_STRUCTURE}" class="button">{PHP.L.Categories}</a>
				<a href="{ADMIN_PAGE_URL_ADD}" class="button special">{PHP.L.page_addtitle}</a>
		</div>
		<div class="block">
			<h3>{PHP.L.Pages}:</h3>
			<form id="form_valqueue" name="form_valqueue" method="post" action="{ADMIN_PAGE_FORM_URL}">
			<table class="cells">
				<tr>
					<td class="right" colspan="4">
						<input type="hidden" name="paction" value="" />
						<!-- IF {ADMIN_PAGE_TOTALITEMS} > 1 -->{PHP.L.adm_sort} {ADMIN_PAGE_ORDER} {ADMIN_PAGE_WAY}<!-- ENDIF --> {PHP.L.Show} {ADMIN_PAGE_FILTER}
						<input name="paction" type="submit" value="{PHP.L.Filter}" onclick="this.form.paction.value=this.value" />
					</td>
				</tr>
				<tr>
					<td class="coltop width5">
						<!-- IF {PHP.cfg.jquery} -->
						<input name="allchek" class="checkbox" type="checkbox" value="" onclick="$('.checkbox').attr('checked', this.checked);" />
						<!-- ENDIF -->
					</td>
					<td class="coltop width5">{PHP.L.Id}</td>
					<td class="coltop width65">{PHP.L.Title}</td>
					<td class="coltop width25">{PHP.L.Action}</td>
				</tr>
<!-- BEGIN: PAGE_ROW -->
        <div class="" uk-grid>
          <div class="uk-width-1-2@m uk-flex uk-flex-middle">
					<td class="centerall {ADMIN_PAGE_ODDEVEN}">
						{ADMIN_PAGE_ID}
					</td>
					<td class="{ADMIN_PAGE_ODDEVEN}">
						<div id="mor_{PHP.ii}" class='mor_info_on_off'>
							<span class="strong" style="cursor:hand;">{ADMIN_PAGE_SHORTTITLE}</span>
							<div class="moreinfo">
								<hr />
								<table class="flat">
									<tr>
										<td class="width20">{PHP.L.Category}:</td>
										<td class="width80">{ADMIN_PAGE_CATPATH_SHORT}</td>
									</tr>
									<tr>
										<td>{PHP.L.Description}:</td>
										<td>{ADMIN_PAGE_DESC}</td>
									</tr>
									<tr>
										<td>{PHP.L.Text}:</td>
										<td>{ADMIN_PAGE_TEXT}</td>
									</tr>
								</table>
							</div>
						</div>
					</td>
            <ul class="uk-list uk-list-divider uk-width-1-1">
              <li>
                <a uk-tooltip="{PHP.L.Ctrl_Name_Extention}" class="uk-link-text" href="{ADMIN_EXTENSIONS_DETAILS_URL}">
                  <!-- IF {ADMIN_EXTENSIONS_ICO} -->
                  <img src="{ADMIN_EXTENSIONS_ICO}" uk-tooltip="" title="" class="uk-margin-small-right" width="27" height="27">
                  <!-- ELSE -->
                  <img src="{PHP.cfg.system_dir}/admin/img/plugins32.png" uk-tooltip="" title="" class="uk-margin-small-right" width="27" height="27">
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
            <div class="uk-child-width-1-3" uk-grid>
              <div>
                <code>{ADMIN_EXTENSIONS_CODE_X}</code>
              </div>
              <div></div>
              <div> {ADMIN_EXTENSIONS_PARTSCOUNT} </div>
            </div>
          </div>
          <div class="uk-width-1-4@m {ADMIN_PAGE_ODDEVEN}">
            <div class="uk-grid-small uk-flex-center uk-text-center" uk-grid>
              <div>
                <a uk-tooltip="{PHP.L.short_open}" class="uk-icon-button uk-button-primary" href="{ADMIN_EXTENSIONS_JUMPTO_URL}" uk-icon="icon: link; ratio: 1.2" title=""></a>
              </div>
              <div>
                <a uk-tooltip="{PHP.L.Options} {PHP.L.Configuration}" class="uk-icon-button uk-button-warning" href="{ADMIN_EXTENSIONS_EDIT_URL}" uk-icon="icon: settings; ratio: 1.2" title="{PHP.L.short_config}"></a>
              </div>
              <div>
                <a uk-tooltip="{PHP.L.Structure}" class="uk-icon-button uk-box-shadow-medium uk-text-danger" href="{ADMIN_EXTENSIONS_JUMPTO_URL_STRUCT}" uk-icon="icon: list; ratio: 1.2" title="{PHP.L.Structure}"></a>
              </div>
<!-- IF {PHP.row.page_state} == 1 -->
              <div>
                <a uk-tooltip="{PHP.L.Validate}" class="uk-icon-button uk-button-success" href="{ADMIN_PAGE_URL_FOR_VALIDATED}" uk-icon="icon: check; ratio: 1.2" title="{PHP.L.Validate}"></a>
              </div>
<!-- ENDIF -->
              <div>
                <a uk-tooltip="{PHP.L.Delete}" class="uk-icon-button uk-button-danger" href="{ADMIN_PAGE_URL_FOR_DELETED}" uk-icon="icon: trash; ratio: 1.2" title=""></a>
              </div>

            </div>

          </div>
        </div>
				<tr>
					<td class="centerall {ADMIN_PAGE_ODDEVEN}">
						<input name="s[{ADMIN_PAGE_ID}]" type="checkbox" class="checkbox" />
					</td>


				</tr>
<!-- END: PAGE_ROW -->
<!-- IF {PHP.is_row_empty} -->
				<tr>
					<td class="centerall" colspan="4">{PHP.L.None}</td>
				</tr>
<!-- ENDIF -->
				<tr>
					<td class="valid" colspan="4">
						<!-- IF {PHP.filter} != 'validated' --><input name="paction" type="submit" value="{PHP.L.Validate}" onclick="this.form.paction.value=this.value" class="confirm" /><!-- ENDIF -->
						<input name="paction" type="submit" value="{PHP.L.Delete}" onclick="this.form.paction.value=this.value" />
					</td>
				</tr>
			</table>
			<p class="paging">
				{ADMIN_PAGE_PAGINATION_PREV}{ADMIN_PAGE_PAGNAV}{ADMIN_PAGE_PAGINATION_NEXT}<span>{PHP.L.Total}: {ADMIN_PAGE_TOTALITEMS}, {PHP.L.Onpage}: {ADMIN_PAGE_ON_PAGE}</span>
			</p>
			</form>
		</div>
	</div>
<div class="uk-margin-vertical uk-alert-primary uk-alert" uk-alert="">
  <a class="uk-alert-close uk-icon uk-close" uk-close=""></a>
  <p>Шаблон:</p>
  <code>/themes/admin/controlcot/modules/page.admin.tpl</code>
</div>
<!-- END: MAIN -->