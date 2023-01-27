<!-- BEGIN: MAIN -->
<!-- IF {PHP.usr.id} == 0 --> 
 {PHP|cot_url('login')|cot_redirect()} 
<!-- ENDIF --> 

<div class="uk-section uk-background-muted"> 
	<div class="uk-container uk-container-expand uk-width-1-2@m" uk-height-viewport="expand: true">
		<script>
		  function quotemsg(elmnt) {
			$('textarea[name="newpmtext"]').val($('textarea[name="newpmtext"]').val() + "<blockquote>" + $('#'+elmnt).find('.msgtoquote').text().trim() + "</blockquote>\n");
		  }
		</script>

			<div class="chat-panel-body uk-tile uk-tile-default uk-box-shadow-large uk-border-rounded"><h3 class="uk-margin uk-heading-line uk-text-center"><span>{PHP.out.subtitle}<!-- IF {DS_USER_AVATAR_SRC} --><img class="avatar uk-border-circle" width="50" height="50" alt="" src="{DS_USER_AVATAR_SRC}"><!-- ELSE --><img class="avatar uk-border-circle" width="50" height="50" alt="" src="themes/{PHP.theme}/img/avatar.png"><!-- ENDIF --></span></h3>

          <div id="scroll_h">     
					
<ul  id="formsg_h" class="uk-list">           
<!-- BEGIN: DS_ROW -->
   <!-- IF {DS_ROW_USER_ID} != {PHP.usr.id} -->
    <li>
   <div id="{DS_ROW_ID}" class=" uk-border-rounded-mdm uk-card uk-card-small uk-card-body uk-background-mne msgread">
     <div class="dialogmsg">
       <div class="uk-flex-middle" uk-grid>
         <div class="uk-width-1-6 uk-flex-middle">
           <!-- IF {DS_ROW_USER_AVATAR_SRC} -->
           <img class="avatar uk-border-circle" width="50" height="50" alt="" src="{DS_ROW_USER_AVATAR_SRC}">
           <!-- ELSE -->
           <img class="avatar uk-border-circle" width="50" height="50" alt="" src="themes/{PHP.theme}/img/avatar.png">
           <!-- ENDIF -->
         </div>
         <div class="uk-width-5-6">
           <div class="uk-margin-top uk-width-1-1 chat-messages chat-msg-user">
             <small>
               <span class="msgcheck">
                 <!-- IF !{FILE_ROW_URL} -->
                 <a class="msgquote small" style="cursor:pointer" onclick="quotemsg('{DS_ROW_ID}')">Цитировать</a>
                 <!-- ENDIF --> {DS_ROW_DATE} </small>
             </span> {DS_ROW_USER_NAME} <div class="msgtoquote"> {DS_ROW_TEXT}
               <!-- IF {FILE_ROW_URL} -->
               <!-- IF {FILE_ROW_EXT} != 'jpg' AND {FILE_ROW_EXT} != 'png' AND {FILE_ROW_EXT} != 'jpeg' AND {FILE_ROW_EXT} != 'bmp' -->
               <span class="pull-right">
                 <i class="icon-download-alt"></i>
                 <a href="{FILE_ROW_URL}" target="blank">{FILE_ROW_TITLE}</a>
               </span>
               <!-- ELSE -->
               <div class="uk-clearfix"></div>
               <a href="{FILE_ROW_URL}" target="_blank">
                 <img src="{FILE_ROW_URL}" style="max-width: 20%;float:left;" />
               </a>
               <!-- ENDIF -->
               <!-- ENDIF -->
             </div>
           </div>
         </div>
       </div>
     </div>
   </div>
	</li>
	<!-- ELSE -->
    <li>
      	<div id="{DS_ROW_ID}" 
		<!-- IF !{DS_ROW_STATUS} -->class="msgread uk-border-rounded-mdm uk-card uk-card-small uk-card-body uk-background-ya"
      	  <!-- ELSE -->class="lastunread"
      	  <!-- ENDIF -->> 
		  <div class="dialogmsg">
      	    <div class="uk-flex-middle" uk-grid>
      	      <div class="uk-width-5-6 uk-row-first">
      	        <div class="uk-margin-top uk-width-1-1 chat-messages chat-msg-my">
      	          <span class="msgcheck pull-left">
      	            <small>{DS_ROW_DATE} <!-- IF !{DS_ROW_STATUS} --> <span class="uk-text-success" uk-icon="icon: check"></span>
      	                <!-- ENDIF -->
      	              </i>
      	              <!-- IF !{FILE_ROW_URL} -->
      	              <a class="msgquote small" style="cursor:pointer" onclick="quotemsg('{DS_ROW_ID}')">Цитировать</a>
      	              <!-- ENDIF -->
      	            </small>
      	          </span>
      	          <div class="msgtoquote " style="text-align: right;padding-right: 5px;"> {DS_ROW_TEXT}
      	            <!-- IF {FILE_ROW_URL} -->
      	            <!-- IF {FILE_ROW_EXT} != 'jpg' AND {FILE_ROW_EXT} != 'png' AND {FILE_ROW_EXT} != 'jpeg' AND {FILE_ROW_EXT} != 'bmp' -->
      	            <span class="pull-left">
      	              <i class="icon-download-alt"></i>
      	              <a href="{FILE_ROW_URL}" target="_blank">{FILE_ROW_TITLE}</a>
      	            </span>
      	            <!-- ELSE -->
      	            <div class="uk-clearfix"></div>
      	            <a href="{FILE_ROW_URL}" target="_blank">
      	              <img src="{FILE_ROW_URL}" style="max-width: 20%;float:right;" />
      	            </a>
      	            <!-- ENDIF -->
      	            <!-- ENDIF -->
      	          </div>
      	        </div>
      	      </div>
      	      <div class="uk-width-1-6 uk-flex-middle uk-text-center">
      	        <!-- IF {DS_ROW_USER_AVATAR_SRC} -->
      	        <img class="avatar uk-border-circle" width="50" height="50" alt="" src="{DS_ROW_USER_AVATAR_SRC}">
      	        <!-- ELSE -->
      	        <img class="avatar uk-border-circle" width="50" height="50" alt="" src="themes/{PHP.theme}/img/avatar.png">
      	        <!-- ENDIF -->
				 {DS_ROW_USER_NAME} 
      	      </div>
      	    </div>
      	  </div>
      	</div>
	</li>
    <!-- ENDIF -->
</li>
<!-- END: DS_ROW -->
</ul>
      
				</div>
<form action="{DS_FORM_SEND}" enctype="multipart/form-data" method="post" id="dialogform_h" data-dialog-id="{DIALOG_ID}" class="uk-form ds_form">
    <fieldset class="uk-fieldset">

        <legend class="uk-legend">Введите ваше сообщение для отправки</legend>
        <div class="uk-margin">
            <textarea class="uk-border-rounded-mdm uk-width-1-1 uk-textarea" rows="5" placeholder="Введите сообщение" name="newpmtext" id="newpmtext_h"></textarea>
        </div>

        <div class="uk-margin uk-text-center">
            <button id="dialogbutton_h" type="submit" tabindex="0" class="uk-button uk-button-linear uk-animation-toggleuk-button uk-button-chat "><span uk-icon="mail" class="uk-margin-small-right uk-animation-shake"></span><span class="uk-text-middle">Отправить</span></button>
        </div>

    </fieldset>
</form> 

<div>
 <div id="hideform_h" style="cursor:pointer" onclick="$('#hideform_h').toggle();$('#showform_h').toggle();">        
  <span uk-icon="cloud-upload"></span>

 Загрузить файл                  
 </div>

 <div id="showform_h" style="display:none">
  <form name="sndfrm_h" action="{DS_FORM_SEND}" method="post" target="hfrm_h" enctype="multipart/form-data">
   <input name="msgfile" id="dsfile_h" type="file"/>
   <input type="submit" id="dsfilebtn_h" class="btn" value="Загрузить" />
  </form>
 </div> 
  <iframe id="hfrm_h" name="hfrm_h" style="width:0px;height:0px;border:00px"></iframe>
</div>     
	
</div>
	</div>
</div>
</div>
<!-- IF {PHP.usr.maingrp} == 5 OR {PHP.usr.isadmin} -->
<div class="uk-margin-remove-vertical uk-alert-primary" uk-alert>
    <a class="uk-alert-close" uk-close></a>
    <p>Расположение файла, формирующего шаблон страницы:</p>
	<div class="uk-panel uk-text-break uk-text-secondary">{PHP.mskin} => {PHP.env.type} => {PHP.env.ext} => {PHP.env.location} => </div>
</div>
<!-- ENDIF -->
<!-- END: MAIN -->