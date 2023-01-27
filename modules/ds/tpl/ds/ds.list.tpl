<!-- BEGIN: MAIN -->
<!-- IF {PHP.usr.id} == 0 --> 
 {PHP|cot_url('login')|cot_redirect()} 
<!-- ENDIF --> 
<div class="uk-section uk-background-primary" uk-height-viewport="min-height: 400">
	<div class="uk-container uk-margin">
				<div class="uk-card uk-card-small uk-card-body uk-background-default uk-border-rounded uk-margin-small-top">
					<div class="uk-margin-top">
					<!-- IF {PHP.usr.messages} > 0 -->
						<div>
							<h4 class="uk-heading-divider uk-margin-remove"><span class="uk-link-text">Сейчас у вас сообщений не прочитано: </span><span class="uk-margin-small-left uk-label uk-label-success">{PHP.usr.messages}</span></h4>
						</div>
					<!-- ELSE -->
						<div>
							<h4 class="uk-heading-divider uk-margin-remove"><span class="uk-label uk-margin-small-left">0</span><span class="uk-link-text">новых сообщений</span></h4>
						</div>
					<!-- ENDIF -->	
					</div>
					<hr class="uk-divider-icon">

	<!-- BEGIN: DS_ROW -->
	<ul class="uk-comment-list">
		<li class="dialoghover uk-card uk-background-muted uk-card-body uk-card-small uk-border-rounded">
			<div class="uk-panel-body dialog_body" onclick="window.location='{DS_DIAOG_URL}'">
				<div class="uk-grid" data-uk-grid-margin="">
					<div class="uk-width-2-10">
                <!-- IF {DS_OPPONENT_AVATAR_SRC} -->
                <img class="avatar uk-border-circle" width="50" height="50" alt="" src="{DS_OPPONENT_AVATAR_SRC}">
                <!-- ELSE -->
                <img class="avatar uk-border-circle" width="50" height="50" alt="" src="themes/{PHP.theme}/img/avatar.png">
                <!-- ENDIF -->
					</div>
					<div class="uk-width-8-10">
						<h4 class="uk-margin-remove" data-uk-tooltip="{pos:'top-left'}" title="Смотреть профиль пользователя">{DS_OPPONENT_NAME} <!-- IF {DS_OPPONENT_ONLINE} --><small class="uk-text-success">online</small><!-- ENDIF --></h4>
						<p data-uk-tooltip="{pos:'top-left'}" title="Открыть переписку" class="uk-margin-top-remove<!-- IF {DS_STATUS} --> uk-text-muted<!-- ELSE --> uk-text-primary<!-- ENDIF -->">{DS_TEXT}</p>{DS_TIME_AGO}
					</div>
				</div>
			</div>
		</li>
	</ul>
	<!-- END: DS_ROW -->
	</div>
</div>
<!-- END: MAIN -->