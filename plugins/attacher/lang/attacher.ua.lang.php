<?php
/**
 * Attacher plugin: русский перевод
 *
 * @package Attacher
 * @author Roffun
 * @copyright Copyright (c) Roffun, 2018 - 2019 | https://github.com/Roffun
 * @license BSD License
 **/

defined('COT_CODE') or die('Wrong URL');

$L['info_name'] = 'Завантаження зображень та файлів';
$L['info_desc'] = 'Прикріплення файлів, генерація різних размірів и обробка «на льоту» зображень в статтях, вставка в візуальний редактор';

/**
* КОНФИГУРАЦИЯ
*/
$L['cfg_folder'] = 'Директорія для файлів';
$L['cfg_prefix'] = 'Префікс імен файлів';
$L['cfg_exts'] = 'Дозволені типи файлів (через кому, без точок та пробілів)';
$L['cfg_items'] = 'Макс. кількість вкладень у кожному повідомленні';
$L['cfg_accept'] = array('Допустимі MIME-типи у вікні вибору файлів, через кому.', 'Порожнє значення припускає всі типи. Можна використовувати спеціальні типи: image/*, audio/*, video/*');
$L['cfg_filesize'] = 'Макс. розмір файлів у байтах';
$L['cfg_chunkSize'] = array('Завантажувати файли чанками (байт)', 'Великі файли можуть бути завантажені невеликими частинами.
    Це дозволяє завантажувати файли більшого розміру, ніж зазначено в обмеження на завантаження файлів через $_POST.
    (Залиште порожнім для вимкнення)');
    $L['cfg_filespace'] = 'Загальний дисковий простір для кожного користувача';
    $L['cfg_autoupload'] = 'Починати закачування автоматично';
$L['cfg_sequential'] = 'Послідовне завантаження замість паралельного';

/**
* НАСТРОЙКА ЗАГРУЗКИ ИЗОБРАЖЕНИЙ
*/
$L['cfg_sep_orig'] = 'НАЛАШТУВАННЯ ЗАВАНТАЖЕННЯ ЗОБРАЖЕНЬ';
$L['cfg_img_resize'] = array('Зменшувати завантажені зображення', 'Зображення, що завантажуються, будуть пропорційно зменшені
     у відповідності з наступними параметрами');
$L['cfg_img_maxwidht']  = 'Зменшувати ширину зображення до';
$L['cfg_img_maxheight'] = 'Зменшувати висоту зображення до';
$L['cfg_imageconvert'] = 'Конвертувати всі зображення в JPG при завантаженні';
$L['cfg_quality'] = 'Якість JPEG в %';

/**
* НАСТРОЙКА СОЗДАНИЯ КОПИЙ (миниатюр)
*/
$L['cfg_sep_thumbs'] = 'НАЛАШТУВАННЯ СТВОРЕННЯ КОПІЙ (мініатюр)';
$L['cfg_thumbs'] = 'Показувати мініатюри зображень?';
$L['cfg_upscale'] = 'Збільшувати зображення, які менші за розміри мініатюри';
$L['cfg_thumb_x'] = 'Ширина мініатюри за замовчуванням';
$L['cfg_thumb_y'] = 'Висота мініатюри за замовчуванням';
$L['cfg_thumb_framing'] = 'Режим кадрування мініатюри за замовчуванням';
$L['cfg_thumb_framing_params'] = array(
    'height' => 'По висоті',
    'width'  => 'По ширині',
    'auto'   => 'Авто',
    'crop'   => 'Кадрувати'
);
$L['cfg_thumb_big_width'] = 'Ширина великої мініатюри';
$L['cfg_thumb_big_height'] = 'Висота великої мініатюри';
$L['cfg_thumb_big_framing'] = 'Метод обрізки великої мініатюри';

/**
* ВОДЯНОЙ ЗНАК И ФОНОВАЯ ТЕКСТУРА
*/
$L['cfg_sep_wmark_bg'] = 'ВОДЯНИЙ ЗНАК І ФОНОВА ТЕКСТУРА';
$L['cfg_thumb_watermark'] = array('Водяний знак для мініатюр', 'Шлях до водяного знака. Підтримуються png із прозорістю.
     (Залишіть порожнім, щоб не ставити водяні знаки)');
$L['cfg_thumb_wm_x'] = array('Водяний знак. мін. ширина', 'Водяний знак буде поставлений на мініатюру лише якщо її ширина більше заданої');
$L['cfg_thumb_wm_y'] = array('Водяний знак. мін. висота', 'Водяний знак буде поставлений на мініатюру лише якщо її висота
     більше заданої');
$L['cfg_bg_image'] = 'Шлях до файлу фонової текстури';
$L['cfg_bg_space'] = 'Розмір відступу для заповнення текстурою';
$L['cfg_bg_space_hint'] = '0 для відключення';

/**
* ОБРАБОТКА «НАЛЕТУ» В СТАТЬЯХ
*/
$L['cfg_sep_replacement'] = 'ОБРОБКА «НА ЛІТУ» У СТАТТЯХ';
$L['cfg_thumb_clickable'] = 'Як виводити зображення у статтях';
$L['cfg_thumb_clickable_params'] = 'За умовчанням,Все посиланням,Всі зображеннями';
$L['cfg_thumb_alt_to_title'] = array('Створити title для посилань із вмісту alt','<i>працює лише при увімкненому режимі виведення посиланням</i>');
$L['cfg_thumb_strip_style'] = 'Вирізати атрибут style у зображень';
$L['cfg_thumb_to_picture'] = 'Перетворити всі зображення на адаптивний PICTURE';
$L['cfg_thumb_wrapper'] = 'Створити контейнер (span)';
$L['cfg_thumb_wrapper_class'] = 'Імена класів для контейнера span';

$L['att_add'] = 'Додати файли';
$L['att_attach'] = 'Прикріпити файли';
$L['att_attachment'] = 'Прикріплений файл';
$L['att_attachments'] = 'Вкладення';
$L['att_cancel'] = 'Скасувати закачування';
$L['att_cleanup'] = 'Прибирання';
$L['att_allthumbs_remove'] = 'Видалити всі мініатюри';
$L['att_cleanup_confirm'] = 'Це видаляє всі файли, прикріплені до існуючих повідомлень. Продовжити?';
$L['att_allthumbs_remove_confirm'] = 'Це видаляє всі створені мініатюри зображень, вони автоматично згенеруються з оригіналу у процесі звернення. Продовжити?';
$L['att_delete'] = 'Видалити';
$L['att_downloads'] = 'Завантаження';
$L['att_ensure'] = 'Ви впевнені?';
$L['att_free'] = 'вільно';
$L['att_filename'] = 'Назва файлу';
$L['att_gallery'] = 'Галерея';
$L['att_processing'] = 'Обробка';
$L['att_info'] = 'Інформація';
$L['att_item'] = 'Елемент';
$L['att_items_removed'] = 'Елементів видалено';
$L['att_thumbs_removed'] = 'Мініатюри видалені';
$L['att_kb'] = 'КБ';
$L['att_kb_left_of'] = 'КБ залишилося, файли не більше';
$L['att_maxsize'] = 'макс. розмір файлу';
$L['att_of'] = 'з';
$L['att_remove_all'] = 'Видалити всі';
$L['att_replace'] = 'Замінити';
$L['att_show_info'] = 'Показати інформацію про елемент';
$L['att_size'] = 'Розмір';
$L['att_slideshow'] = 'Слайдшоу';
$L['att_start'] = 'Почати';
$L['att_start_upload'] = 'Почати завантаження';
$L['att_title'] = 'Назва';
$L['att_title_here'] = 'Помістіть назву тут';
$L['att_total'] = 'всього';
$L['att_type'] = 'Тип';
$L['att_used'] = 'використано';
$L['att_user'] = 'Користувач';
$L['att_your_space'] = 'Ваш простір';
$L['att_drag_here'] = 'Перетягніть файли сюди';
$L['att_check'] = 'Відзначити';
$L['att_check_all'] = 'Відзначити все';

// Ошибки
$L['att_err_db'] = 'Помилка бази даних';
$L['att_err_delete'] = 'Неможливо видалити вкладення';
$L['att_err_move'] = 'Неможливо перемістити завантажений файл';
$L['att_err_noitems'] = 'Не знайдено жодного елемента';
$L['att_err_nospace'] = 'Недостатньо персонального дискового простору';
$L['att_err_perms'] = 'У вас недостатньо прав для цієї дії';
$L['att_err_replace'] = 'Неможливо замінити файл';
$L['att_err_thumb'] = 'Неможливо створити перегляд зображення';
$L['att_err_title'] = 'Назва файлу залишена порожньою';
$L['att_err_toobig'] = 'Файл занадто великий';
$L['att_err_type'] = 'Такий тип файлів не дозволено';
$L['att_err_upload'] = 'Неможливо завантажити файл';
$L['att_err_count'] = 'Перевищено максимальну кількість файлів';

$L['att_button_small_title'] = cot::$cfg['plugin']['attacher']['thumb_x'] . '*' . cot::$cfg['plugin']['attacher']['thumb_y'];
$L['att_button_big_title'] = cot::$cfg['plugin']['attacher']['thumb_big_width'] . '*' . cot::$cfg['plugin']['attacher']['thumb_big_height'];
$L['visual_only'] = 'Вставка доступна у візуальному режимі, вийдіть із режиму коду!';