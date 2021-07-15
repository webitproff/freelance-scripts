# cot-Attacher-Roffun
# Плагин attacher from Roffun for CMF Cotonti Siena
Файлы: 🗃️ фото, изображения, документы и архивы zip, загрузить, прикрепить к статье, разместить для скачивания поможет плагин «Attacher» для Cotonti Siena. Плагин «Attacher» — это расширение под Cotonti, 🗃️ с помощью которого можно загружать файлы, прикреплять к страницам статей, сообщениям на форуме, выводить в виде списка для скачивания, галереи изображений, bb — кода, вставлять в визуальный редактор большую или маленькую миниатюру по клику.

«Attacher» — плагин для системы управления контентом сайта Cotonti Siena.
Особенности плагина attacher

Так как за основу плагина attacher был взят attach2 версии 2013 года, хотелось бы выразить благодарность тем кто изначально его создавал — Vladimir Sibirov (Trustmaser) & Cotonti Team.

    Code=attacher
    Name=Attacher
    Category=files-media
    Description=Attach files to posts and pages
    Version=1.0.1
    Date=2019-08-31
    Author=Roffun
    Copyright=Copyright (c) CmsCot.net, 2018 — TO THIS DAY & ABOVE. All rights reserved.

<h4><a href="https://github.com/webitproff/cot-Attacher-Roffun" target="_blank" rel="noopener noreferrer"><strong>скачать плагин</strong></a>.</h4>
<h4><a href="http://masterscity.abuyfile.com/" target="_blank" rel="noopener">Посмотреть как работает плагин на демо-сайте</a></h4>

Для интерфейса загрузчика используется jQuery File Upload, поэтому библиотека jQuery должна присутствовать. Загрузки подсчитываются и происходят с оригинальным именем файла, а включение опции «по-частям (чанками)» позволяет обойти ограничение на загрузку файла через $_POST в 2 мб.
Мультизагрузка, несложная интеграция в шаблон через функции обратного вызова (callback). Можно включить конвертирование в jpeg при загрузке, настроить обрезку оригинала до определенных размеров.
Создание большой и маленькой миниатюры, с возможностью настройки, пересоздание налету, несколько форм на странице, автоматическое создание кнопок для вставки изображений в редактор, которые подхватывают настройки размера, указанного в админке. В визуальный редактор вставляется только изображение, без необходимости дополнительных контейнеров, ссылок, или классов для подключения галерей. Всё остальное делается налету.
Настраиваемое наложение водяного знака, при изменении watermark, достаточно удалить все копии через админку плагина, и они пересоздадутся с новым водяным знаком.
Преобразование налету изображения в ссылку на себя, или наоборот, вырезание ссылки, создание адаптивного picture из большой миниатюры и маленькой, создание контейнера с возможностью указания классов для стилизации. И это без изменения кода, можно менять в любой момент на уровне настроек.
Специальный bb код для вставки в редактор, независимо от парсера который выбран.

# Системные требования и ограничения

Установленная Cotonti Siena актуального релиза (на момент публикации этой статьи — 0.9.19).
Рекомендуется PHP версии 7.1 и выше.
Плагин имеет отдельную базу данных, но при наличии работающих плагина attach2 или модуля file могут наблюдаться конфликты в работе, поэтому перед использованием плагина нужно приостановить работу вышеуказанных расширений.

# Установка плагина attacher

Скачать архив, распаковать. Переименовать папку с плагином в attacher. Её нужно разместить в корневой каталог plugins, где все плагины находятся.
Перейти в «Управление сайтом / Расширения / Загрузка изображений и файлов» и установить с помощью интерфейса.
После установки путь к папке для загрузки файлов по умолчанию будет: datas/attacher, нужно создать ее на сервере и выставить права (CHMOD) на запись, 777 или 755. Если будет использоваться другой каталог, то соответственно с ним проделать то же самое.
Остальные настройки по желанию, о них дальше по тексту.

# Конфигурация плагина attacher 
<blockquote>
Директория для файлов: 	путь к папке для загрузки файлов
	
Префикс имен файлов: 	приставка добавляемая к каждому файлу
	
Разрешенные типы файлов: 	типы файлов которые разрешено загружать
	
Макс. число вложений в каждом сообщении: 	сколько файлов можно прикрепить
	
Допустимые MIME-типы в окне выбора файлов: 	MIME-типы файлов, которые разрешены для загрузки
	
Загружать файлы чанками по (байт): 	Режим для обхода ограничения сервера на $_POST в 2 мб
	
Макс. размер файлов в байтах: 	ограничение на размер одного файла
	
Общее дисковое пространство на каждого пользователя: 	ограничение на совокупный размер файлов
	
Начинать закачку автоматически: 	если включено, то кнопки «начать» и «отменить» скрываются, закачка происходит автоматически
	
Последовательная загрузка вместо параллельной: 	выбор варианта загрузки файлов, поочередно или параллельно
	
Подключить CSS модуля/плагина: 	стили плагина для вывода в видимой части
	
Настройка загрузки изображений
	
Уменьшать загруженные изображения: 	Если включено, изображения будут уменьшены в соответствии с настройками ниже
	
Уменьшать ширину изображения до: 	Ширина до которой уменьшить
	
Уменьшать высоту изображения до: 	Высота до которой уменьшить
	
Конвертировать все изображения в JPG при закачке: 	Если включено, все загружаемые изображения будут преобразовываться в формат jpeg
	
Качество JPEG в %: 	Степень сжатия изображений формата jpeg
	
Настройка создания копий (миниатюр) 
	
Показывать миниатюры изображений?: 	если включено, то показываются
	
Увеличивать изображения, которые меньше размеров миниатюры: 	если изображение меньше чем размер для миниатюр, то при включении опции, они будут увеличиваться до указанного минимума 
	
Ширина миниатюры по умолчанию: 	ширина меньшей копии изображения
	
Высота миниатюры по умолчанию: 	высота меньшей копии изображения
	
Режим кадрирования миниатюры по умолчанию: 	как обрезать меньшую копию
	
Ширина большой миниатюры: 	ширина большой копии изображения
	
Высота большой миниатюры: 	высота большой копии изображения
	
Метод обрезки большой миниатюры: 	как обрезать большую копию
	
Настройка наложения водяного знака и фоновой текстуры
	
Водяной знак для миниатюр: 	путь к файлу водяного знака
	
Водяной знак. Мин. ширина: 	минимальная ширина, при которой водяной знак будет наложен
	
Водяной знак. Мин. высота: 	минимальная высота, при которой водяной знак будет наложен
	
Путь к файлу фоновой текстуры: 	путь к изображению (текстуре)
	
Размер отступа для заполнения текстурой: 	указанный размер будет отступом по бокам изображения, который заполнится изображением - текстурой
	
Настройка обработки «налету» в статьях
	
Как выводить изображения в статьях: 	вариант обработки изображений 
	
Создать title для ссылок из содержимого alt: 	если включено, и выбран режим ссылкой в настройках выше, то для ссылок создастся title из alt
	
Вырезать атрибут style у изображений: 	это удаляет атрибут style у изображений, полезно для выравнивания по центру всех картинок, которые раньше были влево или вправо
	
Преобразовать все изображения в адаптивный PICTURE: 	создается адаптивный контейнер <picture>, в котором на больших экранах показывается большая миниатюра, а на мобильных - маленькая
	
Создать контейнер (span): 	создает родительский контейнер
	
Имена классов для <span>: 	контейнеру можно указать имена классов через пробел
	
Интеграция плагина attacher в шаблон (тему) Cotonti
	
</blockquote>
	
Для того чтобы иметь возможность загружать, прикреплять, выводить файлы с помощью аттачера, нужно добавить в шаблон функции обратного вызова - подключить интерфейс для взаимодействия. По умолчанию интерфейс можно подключить к страницам и сообщениям форума (модули page и forums). Также можно установить дополнительный п<a href="http://freelance-script.abuyfile.com/attacher-freelance-plugin/">лагин attacherfreelance</a>, который подключает API аттачера для <a href="http://freelance-script.abuyfile.com/category/modules/">модулей</a> фриланс биржи.


Есть несколько функций, которые для этого предназначены, о них и пойдет речь дальше, с примерами кода для вставки в шаблон.

Добавление элемента загрузки файла на форму создания/редактирования объекта
<pre class="EnlighterJSRAW" data-enlighter-language="php">function att_filebox($area, $item, $field = '', $type = 'all', $limit = -1, $tpl = 'attacher.filebox');</pre>
При добавлении страницы ее ID еще не существует, поэтому второй параметр указывается равным 0.
В шаблон <strong>page.add.tpl</strong>:
<pre class="EnlighterJSRAW" data-enlighter-language="null">&lt;!-- IF {PHP|cot_auth('plug', 'attacher', 'W')} --&gt;
     &lt;div&gt;
        {PHP|att_filebox('page', 0)}
     &lt;/div&gt;
&lt;!-- ENDIF --&gt;</pre>
В шаблон <strong>page.edit.tpl</strong>:
<pre class="EnlighterJSRAW" data-enlighter-language="html">&lt;!-- IF {PHP|cot_auth('plug', 'attacher', 'W')} --&gt;
     &lt;div&gt;
        {PAGEEDIT_FORM_ID|att_filebox('page', $this)}
     &lt;/div&gt;
&lt;!-- ENDIF --&gt;</pre>
&nbsp;

Вывод прикрепленных изображений в списках страниц

В шаблон page.list.tpl:
<pre class="EnlighterJSRAW" data-enlighter-language="html">&lt;!-- IF {LIST_ROW_ID|att_count('page',$this,'','images')} &gt; 0 --&gt;
&lt;div&gt;
&lt;a href="{LIST_ROW_URL}" title="{LIST_ROW_SHORTTITLE}"&gt;
    &lt;img src="{LIST_ROW_ID|att_get('page',$this,'')|att_thumb($this,200,160,'crop',false)}" alt="{LIST_ROW_SHORTTITLE}"&gt;
&lt;/a&gt;
&lt;/div&gt;
&lt;!-- ENDIF --&gt;</pre>
или можно так:
<pre class="EnlighterJSRAW" data-enlighter-language="html">&lt;!-- IF {LIST_ROW_ID|att_count('page',$this,'','images')} &gt; 0 --&gt;
&lt;div&gt;
&lt;a href="{LIST_ROW_URL}" title="{LIST_ROW_SHORTTITLE}"&gt;
    {LIST_ROW_ID|att_display('page',$this,'','attacher.display.thumb','images',1)}
&lt;/a&gt;
&lt;/div&gt;
&lt;!-- ENDIF --&gt;</pre>
В шаблон page.enum.tpl:
<pre class="EnlighterJSRAW" data-enlighter-language="html">&lt;!-- IF {РAGE_ROW_ID|att_count('page',$this,'','images')} &gt; 0 --&gt;
&lt;div&gt;
&lt;a href="{PAGE_ROW_URL}" title="{PAGE_ROW_SHORTTITLE}"&gt;
    &lt;img src="{PAGE_ROW_ID|att_get('page',$this,'')|att_thumb($this,200,160,'crop')}" alt="{PAGE_ROW_SHORTTITLE}"&gt;
&lt;a&gt;
&lt;/div&gt;
&lt;!-- ENDIF --&gt;</pre>
или можно так:
<pre class="EnlighterJSRAW" data-enlighter-language="html">&lt;!-- IF {PAGE_ROW_ID|att_count('page',$this,'','images')} &gt; 0 --&gt;
&lt;div&gt;
&lt;a href="{PAGE_ROW_URL}" title="{PAGE_ROW_SHORTTITLE}"&gt;
    {PAGE_ROW_ID|att_display('page',$this,'','attacher.display.thumb','images',1)}
&lt;/a&gt;
&lt;/div&gt;
&lt;!-- ENDIF --&gt;</pre>
Варианты вывода на страницу в шаблон page.tpl:

Все прикрепленные к странице файлы:
<pre class="EnlighterJSRAW" data-enlighter-language="html">&lt;!-- IF {PAGE_ID|att_count('page',$this)} &gt; 0 --&gt;
&lt;div data-att-display="all"&gt;
    &lt;h3&gt;{PHP.L.att_attachments}&lt;/h3&gt;
    {PAGE_ID|att_display('page',$this,'','attacher.display','all')}
&lt;/div&gt;
&lt;!-- ENDIF --&gt;</pre>
&nbsp;

Галерея изображений (без скрипта галереи):
<pre class="EnlighterJSRAW" data-enlighter-language="html">&lt;!-- IF {PAGE_ID|att_count('page',$this,'','images')} &gt; 0 --&gt;
    &lt;div data-att-gallery="yourgallery"&gt;
        &lt;h3&gt;{PHP.L.att_gallery}&lt;/h3&gt;
        {PAGE_ID|att_gallery('page',$this,'','attacher.gallery')}
    &lt;/div&gt;
&lt;!-- ENDIF --&gt;</pre>
&nbsp;

Галерея изображений через highslide - отдельный плагин:
<pre class="EnlighterJSRAW" data-enlighter-language="html">&lt;!-- IF {PAGE_ID|att_count('page',$this,'','images')} &gt; 0 --&gt;
&lt;div data-att-gallery="highslide" data-att-group="mygroup"&gt;
&lt;h3&gt;{PHP.L.att_gallery}&lt;/h3&gt;
{PAGE_ID|att_gallery('page',$this,'','highslide.attacher.gallery')}
&lt;/div&gt;
&lt;!-- ENDIF --&gt;</pre>
Список файлов для скачивания:

&nbsp;
<pre class="EnlighterJSRAW" data-enlighter-language="html">&lt;!-- IF {PAGE_ID|att_count('page',$this,'','files')} &gt; 0 --&gt;
&lt;div data-att-downloads="download"&gt;
    &lt;h3&gt;{PHP.L.att_downloads}&lt;/h3&gt;
    {PAGE_ID|att_downloads('page',$this)}
&lt;/div&gt;
&lt;!-- ENDIF --&gt;</pre>
Вызов виджета загрузчика через iframe
<pre class="EnlighterJSRAW" data-enlighter-language="php">function att_widget($area, $item, $field = '', $tpl = 'attacher.widget', $width = '100%', $height = '200');</pre>
&nbsp;

В шаблон page.edit.tpl:

Это добавит iframe с загрузчиком файлов для существующего объекта:
<pre class="EnlighterJSRAW" data-enlighter-language="html">&lt;!-- IF {PHP|cot_auth('plug', 'attacher', 'W')} --&gt;
&lt;div&gt;
{PAGEEDIT_FORM_ID|att_widget('page', $this)}
&lt;/div&gt;
&lt;!-- ENDIF --&gt;</pre>
А это добавит ссылку на всплывающий виджет в iframe:
<pre class="EnlighterJSRAW" data-enlighter-language="html">&lt;!-- IF {PHP|cot_auth('plug', 'attacher', 'W')} --&gt;
&lt;div&gt;
{PAGEADD_FORM_ID|att_widget('page', $this, '','attacher.link')}
&lt;/div&gt;
&lt;!-- ENDIF --&gt;</pre>
В шаблон page.edit.tpl:

Это добавит iframe с загрузчиком файлов для существующего объекта:
<pre class="EnlighterJSRAW" data-enlighter-language="html">&lt;!-- IF {PHP|cot_auth('plug', 'attacher', 'W')} --&gt;
&lt;div&gt;
{PAGEEDIT_FORM_ID|att_widget('page', $this)}
&lt;/div&gt;
&lt;!-- ENDIF --&gt;</pre>
А это добавит ссылку на всплывающий виджет в iframe:
<pre class="EnlighterJSRAW" data-enlighter-language="html">&lt;!-- IF {PHP|cot_auth('plug', 'attacher', 'W')} --&gt;
&lt;div&gt;
{PAGEADD_FORM_ID|att_widget('page', $this, '','attacher.link')}
&lt;/div&gt;
&lt;!-- ENDIF --&gt;</pre>
&nbsp;

В шаблон page.tpl:
<pre class="EnlighterJSRAW" data-enlighter-language="html">&lt;!-- IF {PHP|cot_auth('plug', 'attacher', 'W')} --&gt;
&lt;li&gt;{PAGE_ID|att_widget('page',$this,'','attacher.link')}&lt;/li&gt;
&lt;!-- ENDIF --&gt;</pre>
&nbsp;

Прикрепление файлов к постам форума:

В шаблон forums.posts.tpl:
<pre class="EnlighterJSRAW" data-enlighter-language="html">&lt;!-- IF {PHP|cot_auth('plug', 'attacher', 'W')} AND {FORUMS_POSTS_ROW_USERID} == {PHP.usr.id} --&gt;
{FORUMS_POSTS_ROW_ID|att_widget('forums',$this,'','attacher.link')}
&lt;!-- ENDIF --&gt;</pre>
Это добавит ссылку на всплывающий виджет в iframe на странице поста. А для вывода списка файлов нужно разместить нижеприведенный код в любом месте блока FORUMS_POSTS_ROW:
<pre class="EnlighterJSRAW" data-enlighter-language="html">&lt;!-- IF {FORUMS_POSTS_ROW_USERID} == {PHP.usr.id} --&gt;
{FORUMS_POSTS_ROW_ID|att_display('forums',$this)}
&lt;!-- ENDIF --&gt;</pre>
BB-коды для встраивания в контент

Для того чтобы вывести изображение внутри текста, добавленного через визуальный редактор, например статья, используется единый бб код [att_image?] c параметрами, передаваемыми после вопросительного знака, например:
<pre class="EnlighterJSRAW" data-enlighter-language="null">?id=15
?id=11&amp;width=350
?id=2&amp;width=350&amp;height=350
?id=7&amp;width=320&amp;height=240&amp;alt=Image alt
?id=88&amp;width=320&amp;height=240&amp;alt=Image alt&amp;class=myclass</pre>
<blockquote>id - ID изображения
width - ширина
height - высота
frame - метод обрезки
alt - альтернативный текст
class - css класс</blockquote>
Обязательным является id, остальные на усмотрение. Их можно передавать все или частично, через знак &amp;. Если в настройках указано преобразование в picture, то это правило сработает и на изображения добавленные через bb код.
Описание функций обратного вызова (callback)

Прикрепление файлов не ограничивается только модулем страниц и стандартными шаблонами. Можно самостоятельно настроить прикрепление файлов, соответствующие им шаблоны и к другим объектам системы, в том числе к пока не существующим. Для этого нужно сразу после сохранения объекта и до любого редиректа вызвать соответствующую функцию:

Функция регистрации нового объекта
<pre class="EnlighterJSRAW" data-enlighter-language="php">function att_fixNewPath($area, $item);</pre>
<blockquote>$area - тип объекта или имя модуля. Например: page.
$item - id объекта. К примеру, это ID страницы, ID поста на форуме или ID комментария.</blockquote>
Эта функция по умолчанию работает для модулей forums, page. Для остальных расширений нужно самостоятельно добавить функцию. Вот как это реализовано для page в файле attacher.page.add.add.done.php:
<pre class="EnlighterJSRAW" data-enlighter-language="html">if (cot_auth('plug', 'attacher', 'W')) {
    if ($id) {
        att_fixNewPath('page', $id);
    }
}</pre>
Функция удаления всех прикрепленных файлов
<pre class="EnlighterJSRAW" data-enlighter-language="php">function att_remove_all($user_id = null, $area = null, $item_id = null);</pre>
<blockquote>$user_id - файлы определенного пользователя.
$area - тип объекта или имя модуля.
$item_id - id удаляемого объекта.</blockquote>
Эта функция удаляет все прикрепленные к объекту файлы, если указан $user_id, то удаляются файлы прикрепленные конкретным пользователем. Вот как это реализовано для page в файле attacher.page.delete.php:
<pre class="EnlighterJSRAW" data-enlighter-language="php">if (cot_auth('plug', 'attacher', 'W')) {
    require_once cot_incfile('attacher', 'plug');
 
    att_remove_all(null, 'page', $id);
}</pre>
Две вышеописанные функции предназначены для интеграции возможности взаимодействия API плагина attacher c другими расширениями, а дальше будут описаны функции применяемые в шаблоне.

Функция создания загрузчика
<pre class="EnlighterJSRAW" data-enlighter-language="html">function att_filebox($area, $item, $field = '', $type = 'all', $limit = -1, $tpl = 'attacher.filebox');</pre>
Выводит форму загрузки файлов, если это объект без id, то второй параметр нужно указывать как 0, в остальных случаях применяется $this, получающий значение из подключенного тега. Принимает следующие параметры:
<blockquote>$area - тип объекта или имя модуля. Например: page.
$item - id объекта. К примеру, это ID страницы, ID поста на форуме или ID комментария. CoTemplate «$this» позволяет передать в этот параметр значение тега.
$field - имя поля. Для создания нескольких форм можно использовать, по умолчанию является пустым.
$type - тип загружаемых файлов. 'all' - все файлы или 'file' или 'image'.
$limit - Ограничение на количество загружаемых файлов. Если указан -1 - то будут использованы ограничения, действующие для группы, которой принадлежит пользователь. 0 - неограниченно.
$tpl - шаблон элемента загрузки файлов.</blockquote>
Функция вызова виджета загрузки в iframe
<pre class="EnlighterJSRAW" data-enlighter-language="php">function att_widget($area, $item, $field = '', $tpl = 'attacher.widget', $width = '100%', $height = '200');</pre>
Эта функция используется для создания виждета прикрепления файлов, в зависимости от параметра $tpl выводит виджет загрузчика во всплывающем окне, или же ссылку на всплывающий по клику.
<blockquote>$area - определяет тип содержимого к которому прикрепляются файлы или код модуля / плагина, например 'page', 'forums', 'comments', и т.д.
$item - ID объекта, к которому прикрепляются файлы.
$field - имя поля. Можно оставить пустым. Позволяет к одному объекту прирепить несколько групп файлов.
$tpl - Код шаблона, содержащего html код виджета. «attacher.widget» вставляет диалог в iframe, а «attacher.link» (см.далее) добавляет ссылку на всплывающий диалог с загрузчиком.
$width - Ширина iframe.
$height - Высота iframe.</blockquote>
Функция вывода загруженных файлов
<pre class="EnlighterJSRAW" data-enlighter-language="php">function att_display($area, $item, $field = '', $tpl = 'attacher.display', $type = 'all', $limit = 0, $order = '');</pre>
Эта функция используется для отображения изображений, уже прикрепленных к объекту. Может отображать их все вместе, или только определенный тип файлов.
<blockquote>$area - определяет из какого объекта выводить - код модуля / плагина.
$item - ID объекта, файлы которого выводятся.
$field - имя поля выводимого объекта (если для загрузчика указывали).
$tpl - код шаблона для отображения, «attacher.display», «attacher.display.thumb».
$type - тип выводимых файлов. 'all' - все файлы или 'file' или 'image'.
$limit - количество выводимых объектов, 0 - все.
$order - сортировка, если не указан, то будет по умолчанию ASC.</blockquote>
Функция вывода галереи изображений
<pre class="EnlighterJSRAW" data-enlighter-language="php">function att_gallery($area, $item, $field = '', $tpl = 'attacher.gallery', $limit = 0, $order = '');</pre>
Эта функция используется для отображения файлов, уже прикрепленных к объекту.
<blockquote>$area - определяет из какого объекта выводить - код модуля / плагина.
$item - ID объекта, файлы которого выводятся.
$field - имя поля выводимого объекта (если для загрузчика указывали).
$tpl - код шаблона для отображения, «attacher.gallery».
$limit - количество выводимых объектов, 0 - все.
$order - сортировка, если не указан, то будет по умолчанию ASC.</blockquote>
Плагин attacher выдает сами файлы для галереи, ничего не зная о js скриптах, которые будут подключены. Такой подход делает возможным подключение разных библиотек, не привязываясь к директории аттачера или скриптам по умолчанию. Таким образом работает плагин highslide, который берет параметры изображений галереи, и выводит в своём tpl файле, подключая нужные скрипты.

Функция подсчета количества вложений
<pre class="EnlighterJSRAW" data-enlighter-language="php">function att_count($area, $item, $field = '', $type = 'all');</pre>
<blockquote>$area - определяет из какого объекта выводить - код модуля / плагина.
$item - ID объекта, файлы которого выводятся.
$field - имя поля выводимого объекта (если для загрузчика указывали).
$type - тип выводимых файлов. 'all' - все файлы или 'file' или 'image'.</blockquote>
Параметр $field может принимать значение '_all_'. В этом случае функция вернет общее количество файлов, прикрепленных к объекту (ко всем «полям»).
Функция вывода списка файлов для скачивания
<pre class="EnlighterJSRAW" data-enlighter-language="php">function att_downloads($area, $item, $field = '', $tpl = 'attacher.downloads', $limit = 0, $order = '');</pre>
Выводит отдельным блоком файлы доступные для скачивания.
<blockquote>$area - определяет из какого объекта выводить - код модуля / плагина.
$item - ID объекта, файлы которого выводятся для скачивания.
$field - имя поля выводимого объекта (если для загрузчика указывали).
$tpl - код шаблона для отображения, «attacher.downloads».
$limit - количество выводимых объектов, 0 - все.
$order - сортировка, если не указан, то будет по умолчанию ASC.</blockquote>
Функция создания копии изображения
<pre class="EnlighterJSRAW" data-enlighter-language="php">function att_thumb($id, $width = 0, $height = 0, $frame = '', $watermark = true);</pre>
Эта функция генерирует копию изображения и возвращает её url.
<blockquote>$id - id файла.
$width - ширина генерируемого изображения.
$height - высота генерируемого изображения.
$frame - режим кадрирования. Может принимать следующие значения:
- 'width' заполняет миниатюру по ширине и сохраняет соотношение сторон.
- 'height' заполняет миниатюру по высоте и сохраняет соотношение сторон.
- 'auto' (по-умолчанию) сохраняет соотношение сторон уменьшая изображение таком образом, чтобы его размеры не превысили заданных.
- 'crop' уменьшает изображение сохраняя соотношение сторон и обрезает изображение так, чтобы оно полностью заполнило указанные размеры.
$watermark - наложение водяного знака.</blockquote>
Функция получения данных элемента
<pre class="EnlighterJSRAW" data-enlighter-language="php">function att_get($area, $item, $field = '', $column = '', $number = 'first');</pre>
Это не все функции плагина, их намного больше, но для интеграции более чем достаточно. 
	
Если нужно удалить все копии изображений это можно сделать в панели управления аттачера (Администрирование), там же можно и по клику удалить не прикрепленные изображения, если такие найдутся плагином.


	---
<h1>#SUPPORT</h1>
* документация http://freelance-script.abuyfile.com/<br>
* видообзоры https://www.youtube.com/playlist?list=PLLJqscgzN-F4PmZnbYDsXUYfbT4rxC9Dz<br>
* <h3><a href="https://abuyfile.com/users/Webitproff" target="_blank" rel="noopener">персональная поддержка, консультации, доработки данной сборки биржи услуг на Cotonti или любые другие услуги индивидуального характера платные, которые заказать можно по контактам: </a></h3> <br>
* Email: webitproff@gmail.com <br>
* телеграм <a href="https://t.me/webitproff" target="_blank" rel="noopener">https://t.me/webitproff</a> <br>
* <a href="https://abuyfile.com/users/Webitproff" target="_blank" rel="noopener">https://abuyfile.com/users/Webitproff</a> - другие мои контакты и работы <br>
_____
