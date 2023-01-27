$(document).ready(function() {

    ion.sound({
        sounds: [{
            name: "incom_massage",
        }, ],
        volume: 1,
        path: "modules/ds/audio/",
        preload: true,
        loop: false,
        multiplay: true,
    });

    var scroll_h = document.getElementById('scroll_h'); //получаем элемент прокрутки окна сообщений
    var chat_h = $('#formsg_h'); //получаем ефблиу для записи новых сообщений
    var form_h = $('#dialogform_h'); //получаем форму
    var chatid_h = $(form_h).attr('data-dialog-id'); // получаем id чаата

    var ds_unfocus = false;
    $(window).blur(function() {
      ds_unfocus = true;
    });
    $(window).focus(function() {
      ds_unfocus = false;
    });

    if(scroll_h != null) $(scroll_h).scrollTop(scroll_h.scrollHeight+1000);

    // при нажатии на enter отправляем сообщение
    $('#newpmtext_h').keydown(function(e) {
        e.stopPropagation();
        if (e.keyCode == 13) {
            if (e.shiftKey) {
                $('#newpmtext_h').val() = $('#newpmtext_h').val() + '\n';
            } else {
                e.preventDefault();
                $('#dialogbutton_h').click();
            }
        }
    });

    // вешаем обработчик на отправку формы
    $('#dialogbutton_h').click(function(e) {
        e.preventDefault();
        var send_data = $('#dialogform_h').serialize(); //формируем данные для отправки
        var text = $(form_h).find('textarea[name="newpmtext"]'); //получаем текст
        e.preventDefault(); //отменяем действие кнопки
        $(form_h).find('input').attr("disabled", true); //блокируем кнопку отправки во время отправки
        sendmsg_h(text, send_data); //отправляем текст
        return false; //обязательно

        function sendmsg_h(text, send_data) {
            var url = $(form_h).attr('action');
            $.ajax({
                type: 'POST',
                url: url,
                processData: 'false',
                cash: 'false',
                data: send_data,
                // НАЧАЛО ПРОВЕРКИ ПЕРЕД ОТПРАВКОЙ
                beforeSend: function() {
                    updatemsg_h();
                },
                // КОНЕЦ
                success: function(data) {
                    if (data) {
                        if (text) {
                            $(chat_h).find('tr[id=error]').hide(); //скрываем ошибку(если до этого была неудачная отправка)
                            $(chat_h).append(data).find('tr:last-child').fadeIn('slow');
                            $(text).val('').focus();
                            $(scroll_h).scrollTop(scroll_h.scrollHeight+1000);
                        }
                    }
                    $(form_h).find('input').attr("disabled", false);
                }
            })
        }
    });

    var ds_titles = ['* У вас новое сообщение!', document.title],
        ds_original_att_i = 0,
        ds_focusTimer = false;
    function getAttention() {            //при не активном окне, будем показывать в title что у вас новое сообщение
       if(typeof ds_focusTimer_chk == "undefined") {
          ds_focusTimer = setInterval(function() {
            document.title = ds_titles[ds_original_att_i++ % 2];
          }, 1000);
       }
    }

    $(window).bind('focus', function() {
      if(ds_focusTimer) {
        clearInterval(ds_focusTimer);
        ds_focusTimer = false;
        document.title = ds_titles[1];
        stop();
      }
    });

    function updatemsg_h() { //функция обновления сообщений
      if(chatid_h > 0) {
        var arraymsg_h = '';
        $('#formsg_h tr').each(function() {
            if (!$(this).hasClass('msgread') && $(this).attr('id') != 'error') {
                arraymsg_h = (arraymsg_h != '') ? arraymsg_h + ',' : arraymsg_h;
                arraymsg_h = arraymsg_h + $(this).attr('id');
            }
        });
        var url = 'index.php?e=ds&m=ajax&a=update&chat=' + chatid_h + '&checkmsg=' + arraymsg_h;
        $.getJSON(url).done(function(data) {
            if (data[0]) {
                $(chat_h).append(htmlspecialchars_decode_h(data[1]));
                $(scroll_h).scrollTop(scroll_h.scrollHeight+1000);
                if (ds_unfocus) {  //уведомление в title
                    getAttention();
                }
                ion.sound.play("incom_massage");
            }
            if (data[3] > 0) {
                for (var i = 0; i < data[4].length; i++) {
                    $('#' + data[4][i]).addClass('msgread')
                    $('#' + data[4][i]).find('.msgcheck').find('i').addClass('icon-ok');
                }
            }
            $(form_h).find('input').attr("disabled", false);
        })
        update_timer_h();
      }
    }

    function htmlspecialchars_decode_h(string) {
        var e = document.createElement('div');
        e.innerHTML = string;
        try {
            var res = e.childNodes[0].nodeValue;
        } catch (e) {
            return string;
        }
        if (res === null) {
            return string;
        }
        return res;
    }


    var iframe_h = document.getElementById('hfrm_h');

    if(iframe_h != null) iframe_h.onload = function() {
        $(chat_h).find('tr[id=error]').hide();
        $(chat_h).append($("#hfrm_h").contents().find('tbody').html()).find('tr:last-child').fadeIn('slow');
        $(scroll_h).scrollTop(scroll_h.scrollHeight+1000);
        $('#dsfile_h').remove();
        $("#showform_h").children().prepend('<input name="msgfile" id="dsfile_h" type="file"/>');
    };

    $('#dsfilebtn_h').click(function() {
        $('#hideform_h').toggle();
        $('#showform_h').toggle();
    });

    var timer_h; //таймер для обновления сообщений
    function update_timer_h() {
        clearTimeout(timer_h);
        timer_h = setTimeout(function() {
            updatemsg_h();
        }, 5000); //5000 = 5 сек заержки между запросом, это рекомендуемое значение.
    }

    update_timer_h();
    updatemsg_h();
});