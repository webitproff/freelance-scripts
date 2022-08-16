Менеджер рассылок для Cotonti
Данный модуль позволяет организовать массовые рассылки по спискам получателей, которые можно создать вручную, либо организорвать автоматические подписки на страницах сайта.

Рассылка осуществляется через cron таким образом, чтобы рассылка производилась поочередно по каждому получателю. Почему используется cron? Потому что это наверное наиболее оптимальный вариант реализации рассылки с определенной задержкой, чтобы почтовые службы не посчитали вашу рассылку за спам. В настройках плагина можно указать сколько писем должно рассылаться за один запуск скрипта рассылки через cron (по-умолчанию установлено 10). Кроме этого в cron можно задать время когда будет запускаться скрипт, например каждые 5-10 минут. Обычно планировщик cron входит в состав любого профессионального хостинга.

 

Инструкция по установке

1. Распакуйте исходники в папку modules вашего сайта.
2. Зайдите в панель администратора и установите данный модуль.
3. Настройте запуск скрипта рассылки (http://вашсайт/index.php?e=cwsender) в вашем планировщике cron. Периодичность запуска скрипта устанавливаете сами как вам нужно. Не рекомендуется устанавливать период меньше чем 5-10 минут, чтобы не перегружать сервер.

Пример команды для cron выглядит так: 
wget -q -O - http://вашсайт/index.php?e=cwsender > /dev/null 2>&1

 

Как создать свой список рассылки

В админ-панели зайдите в администрирование данного модуля. На первой странице будет форма для создания списка получателей. 

Списки получателей для рассылки составляются несколькими способами на выбор:

1. Ввод списка вручную в текстовое поле в формате: имя,почта (каждый получатель указывается в отдельной строчке);
2. Путем выбора групп пользователей по которым нужно разослать сообщение. В момент запуска рассылки будет сформирован список получателей из состава выбранных групп;
3. Путем формирования mysql-запроса. Вариант для опытных пользователей, так как нужно очень хорошо понимать как сформировать нужный запрос. Вариант полезен, когда нужно учесть некоторые особенности вашего сайта, например составить список по какому-то специфическому условию;
4. Путем создания формы подписки и размещения ее тэга в шаблоне, где посетители сайта будут вводить имя и почту для подписки и тем самым будет формироваться этот список.
5. При установке модуля создается экстраполе для пользователя, которое необходимо, чтобы пользователь имел возможность включать или выколючать разрешение на получение ваших рассылко, поэтому в шаблоне профиля пользователя нужно добавить соответствующий тэг: {USERS_PROFILE_SENDMAIL}.

Каждый список имеет свое название, чтобы его легко было запомнить для использования в далнейших рассылках.

 

Как создать рассылку

Для создания сообщения для рассылки перейдите по ссылке "Рассылки". На этой странице выводится форма создания рассылки, в которой необходимо заполнить заголовок, текст и выбрать список рассылки. После того как вы сохраните сообщение, оно будет готово для запуска рассылки. Запустить рассылку можно по кнопке напротив названия рассылки. 

 

Как создать подписку

Создаете список подписки в админке. Запонимаете его ID (слева напротив списка указывается его ID). Далее в любом шаблоне сайта (файлы *.tpl) прописываете тэг формы созданной подписки: {PHP|cwsender_subscribe(номер_рассылки)}, где заменяете номер_рассылки на ID вашего списка подписки. 

Страница разработки: http://cmsworks.ru/catalog/modules/cwsender


Разработчик: CMSWorks Team support@cmsworks.ru

Copyright CMSWorks Team 2016