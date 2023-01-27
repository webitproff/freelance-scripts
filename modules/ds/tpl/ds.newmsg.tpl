<!-- BEGIN: MAIN -->
<!-- BEGIN: INBOX -->
						<tr id="{DS_ROW_ID}" class="msgread">              
							<td class="dialogmsg">
              	<div class="ds_avatar pull-left" style="width:55px;">{DS_ROW_USER_AVATAR}</div>
              <div class="pull-left" style="width: calc(100% - 55px);">
              <div style="margin-bottom: 2px;">
              <small><span class="msgcheck pull-right"><a class="msgquote small" style="cursor:pointer" onclick="quotemsg('{DS_ROW_ID}')">Цитировать</a> 
               {DS_ROW_DATE}</small>
              </span>
               {DS_ROW_USER_NAME}
               <div class="clearfix"></div>               
               </div>
               <div class="msgtoquote">
                {DS_ROW_TEXT}
                <!-- IF {FILE_ROW_URL} -->
                <!-- IF {FILE_ROW_EXT} != 'jpg' AND {FILE_ROW_EXT} != 'png' AND {FILE_ROW_EXT} != 'jpeg' AND {FILE_ROW_EXT} != 'bmp' -->                 
                 <span class="pull-left"><i class="icon-download-alt"></i> <a href="{FILE_ROW_URL}" target="blank">{FILE_ROW_TITLE}</a></span>
                 <!-- ELSE -->
                 <div class="clearfix"></div>
                 <a href="{FILE_ROW_URL}" target="_blank"><img src="{FILE_ROW_URL}" style="max-width: 20%;float:left;"/></a>
                 <!-- ENDIF -->                 
                <!-- ENDIF -->
                </div>
                </div>
              </td>
						</tr>
<!-- END: INBOX -->

<!-- BEGIN: OUTBOX -->
<!-- IF {FILE_ROW_URL} -->
	<table>
   <tbody>
<!-- ENDIF -->
      	<tr id="{DS_ROW_ID}">              
							<td class="dialogmsg">
                <div class="pull-left" style="width: calc(100% - 55px);">
              <div style="margin-bottom: 2px;">
              <span class="msgcheck pull-left">
              <small>{DS_ROW_DATE} <i></i>
              <!-- IF !{FILE_ROW_URL} -->
               <a class="msgquote" style="cursor:pointer" onclick="quotemsg('{DS_ROW_ID}')">Цитировать</a></small>
              <!-- ENDIF -->  
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
                 <span class="pull-left"><i class="icon-download-alt"></i> <a href="{FILE_ROW_URL}" target="blank">{FILE_ROW_TITLE}</a></span>
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
<!-- IF {FILE_ROW_URL} -->
	  </table>
  </tbody>
<!-- ENDIF -->
<!-- END: OUTBOX -->

<!-- BEGIN: ERROR -->
  <!-- IF {ERROR_FULL} == 1 -->
	<table>
   <tbody>
    <tr style="display:none" id="error">
    <td class="text-center">{ERROR_MSG}</td></tr>
	  </table>
  </tbody>
  <!-- ELSE -->
    <tr style="display:none" id="error">
    <td class="text-center">{ERROR_MSG}</td></tr>
  <!-- ENDIF -->
<!-- END: ERROR -->

<!-- END: MAIN -->