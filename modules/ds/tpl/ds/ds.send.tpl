<!-- BEGIN: MAIN -->
<!-- IF {PHP.usr.id} == 0 --> 
 {PHP|cot_url('login')|cot_redirect()} 
<!-- ENDIF --> 

<div class="uk-section uk-background-muted"> 
	<div class="uk-container uk-container-expand uk-width-1-2@m" uk-height-viewport="expand: true">

		<div id="ajaxBlock">

      
			<div class="chat-panel-body  uk-panel uk-border-rounded-mdm uk-margin-bottom uk-position-relative uk-background-default">
			<div class="uk-card uk-card-small uk-card-body">
			   	<div class="uk-flex-middle uk-grid">
					<div class="uk-width-1-4 uk-flex-middle">
					<div class="uk-margin-top uk-width-1-1 uk-text-center">
					<img class="avatar uk-border-circle" src="{DSSEND_TOUSER_AVATAR_SRC}" alt="" width="50" height="50">
					</div>
					</div>
					<div class="uk-width-3-4 ">
					<div class="uk-margin-top uk-width-1-1">
					<p class="uk-margin-bottom-remove">Вы отправляете новое сообщение для: 
					<span class="uk-margin-top-remove">{DSSEND_TOUSER_NAME}</span></p>
					</div>
				</div>
				</div>
				<form enctype="multipart/form-data" class="uk-form" action="{DSSEND_FORM_SEND}" method="post" name="newmessage" id="mewmessage">


			<div class="uk-margin">
				<textarea placeholder="Введите сообщение" class="uk-border-rounded-mdm uk-width-1-1 uk-textarea" name="newpmtext" rows="8" cols="56"></textarea>
			</div>
			<div class="uk-margin">
											{PHP.L.File}:
							<input name="msgfile" type="file"/>
			</div>
        <div class="uk-margin uk-text-center">
            <button type="submit" tabindex="0" class="uk-button uk-button-linear uk-animation-toggleuk-button uk-button-chat "><span uk-icon="mail" class="uk-margin-small-right uk-animation-shake"></span><span class="uk-text-middle">Отправить</span></button>
        </div>


				</form>

			</div>
			</div>

		</div>

	</div>
</div>
<!-- END: MAIN -->