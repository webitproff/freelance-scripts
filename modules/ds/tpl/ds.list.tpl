<!-- BEGIN: MAIN -->
<div class="breadcrumb">{DS_PAGETITLE}</div>
			<div class="block border0 margin0">
					<table class="table" style="margin: 0px auto; max-width: 50%;">
						<thead>
							<tr>
              	<th class="width30 text-center">Диалоги</th>
							</tr>
						</thead>
						<tbody>
<!-- BEGIN: DS_ROW -->
						<tr class="dialoghover">
              <td class="dialog_body" onclick="window.location='{DS_DIAOG_URL}'">
                <div class="ds_avatar marginright10" style="float: left;">{DS_OPPONENT_AVATAR}</div>
								<div class="paddingright10 dialogmsg<!-- IF {DS_STATUS} --> unreadmsg<!-- ENDIF -->">{DS_OPPONENT_NAME} <!-- IF {DS_OPPONENT_ONLINE} --><small class="text-success">online</small><!-- ENDIF -->
                  <small class="pull-right">{DS_TIME_AGO}</small>
                  <br />
								  <small><!-- IF {DS_FROM_USER_ID} != {PHP.usr.id} --><i class="icon-bullhorn"></i>  <!-- ELSE --><!-- IF !{DS_STATUS} --><i class=" icon-ok"></i>  <!-- ENDIF --><!-- ENDIF -->{DS_TEXT}</small></div>
							</td>
						</tr>
<!-- END: DS_ROW -->
						</tbody>
					</table>
			</div>
<!-- END: MAIN -->