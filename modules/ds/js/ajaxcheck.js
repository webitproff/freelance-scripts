$(document).ready(function(){
    var ds_unfocus_chk = false;
    $(window).blur(function() {
      ds_unfocus_chk = true;
    });
    $(window).focus(function() {
      ds_unfocus_chk = false;
    });

    var ds_titles_chk = ['* У вас новое сообщение!', document.title],
        ds_original_att_i_chk = 0,
        ds_focusTimer_chk = false;
    function getAttention_chk() {            //при не активном окне, будем показывать в title что у вас новое сообщение
       if(typeof ds_focusTimer == "undefined" && document.getElementById('scroll_h') == null) {
          ds_focusTimer_chk = setInterval(function() {
            document.title = ds_titles_chk[ds_original_att_i_chk++ % 2];
          }, 1000);
       }
    }

    $(window).bind('focus', function() {
      if(ds_focusTimer_chk) {
        clearInterval(ds_focusTimer_chk);
        ds_focusTimer_chk = false;
        document.title = ds_titles_chk[1];
        stop();
      }
    });

    function updatecountmsg() {
    $.ajax({
        type: 'GET',
        url: 'index.php?e=ds&m=count',
        success: function (data) {
            if (data) {
              if (data && data != $('#dscountnewmsgs').html())
              {              
                $('#dscountnewmsgs').html(data);
                console.log(ds_unfocus_chk);
                if (data != 'Личных сообщений нет' && ds_unfocus_chk) {  //уведомление в title
                    getAttention_chk();
                }
              }
              update_count_timer();
            }
        }
    }) 
    }
    
    var timerss;
    function update_count_timer() {
        if (timerss)
            clearTimeout(timerss);
        timerss = setTimeout(function () {
            updatecountmsg();
        }, 5000);
    }
    update_count_timer();
    updatecountmsg();
}); 