RiteCMS - https://ritecms.com
=============================

_By Lucas Zhuang_

● Description
----------------------------
CMS based on PHP and Sqlite (or MySQL optional). Version 3.X is a major update with lots of changes. Upgrade from version 2.x is not recommended but doable.

● What is new
----------------------------
Major updates of version 3.0.0 released on Feb 23, 2021:
1. Major architectural change. The CMS engine is now totally separate from the main website. It is now easier to upgrade and deploy multiple websites with one central CMS folder location. Just create a symbolic link to the real CMS folder location.
2. Compatible with PHP 7
3. Upgraded to TinyMCE version 5.X: https://www.tiny.cloud/
4. Templates rewritten in CSS3 with flexbox etc
5. Builtin CAPTCHA module SECURIMAGE. https://github.com/dapphp/securimage/blob/master/securimage.php 
6. A simple image slideshow/carousal function in Javascript. To use it, in sidebar_one, either paste the following. Change your src location accordingly. Notice total number of the dot class tags should match the total pictures.

		<div id="slideshow">
		<div class="mySlides"><img src="media/myslide1.png"><div class="text">text1</div></div>
		<div class="mySlides"><img src="media/myslide2.png"><div class="text">text2</div></div>
		<div class="mySlides"><img src="media/myslide3.png"><div class="text">text3</div></div>
		<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
		<a class="next" onclick="plusSlides(1)">&#10095;</a>
		</div>
		<div id="slideshow_dots">
		<span class="dot" onclick="currentSlide(1)"></span>
		<span class="dot" onclick="currentSlide(2)"></span>
		<span class="dot" onclick="currentSlide(3)"></span>
		</div>
or use the built-in function:

[function:slideshow('"text1"::media/slide1.png||"text2"::media/slide2.png||"text3"::media/slide3.png)]

7. Other minor updates

● License
----------------------------
This product is distributed under the GPL. Please read through the file
<LICENSE_GPL_V3.txt> for more informations about this license.

● SYSTEM REQUIREMENTS
----------------------------

 * Apache webserver with mod_rewrite and .htaccess file support enabled
 * or NGINX server (see below for installation guide)
 * PHP 7 with PDO and SQLite driver enabled

● INSTALLATION
----------------------------
 1. Load up the script files to your server
 2. Depending on your server configuration you may need to change the write
    permissions of the following subdirectories:
        * cms/cache (CHMOD 777) - cache directory, needs to be writable if
          you want to use the caching feature
        * media and images (CHMOD 777) - need to be writable if you want to
          use the file uploader
 3. Ready! You should now be able to access the index page by browsing to the
    address you uploaded RiteCMS (e.g.https://your-domain.tld/path/to/phpsqlitecms/). 
    To administrate the page, go to https://your-domain.tld/path/to/ritecms/cms/. 
    The default admin userdata is: username: admin, password: admin.
 4. special steps for nginx servers. You need to change your virtual host folder for redirect to work. Below is an example of server block.

		server {
			server_name ritecms.com;
			listen 80;
			root /var/www/public_html/ritecms.com; 
			index index.php index.htm index.html;
			error_log  /var/www/log/rite_error.log;
			access_log  /var/www/log/rite_access_error.log;
			location ~ \.m$ {if (!-e $request_filename){rewrite ^/(.*)$ /index.php?mobile=true&qs=$1 last;break;}}
			location / {if (!-e $request_filename){rewrite ^/(.*)$ /index.php?qs=$1 last;break;}} 
			location /data {deny all;return 404;}
			location ~ \.php$ {include snippets/fastcgi-php.conf;fastcgi_pass unix:/run/php/php7.3-fpm.sock;}
		}

No MySQL data initialization is provided. Please use the Sqlite version for reference located in the data folder.
5. to login to the backend, please use the new entry script at the root folder: admin.php. Default password is admin/admin.
  
● SECURITY
----------------------------
1. Please change your password asap.
2. To avoid XSS attack, please change the token in CMS/index.php Line 27 (or else if you change the file)
define('TOKEN_SALT', 'monkey');
Change 'monkey' to anything else.

Credits
----------------------------
* Mark Hoschek of phpsqlitecms
* Nix for the German Language translation
* Drew Phillips OF SECURIMAGE
* The TinyMCE community

Release Notes:
----------------------------
## Version 3.1
updates since V3.0

* add option of blog mode where all new pages will be automatically added to default blog(news) page
* htaccess block to php execution in media and files folder
* added redirect page in database so that you can type /a to go to /admin.php

## Version 3.0

### RiteCMS V3.0 is a ultrafast simple CMS based on Php & Sqlite.
Major updates to V2.X includes:

* Upgraded to Php7.
* CMS engine and other scripts are separate now. This makes it easy to upgrade and also possible to power multiple websites with one central CMS engine (folder). You simple create symbolic folder to the link. Back end entry script is located at the root folder.
* Built-in Phpcaptcha with Securimage.
* TinyMCE updated to v5.x
* Built-in carousal/slide show without the need of JQuery library.
* Templates engine updated to CSS3 such as flex-box support.
* Tested on NGINX server.
* This version works out of the box for both desktop and mobile phones. You still have the option to use the .m switch to switch templates for a dedicated mobile website.

To install, please follow readme.md or visit https://ritecms.com

The good news is that database structure stays roughly the same. The 'more' column initially reserved for news pages is now related.

Enjoy

Lucas

2020.3.3

## Past versions
Previous versions can be found in SourceForge.
https://sourceforge.net/projects/ritecms/
### Version 2.2.1 (Not recommended, for reference only)
[Version 2.2.1 for reference only](https://netactuate.dl.sourceforge.net/project/ritecms/ritecms_2.2.1.zip)
