# Application Info

CMSimple is a php based Content Managemant System (CMS) , which requires no database. All data are stored in a simple file system.
Vendor Homepage: https://www.cmsimple.org/en/
Software Link: https://www.cmsimple.org/en/
Version:  CMSimple 5.4

# Build Commands
* `docker build . -t cmsimple`
* `docker run -p 8081:80 cmsimple`
* Navigate to `http://<hostname>:8081/`

# Setup
* Navigate to `http://<hostname>:8081/setup.php` within 5 minutes of startup to set the system password
* Login using any username (optional) and the password set in setup.php
