<!-- BEGIN: MAIN -->


		<div id="ajaxBlock">

      <div class="breadcrumb">{DSSEND_TITLE}</div>
			<div class="block">
				<form action="{DSSEND_FORM_SEND}" method="post" name="newmessage" id="mewmessage" enctype="multipart/form-data">
					<table class="table">
						<tr>
							<td class="width20">{PHP.L.Recipient}:</td>
							<td>
							  <span class="ds_avatar">{DSSEND_TOUSER_AVATAR}</span> {DSSEND_TOUSER_NAME}
							</td>
						</tr>
						<tr>
							<td>{PHP.L.Message}:</td>
							<td>{DSSEND_FORM_TEXT}</td>
						</tr>
						<tr>
							<td>{PHP.L.File}:</td>
							<td><input name="msgfile" type="file"/></td>
						</tr>
						<tr>
              <td>&nbsp;</td>
							<td colspan="2"><button class="btn btn-primary btn-small" type="submit">{PHP.L.Submit}</button></td>
						</tr>
					</table>
				</form>
			</div>


		</div>


<!-- END: MAIN -->