# Стартовая сборка фриланс-биржи на Cotonti CMF #
# ⭐ Freelance MarketPlace script ⭐ by webitproff #
<img src="https://github.com/webitproff/freelance-scripts/blob/master/Freelance%20Marketplace%20-%20%D0%A1%D0%B1%D0%BE%D1%80%D0%BA%D0%B0%20%D1%81%D0%B0%D0%B9%D1%82%D0%B0%20%D0%BC%D0%B0%D1%80%D0%BA%D0%B5%D1%82%D0%BF%D0%BB%D0%B5%D0%B9%D1%81%D0%B0%20%D0%B8%20%D1%84%D1%80%D0%B8%D0%BB%D0%B0%D0%BD%D1%81%20%D1%83%D1%81%D0%BB%D1%83%D0%B3%202022%20%D0%B3%D0%BE%D0%B4%D0%B0%20%D0%BD%D0%B0%20PHP%20v.%207.4.png" alt="Базовая сборка сайта фриланс-биржи на Cotonti Siena" width="" height=""><br>
_____
# Сборка (стартовая) для создания сайта фриланс биржи, торговой площадки продажи услуг и товаров  #
## v3.0.24 под PHP v7.4 на Cotonti Siena v0.9.24 от 10.10.2023 года ##
## Script Freelance MarketPlace (SFM) на Cotonti Siena ##

### Версия этой сборки **SFM** совместима с PHP 7.1 - 7.4 ###
**Внимание** PHP 7.4 потолок именно для этой сборки!

Copyright 2012 - 2023

### Подготовка к установке ###

**Внимание**  Репозиторий содержит все необходимые файлы для установки на [web-сервер](https://beget.com/order/start?id=1479352) и включает базовые модули и плагины для организации сайта биржи услуг или маркетплейса товаров, в том числе цифровых, с прикреплением файлов. Присутствует возможность совершать "сделки без риска", личный баланс, онлайн-платежи и прочее. 
Больше информации в телеграм-канале https://t.me/script_freelance_marketplace 
или на сайте http://freelance-script.abuyfile.com/ (пользуйтесь поиском) 


### Порядок установки ###

1. Скачиваете архив репозитория сайта маркетплейса фриланс услуг. Распаковываете архив в директорию будущего сайта.
2. Создайте базу данных 
3. Установите к файлу datas/config.php права на запись CHMOD 666 или CHMOD 664 (в зависимости от настроек вашего хостинга).
4. Установите права 777 на все папки и подпапки в директории datas/, в частности:

/datas/avatars
/datas/cache (и все подпаки)
/datas/defaultav
/datas/extflds
/datas/photos
/datas/thumbs
/datas/users

### Установка ###

1. Откройте ваш браузер и перейдите по ссылке: http://example.com/install.php <br>
1.1  <a href="https://www.youtube.com/watch?v=YQ1hv-VVW6c" target="_blank" title="Freelance MarketPlace на движке Cotonti- Установка на хостинг TimeWeb на PHP 7.4"><strong>Видеоруководство и демонстрация "Установка сборки маркетплейса на движке Cotonti на хостинг под PHP 7.4"</strong></a>
2. Следуйте инструкциям на экране до окончания установки.
При установке выберите инсталл-скрипт flance и укажите тему bootlance.
3. Во время установки вам будет предложено выбрать плагины и расширения при первой установке. Галочкой отмечены самые основные расширения, которые необходимы для работы биржи, но вы можете выбрать также остальные при необходимости.
4. Обязательно настройте плагин Usergroupselector, если на вашем сайте будет разделение пользователей на различные группы, например на работодателей и фрилансеров. В настройках этого плагина нужно указать какие группы будут доступны для выбора пользователям при регистрации или в профиле. Если нужно создать другую группу пользователей, то перейдите в раздел админки "Пользователи".
5. Для того чтобы можно было закреплять файлы и изображения к проектам ( а также к предложениям в магание и в портфолио), необходимо также установить плагины mavatars и mavatarslance, которые также идут в составе сборки. Но рекомендуется плагин "Attacher" <a href="https://github.com/webitproff/cot-Attacher-Roffun" target="_blank" title="Инструкция по настройке плагина."><strong>Инструкция по настройке плагина.</strong></a>
6. Изначально сайт будет пустой. Свои категории вы должны самостоятельно создать в разделе админки "Структура".

**Внимание**  для работы структуры с дочерними категориями нужно в файле datas/config.php установить опцию `$cfg['customfuncs'] = true`;    
Эта опция подключает к Cotonti дополнительную библиотеку функций, которые находятся в файле system/functions.custom.php. Если у вас уже подключен этот файл, то нужно добавить в него ваши дополнительные функции, которые были в нем прописаны.

_____
# Сборка стартовая с базовым шаблоном, а следовательно интеграция в него плагинов и модулей производится под себя самостоятельно или под заказ #
_____
# Демонстрация <a href="http://masterscity.abuyfile.com/" target="_blank" title="Freelance MarketPlace - демонстрация готового сайта фриланс биржи"><strong>готового сайта, который можно купить и запустить у себя за 15 минут</strong></a> #
<a href="https://masterscity.abuyfile.com/" target="_blank" rel="nofollow noopener"><img src="https://cp.beget.com/promo_data/static/static468x60_3.png" alt="static468x60_3.png" border="0" /></a>
_____
# <h4>Если, у Вас еще нет своего хостинга, - рекомендую хостинг без головной боли <a href="https://beget.com/order/start?id=1479352" target="_blank" rel="noopener">beget-хостинг</a> 
Тариф "Старт" - оптимально и даже очень не дорого
по ссылке <a href="https://beget.com/order/start?id=1479352" target="_blank" rel="noopener">https://beget.com/order/start?id=1479352</a>
или клик по картинке</h4><br>
<a href="https://beget.com/p1479352/order/start" target="_blank" rel="nofollow noopener"><img src="https://raw.githubusercontent.com/webitproff/freelance-scripts/master/masterscity.abuyfile.com.png" alt="" border="0" /></a>

к тому же, тестирование на месяц бесплатно + сервисный домен - (свой домен прикрепить и протестирвать можно даже на бесплатном тестовом периоде хостинга)

<h1>#SUPPORT</h1>
# <strong>Помощь в установке сборки биржи услуг на Cotonti Siena:</strong> #
* документация http://freelance-script.abuyfile.com/<br>
* видообзоры https://www.youtube.com/playlist?list=PLLJqscgzN-F4PmZnbYDsXUYfbT4rxC9Dz<br>
* <h3><a href="https://abuyfile.com/users/Webitproff" target="_blank" rel="noopener">персональная поддержка, консультации, доработки данной сборки биржи услуг на Cotonti или любые другие услуги индивидуального характера платные, которые заказать можно по контактам: </a></h3> <br>
* Email: webitproff@gmail.com <br>
* телеграм <a href="https://t.me/webitproff" target="_blank" rel="noopener">https://t.me/webitproff</a> <br>
* <a href="https://abuyfile.com/users/Webitproff" target="_blank" rel="noopener">https://abuyfile.com/users/Webitproff</a> - другие мои контакты и работы <br>
_____
<h1>Подробнее</h1>
<p><a href="http://freelance-script.abuyfile.com/category/plugins/" title="Сайт документации и руководство по сборке биржи фриланса и маркеплейса услуг на движке Cotonti Siena" target="_blank" rel="noopener noreferrer">Плагины для «<span style="color: #ff6600;"><strong>Сборка фриланс-биржа</strong></span>»</a></p>
<p><a href="http://freelance-script.abuyfile.com/category/modules/" title="Сайт документации и руководство по сборке биржи фриланса и маркеплейса услуг на движке Cotonti Siena" target="_blank" rel="noopener noreferrer">Модули для «<span style="color: #ff6600;"><strong>Сборка фриланс-биржа</strong></span>»</a></p>
<p><a href="http://freelance-script.abuyfile.com/category/templates/" title="Сайт документации и руководство по сборке биржи фриланса и маркеплейса услуг на движке Cotonti Siena" target="_blank" rel="noopener noreferrer">Шаблоны для «<span style="color: #ff6600;"><strong>Сборка фриланс-биржа</strong></span>»</a></p>
<p><a href="http://freelance-script.abuyfile.com/category/builds-freelance-script/" title="Сайт документации и руководство по сборке биржи фриланса и маркеплейса услуг на движке Cotonti Siena" target="_blank" rel="noopener noreferrer">готовые сайты на «<span style="color: #ff6600;"><strong>Сборка фриланс-биржа</strong></span>»</a></p>

Версия сборки: v3.0.20
Сборка фриланс-биржи на базе Cotonti Siena. С помощью данной сборки можно организовать любую биржу по поиску исполнителей на различные работы. Функционал биржи предоставляет гибкие возможности для эксплуатации и дальнейшей разработки.
<blockquote>
Биржа открывает перед разработчиками все возможности нового фреймворка Cotonti Siena, а это не много не мало такие фишки как возможность подключать различные способы оплаты без вмешательства в исходный код (на данный момент доступо подключение Robokassa, Interkassa и Webmoney), модульная архитектура, удобная система обновления, а также легкость освоения, так как у Siena имеется достаточно хорошая документация.
Возможности биржи:

Аккаунты пользователей со своими личными страницами (на личной странице выводится контактная информация, а также списки опубликованных проектов, работ в портфолио и в магазине); Каталог заказов (проектов), возможность публиковать заказы. Форма поиска заказов по регионам и ключевой фразе; Каталог фрилансеров и работодателей с сортировкой по специализациям; Платежный модуль с внутренними счетами пользователей и возможностью пополнения и оплаты услуг; Возможность подключения к Интеркассе, Робокассе и Вебмани (отдельные плагины); Платная услуга "PRO-аккаунт"; Платная услуга "Платное место на главной" (Пользователи оплатившие данную услугу выводятся на главной странице биржи); Отзывы и система рейтингов.
Роли пользователей (группы)

В традиционной фриланс-бирже участвует две стороны, это фрилансеры и заказчики. Но мы немного усовершенствовали систему и добавили возможность расширить число участников сервиса. Теперь можно создавать свои собственные роли на сайте и привязывать их к группам пользователей для которых можно настроить права доступа ко всем разделам сайта и определить для них свои возможности.
Проекты

Любой пользователь может опубликовать свой проект на сайте. В проекте можно указать регион, город, цену, раздел в каталоге (направление деятельности), заголовок проекта и его описание. Также можно прикрепить различные файлы к описанию проекта. Фрилансеры, которых заинтересовал опубликованный проект могут оставлять свои предложение на странице проекта. Работодатель может выбрать исполнителем либо отказать по проекту любому Фрилансеру, который оставил предложение. Работодатель или Фрилансер, оставивший предложение по проекту, могу вести переписку непосредственно на странице проекта.
Отзывы

Любой пользователь сервиса может оставлять отзывы другим участникам. Отзыв может быть как положительным так и отрицательным, на выбор. Доступ к публикации Отзывов можно ограничить только в рамках проведенных проектов (настраивается). По-умолчанию пользователи могут оставлять отзывы другим пользователям. При необходимости систему отзывов можно настроить так, чтобы отзывы можно было оставлять только за исполненные заказы, то есть с привязкой к проекту.
Система рейтингов

Чтобы выделить среди участников сервиса наиболее активных пользователей на сайте функционирует система начисления рейтинга. У кого больше рейтинг, тот пользователь более заметен на сайте.

Как начисляются баллы (настройки по-умолчанию): За посещение сайта: +1 балл За размещение работы в портфолио: +5 баллов За статус исполнителя по проекту: +1 балл За получение отказа по проекту: -1 балл За получение положительного отзыва: +20 баллов За получение отрицательного отзыва: -20 баллов За покупку PRO-аккаунта: +20% к рейтингу За покупку платного места на главной: +20% к рейтингу. Указанные значения баллов можно изменить в админке сайта.

Также добавлена возможность вывода топ-пользователей в любом месте на сайте.
Система оплаты услуг сайта

У каждого пользователя есть свой личный счет на сайте. Пополнение счета осуществляется через системы приема платежей Робокасса, Интеркасса и Вебмани. С помощью личного счета пользователь может оплачивать платные услуги сайта. Данная система оплаты является универсальным механизмом, с помощью которого можно разрабатывать на сайте свои платные услуги.
Виды платных услуг:

PRO-аккаунт (цена за месяц). PRO-аккаунт дает возможность выделиться среди других участников биржи специальным значком, а также приоритетное размещение в каталоге фрилансеров (работодателей); Платное место на главной и в любом другом месте на сайте (цена за размещение). Рекламные блоки можно разместить в любом месте на сайте и установить для размерения в них разные цены. Размещение происходит путем смещения ранее оплативших и на срок 1 месяц. Цены также можно изменить в админке.
Магазин

Раздел для размещения готовых к продаже товаров или услуг пользователя. Каждый товар содержит: заголовок, описание, изображение и цену. Также все товары/услуги распределены в каталоге по категориям для удобства поиска.

В админке предусмотрена возможность редактировать категории для всех разделов сайта:

Категории проектов Типы проектов (например: Обычные, Вакансии, и т.д.) Категории фрилансеров Категории в магазине Категории информационных страниц сайта.


</blockquote>
_____

# <a href="http://freelance-script.abuyfile.com/" target="_blank" title="Сайт документации и руководство по сборке биржи фриланса и маркеплейса услуг на движке Cotonti Siena">Сайт документации по сборке фриланс-маркеплейса на движке Cotonti Siena</a> #
