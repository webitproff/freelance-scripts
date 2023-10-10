<!-- BEGIN: MAIN -->


      
<div class="uk-card uk-card-default uk-border-rounded">
<!-- IF !{AJAX_MODE} -->
	<div class="uk-position-center uk-position-z-index"><h3 class="uk-card-title">{MESSAGE_TITLE}</h3>
	<div id="main" class="uk-modal-dialog uk-modal-body uk-margin-auto-vertical">
<!-- ENDIF -->		
		<div class="uk-card-body">
			<h3 class="uk-text-secondary">{MESSAGE_BODY}</h3> 
			<p class="uk-margin-medium-bottom uk-text-bold uk-text-warning">Отменить операцию не будет возможным</p>
<!-- BEGIN: MESSAGE_CONFIRM -->
			<div id="msgbox" class="uk-child-width-expand@s uk-grid-large" uk-grid>
				<div>
					<a id="confirmYes" href="{MESSAGE_CONFIRM_YES}" class="confirmButton uk-button uk-button-warning uk-width-1-1">{PHP.L.Yes}</a>
				</div>
				<div>
					<a id="confirmNo" href="{MESSAGE_CONFIRM_NO}" class="confirmButton uk-button uk-button-default uk-width-1-1">{PHP.L.No}</a>
				</div>
			</div>

<!-- END: MESSAGE_CONFIRM -->
		</div>
<!-- IF !{AJAX_MODE} -->				
	</div>
	</div>
<!-- ENDIF -->	

    </div>


<!-- END: MAIN -->
			<div id="msgbox" class="clearfix">
				<div><a id="confirmYes" href="{MESSAGE_CONFIRM_YES}" class="confirmButton uk-button uk-button-warning">{PHP.L.Yes}</a></div>
				<div><a id="confirmNo" href="{MESSAGE_CONFIRM_NO}" class="confirmButton  uk-button uk-button-default">{PHP.L.No}</a></div>
			</div>


