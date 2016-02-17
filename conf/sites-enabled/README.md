# sites-enabled
This directory contains *.conf Apache vHost configuration files. All *.conf files in this directory, will be copied to `/etc/apache2/sites-enabled`.

## Example
Getting a vHost running only requires you to create a *.conf file (e.g `example.com.conf`) in this directory, which contains a vHost configuration like this:

```
<VirtualHost *:80>
    ServerName example.com
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html/example.com
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```