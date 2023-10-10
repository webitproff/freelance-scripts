<!-- BEGIN: MAIN -->
<div class="uk-margin uk-margin-top uk-card uk-card-default uk-padding-small uk-width-expand uk-border-rounded uk-box-shadow">
  <h3><span class="uk-h3 uk-text-bold uk-link-text">{PHP.L.Users}</span></h3>

		{FILE "{PHP.cfg.themes_dir}/admin/{PHP.cfg.admintheme}/warnings.tpl"}
  <div class="uk-grid-small uk-flex-center uk-text-center" uk-grid>
    <div>
		<a href="{ADMIN_USERS_EXTRAFIELDS_URL}" class="uk-button uk-button-small uk-button-primary">{PHP.L.adm_extrafields}</a>
    </div>
    <div>
		<a title="{PHP.L.Configuration}" href="{ADMIN_USERS_URL}" class="uk-button uk-button-small uk-button-default">{PHP.L.Configuration}</a>
    </div>
  </div>
</div>
<!-- BEGIN: ADMIN_USERS_DEFAULT -->

<!-- BEGIN: USERS_ROW -->
      <div class="uk-margin uk-card uk-card-default uk-padding-small uk-width-expand uk-border-rounded uk-box-shadow">
        <div class="" uk-grid>
          <div class="uk-width-1-2@m uk-flex uk-flex-middle">
            <ul class="uk-list uk-list-divider uk-width-1-1">
              <li>
                <div class="uk-grid-small uk-child-width-1-2 uk-flex" uk-grid>
                  <div>
                    <div class="uk-tile uk-padding-remove uk-flex uk-flex-left">
					<div>
					<span uk-tooltip="{PHP.L.Ctrl_Descr_usersgroup_ID}" class="uk-label uk-margin-small-right">ID {ADMIN_USERS_ROW_GRP_ID}</span>
				

				
				<a uk-tooltip="{PHP.L.Open}" class="uk-link-text" href="{ADMIN_USERS_ROW_GRP_ID|cot_url('users', 'gm='$this)}">
                  <span class="uk-text-middle uk-text-medium"> {ADMIN_USERS_ROW_GRP_NAME}</span>
                </a></div>
					</div>
                  </div>
                  <div>
                    <div class="uk-tile uk-padding-remove uk-flex uk-flex-right">
                      <span uk-tooltip="{PHP.L.Version}" class="uk-label">{ADMIN_USERS_ROW_GRP_COUNT_MEMBERS}</span>
                    </div>
                  </div>
                </div>

              </li>
              <li>
                <span uk-tooltip="{PHP.L.Ctrl_Descr_usersgroup}">{ADMIN_USERS_ROW_GRP_DESC}</span>
              </li>
              <li>
                <div class="uk-tile uk-padding-remove uk-flex uk-flex-left">{PHP.L.Enabled}: {ADMIN_USERS_ROW_GRP_DISABLED}</div>
              </li>
            </ul>
          </div>

          <div class="uk-width-1-2@m">

            <div class="uk-grid-small uk-flex-center uk-text-center" uk-grid>

              <div>
                <a uk-tooltip="{PHP.L.Edit}" class="uk-icon-button uk-button-warning" href="{ADMIN_USERS_ROW_GRP_TITLE_URL}" uk-icon="icon: settings; ratio: 1.2" title="{PHP.L.Edit}"></a>
              </div>
				<!-- IF !{ADMIN_USERS_ROW_GRP_SKIPRIGHTS} -->
              <div>
                <a uk-tooltip="{PHP.L.Rights}" class="uk-icon-button uk-button-success" href="{ADMIN_USERS_ROW_GRP_RIGHTS_URL}" uk-icon="icon: users; ratio: 1.2" title="{PHP.L.short_rights}"></a>
              </div>
			  <!-- ENDIF -->
            </div>

          </div>
        </div>
      </div>

<!-- END: USERS_ROW -->

		<div class="uk-margin uk-margin-top uk-card uk-card-default uk-padding-small uk-width-expand uk-border-rounded uk-box-shadow" uk-height-viewport="expand: true">
			<h3><span class="uk-h3 uk-text-bold uk-link-text">{PHP.L.Add}:</span></h3>
			<form name="addlevel" id="addlevel" action="{ADMIN_USERS_FORM_URL}" method="post" class="ajax">
			<table class="table">
				<tr>
					<td class="width40">{PHP.L.Name}:</td>
					<td class="width60">{ADMIN_USERS_NGRP_NAME}{PHP.L.adm_required}</td>
				</tr>
				<tr>
					<td>{PHP.L.Title}:</td>
					<td>{ADMIN_USERS_NGRP_TITLE}{PHP.L.adm_required}</td>
				</tr>
				<tr>
					<td>{PHP.L.Description}:</td>
					<td>{ADMIN_USERS_NGRP_DESC}</td>
				</tr>
				<tr>
					<td>{PHP.L.Icon}:</td>
					<td>{ADMIN_USERS_NGRP_ICON}</td>
				</tr>
				<tr>
					<td>{PHP.L.Alias}:</td>
					<td>{ADMIN_USERS_NGRP_ALIAS}</td>
				</tr>
				<!-- IF {PHP.pfs_is_active} -->
				<tr>
					<td>{PHP.L.adm_maxsizesingle}:</td>
					<td>{ADMIN_USERS_NGRP_PFS_MAXFILE}</td>
				</tr>
				<tr>
					<td>{PHP.L.adm_maxsizeallpfs}:</td>
					<td>{ADMIN_USERS_NGRP_PFS_MAXTOTAL}</td>
				</tr>
				<!-- ENDIF -->
				<tr>
					<td>{PHP.L.adm_copyrightsfrom}:</td>
					<td>{ADMIN_USERS_FORM_SELECTBOX_GROUPS} {PHP.L.adm_required}</td>
				</tr>
				<tr>
					<td>{PHP.L.adm_skiprights}:</td>
					<td>{ADMIN_USERS_NGRP_SKIPRIGHTS}</td>
				</tr>
				<tr>
					<td>{PHP.L.Level}:</td>
					<td>{ADMIN_USERS_NGRP_RLEVEL}</td>
				</tr>
				<tr>
					<td>{PHP.L.Disabled}:</td>
					<td>{ADMIN_USERS_NGRP_DISABLED}</td>
				</tr>
				<!-- IF {PHP.hidden_groups} -->
				<tr>
					<td>{PHP.L.Hidden}:</td>
					<td>{ADMIN_USERS_NGRP_HIDDEN}</td>
				</tr>
				<!-- ENDIF -->
				<tr>
					<td>{PHP.L.adm_rights_maintenance}:</td>
					<td>{ADMIN_USERS_NGRP_MAINTENANCE}</td>
				</tr>
				<tr>
					<td class="valid" colspan="2"><input type="submit" class="btn btn-default" value="{PHP.L.Add}" /></td>
				</tr>
			</table>
			</form>
		</div>
<!-- END: ADMIN_USERS_DEFAULT -->
<!-- BEGIN: ADMIN_USERS_EDIT -->
		<div class="uk-margin uk-margin-top uk-card uk-card-default uk-padding-small uk-width-expand uk-border-rounded uk-box-shadow" uk-height-viewport="expand: true">
			<form name="editlevel" id="editlevel" action="{ADMIN_USERS_EDITFORM_URL}" method="post" class="ajax">
				<table class="table">
					<tr>
						<td class="width40">{PHP.L.Name}:</td>
						<td class="width60">{ADMIN_USERS_EDITFORM_GRP_NAME} {PHP.L.adm_required}</td>
					</tr>
					<tr>
						<td>{PHP.L.Title}:</td>
						<td>{ADMIN_USERS_EDITFORM_GRP_TITLE} {PHP.L.adm_required}</td>
					</tr>
					<tr>
						<td>{PHP.L.Description}:</td>
						<td>{ADMIN_USERS_EDITFORM_GRP_DESC}</td>
					</tr>
					<tr>
						<td>{PHP.L.Icon}:</td>
						<td>{ADMIN_USERS_EDITFORM_GRP_ICON}</td>
					</tr>
					<tr>
						<td>{PHP.L.Alias}:</td>
						<td>{ADMIN_USERS_EDITFORM_GRP_ALIAS}</td>
					</tr>
					<!-- IF {PHP.pfs_is_active} -->
					<tr>
						<td>{PHP.L.adm_maxsizesingle}:</td>
						<td>{ADMIN_USERS_EDITFORM_GRP_PFS_MAXFILE}</td>
					</tr>
					<tr>
						<td>{PHP.L.adm_maxsizeallpfs}:</td>
						<td>{ADMIN_USERS_EDITFORM_GRP_PFS_MAXTOTAL}</td>
					</tr>
					<!-- ENDIF -->
					<tr>
						<td>{PHP.L.Disabled}:</td>
						<td>{ADMIN_USERS_EDITFORM_GRP_DISABLED}</td>
					</tr>
					<!-- IF {PHP.hidden_groups} -->
					<tr>
						<td>{PHP.L.Hidden}:</td>
						<td>{ADMIN_USERS_EDITFORM_GRP_HIDDEN}</td>
					</tr>
					<!-- ENDIF -->
					<tr>
						<td>{PHP.L.Level}:</td>
						<td>{ADMIN_USERS_EDITFORM_GRP_RLEVEL}</td>
					</tr>
					<tr>
						<td>{PHP.L.Members}:</td>
						<td><a href="{ADMIN_USERS_EDITFORM_GRP_MEMBERSCOUNT_URL}">{ADMIN_USERS_EDITFORM_GRP_MEMBERSCOUNT}</a></td>
					</tr>
					<tr>
						<td>{PHP.L.adm_rights_maintenance}:</td>
						<td>{ADMIN_USERS_EDITFORM_GRP_MAINTENANCE}</td>
					</tr>
					<tr>
						<td>{PHP.L.adm_skiprights}:</td>
						<td>{ADMIN_USERS_EDITFORM_GRP_SKIPRIGHTS}</td>
					</tr>
					<!-- IF !{ADMIN_USERS_EDITFORM_SKIPRIGHTS} -->
					<tr>
						<td>{PHP.L.Rights}:</td>
						<td><a href="{ADMIN_USERS_EDITFORM_RIGHT_URL}" class="btn btn-default">{PHP.L.Rights}</a></td>
					</tr>
					<!-- ENDIF -->
<!-- IF {PHP.g} > 5 -->
					<tr>
						<td>{PHP.L.Delete}:</td>
						<td><a href="{ADMIN_USERS_EDITFORM_DEL_URL}" class="ajax">{PHP.R.admin_icon_delete}</a></td>
					</tr>
<!-- ENDIF -->
					<tr>
						<td class="valid" colspan="2"><button class="btn btn-success" >{PHP.L.Update}</button></td>
					</tr>
				</table>
			</form>
		</div>
<!-- END: ADMIN_USERS_EDIT -->

<!-- END: MAIN -->