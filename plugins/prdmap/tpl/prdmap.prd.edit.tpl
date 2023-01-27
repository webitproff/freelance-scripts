<!-- BEGIN: MAIN -->
  <div class="input-group">
    <span id="prdmap_adrpre" class="input-group-addon">{PHP.item.item_city|cot_getcity($this)}<!-- ELSE -->Выберите город<!-- ENDIF --></span>
    <input id="prdmap_adrinput" value="{ADR}" type="text" class="form-control" placeholder="Введите адрес или перетащите метку">
  </div>

  <input name="ritemprdmap" value="{INPUT_VAL}" type="hidden">
    <br>
  <div id="map-canvas"></div>

{MAIN_SCRIPT}
<style>#map-canvas { width:100%;height:300px }</style>
<!-- END: MAIN -->