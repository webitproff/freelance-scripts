# <RequireAll>
# Require all granted
# Require not ip 37.44 5.188 2.95
# </RequireAll>
################ Cotonti Handy URLs for Apache #######################

# Below are the rules to be included in your main .htaccess file or httpd.conf

# Rewrite engine options
Options -Indexes
RewriteEngine On
#301 редирект с домена с WWW на домен без WWW
#RewriteCond %{HTTP_HOST} ^www.master.ru$ [NC]
#RewriteRule ^(.*)$ http://master.ru/$1 [R=301,L]
#Перенос сайта на версию с HTTPS (для всех страниц)
#RewriteCond %{SERVER_PORT} ^80$ [OR]
#RewriteCond %{HTTP} =on
#RewriteRule ^(.*)$ https://master.ru/$1 [R=301,L]


# больше информации об настройках .htaccess по ссылке ниже
# http://freelance-script.abuyfile.com/htaccess-http-https/

# Server-relative path to Cotonti. Replace it with your path if you run Cotonti
# in a subfolder
RewriteBase "/"

# Language selector
#RewriteRule ^(en|ru|de|nl|ua)/(.*) $2?l=$1 [QSA,NC,NE]

# Sitemap shortcut
RewriteRule ^sitemap\.xml$ index.php?r=sitemap [L]

# Admin area and message are special scripts
RewriteRule ^admin/([a-z0-9]+) admin.php?m=$1 [QSA,NC,NE,L]
RewriteRule ^(admin|login|message)(/|\?|$) $1.php [QSA,NC,NE,L]

# users
RewriteRule ^employers/?$ index.php?e=users&group=employer [QSA,NC,NE,L]
RewriteRule ^freelancers/?$ index.php?e=users&group=freelancer [QSA,NC,NE,L]
RewriteRule ^employers/([a-zA-Z0-9_./%-]+)/?$ index.php?e=users&group=employer&cat=$1 [QSA,NC,NE,L]
RewriteRule ^freelancers/([a-zA-Z0-9_./%-]+)/?$ index.php?e=users&group=freelancer&cat=$1 [QSA,NC,NE,L]

# forums
RewriteRule ^forums/([a-zA-Z0-9_./%-]+)/topic([0-9]+)/page([0-9]+)?$ index.php?e=forums&m=posts&q=$2&d=$3 [QSA,NC,NE,L]
RewriteRule ^forums/([a-zA-Z0-9_./%-]+)/topic([0-9]+)?$ index.php?e=forums&m=posts&q=$2 [QSA,NC,NE,L]
RewriteRule ^forums/([a-zA-Z0-9_./%-]+)/post([0-9]+)?$ index.php?e=forums&m=posts&id=$2 [QSA,NC,NE,L]
RewriteRule ^forums/([a-zA-Z0-9_./%-]+)/([a-zA-Z0-9_%-]+)/page([0-9]+)?$ index.php?e=forums&m=topics&s=$2&d=$3 [QSA,NC,NE,L]
RewriteRule ^forums/([a-zA-Z0-9_./%-]+)/([a-zA-Z0-9_%-]+)/?$ index.php?e=forums&m=topics&s=$2 [QSA,NC,NE,L]
RewriteRule ^forums/([a-zA-Z0-9_%-]+)/?$ index.php?e=forums&c=$1 [QSA,NC,NE,L]
RewriteRule ^forums/?$ index.php?e=forums [QSA,NC,NE,L]

# System category has priority over /system folder
RewriteRule ^system/?$  index.php?rwr=system [QSA,NC,NE,L]

# All the rest goes through standard rewrite gateway
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^([^?]+) index.php?rwr=$1 [QSA,NC,NE,L]

