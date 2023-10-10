<!-- BEGIN: MAIN -->
<script>
  function quotemsg(elmnt) {
    $('textarea[name="newpmtext"]').val($('textarea[name="newpmtext"]').val() + "<blockquote>" + $('#'+elmnt).find('.msgtoquote').text().trim() + "</blockquote>\n");
  }
</script>
 <div class="breadcrumb">{DS_PAGETITLE}</div>  
			<div>
          <div id="scroll_h" class="ds_scroll" style="margin: 0px auto; max-width: 50%;">       
					<table class="cells" width="100%" border="0" cellspacing="0" cellpadding="0">
           <tbody id="formsg_h">
<!-- BEGIN: DS_ROW -->
   <!-- IF {DS_ROW_USER_ID} != {PHP.usr.id} -->
						<tr id="{DS_ROW_ID}" class="msgread">              
							<td class="dialogmsg">
              	<div class="ds_avatar pull-left" style="width: 55px;">{DS_ROW_USER_AVATAR}</div>
              <div class="pull-left" style="width: calc(100% - 55px);">
              <div style="margin-bottom: 2px;">
              <small><span class="msgcheck pull-right">
               <!-- IF !{FILE_ROW_URL} -->
               <a class="msgquote small" style="cursor:pointer" onclick="quotemsg('{DS_ROW_ID}')">Цитировать</a>
               <!-- ENDIF --> 
               {DS_ROW_DATE}</small>
              </span>
               {DS_ROW_USER_NAME}
               <div class="clearfix"></div>                    
               </div>
               <div class="msgtoquote">
                {DS_ROW_TEXT}
                <!-- IF {FILE_ROW_URL} -->
                <!-- IF {FILE_ROW_EXT} != 'jpg' AND {FILE_ROW_EXT} != 'png' AND {FILE_ROW_EXT} != 'jpeg' AND {FILE_ROW_EXT} != 'bmp' -->                 
                 <span class="pull-right"><i class="icon-download-alt"></i> <a href="{FILE_ROW_URL}" target="blank">{FILE_ROW_TITLE}</a></span>
                 <!-- ELSE -->
                 <div class="clearfix"></div>
                 <a href="{FILE_ROW_URL}" target="_blank"><img src="{FILE_ROW_URL}" style="max-width: 20%;float:left;"/></a>
                 <!-- ENDIF -->                 
                <!-- ENDIF -->
                </div>
                </div>
              </td>
						</tr>
      <!-- ELSE -->
      	<tr id="{DS_ROW_ID}" <!-- IF !{DS_ROW_STATUS} -->class="msgread"<!-- ELSE -->class="lastunread"<!-- ENDIF -->>              
							<td class="dialogmsg">
                <div class="pull-left" style="width: calc(100% - 55px);">
              <div style="margin-bottom: 2px;">
              <span class="msgcheck pull-left">
              <small>{DS_ROW_DATE} <i<!-- IF !{DS_ROW_STATUS} --> class="icon-ok"<!-- ENDIF -->></i>
               <!-- IF !{FILE_ROW_URL} -->
               <a class="msgquote small" style="cursor:pointer" onclick="quotemsg('{DS_ROW_ID}')">Цитировать</a>
               <!-- ENDIF -->
               </small>  
              </span>
              <span class="pull-right" style="text-align: right;margin-right: 5px;">
               {DS_ROW_USER_NAME}
               </span>
               <div class="clearfix"></div>     
               </div>
               <div class="msgtoquote" style="text-align: right;padding-right: 5px;">
                {DS_ROW_TEXT}
                <!-- IF {FILE_ROW_URL} -->
                <!-- IF {FILE_ROW_EXT} != 'jpg' AND {FILE_ROW_EXT} != 'png' AND {FILE_ROW_EXT} != 'jpeg' AND {FILE_ROW_EXT} != 'bmp' -->                 
                 <span class="pull-left"><i class="icon-download-alt"></i> <a href="{FILE_ROW_URL}" target="_blank">{FILE_ROW_TITLE}</a></span>
                 <!-- ELSE -->
                 <div class="clearfix"></div>
                 <a href="{FILE_ROW_URL}" target="_blank"><img src="{FILE_ROW_URL}" style="max-width: 20%;float:right;"/></a>
                 <!-- ENDIF -->                 
                <!-- ENDIF -->
                </div>
               </div>
              <div class="ds_avatar pull-left" style="width:55px;">{DS_ROW_USER_AVATAR}</div>
              </td>
						</tr>
      <!-- ENDIF -->
<!-- END: DS_ROW -->
          </tbody>
				 </table>       
				</div>
				<form action="{DS_FORM_SEND}" enctype="multipart/form-data" method="post" id="dialogform_h" data-dialog-id="{DIALOG_ID}" class="ds_form">
         <textarea name="newpmtext" id="newpmtext_h"></textarea>
            <input id="dialogbutton_h" class="pull-right btn hide" type="submit" value="{PHP.L.Reply}"/>
				</form> 

<div style="margin: 0px auto; max-width: 50%;">
 <div id="hideform_h" style="cursor:pointer" onclick="$('#hideform_h').toggle();$('#showform_h').toggle();">        
  <i class="icon-upload"></i> Загрузить файл                  
 </div>

 <div id="showform_h" style="display:none">
  <form name="sndfrm_h" action="{DS_FORM_SEND}" method="post" target="hfrm_h" enctype="multipart/form-data">
   <input name="msgfile" id="dsfile_h" type="file"/>
   <input type="submit" id="dsfilebtn_h" class="btn" value="Загрузить" />
  </form>
 </div> 
  <iframe id="hfrm_h" name="hfrm_h" style="width:0px;height:0px;border:0px"></iframe>
</div>     
	
</div>
<!-- END: MAIN -->