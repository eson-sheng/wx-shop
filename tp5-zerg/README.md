# 本地化配置文件示例：

### Nginx 服务配置：

```nginxconfig
server {
    listen 80;
    server_name [域名];
    access_log  /home/wwwlogs/[项目名]_access.log;
    error_log   /home/wwwlogs/[项目名]_error.log;
    set         $root   /home/www/[项目示例地址]/public;
    location ~ .*\.(gif|jpg|jpeg|bmp|png|ico|txt|js|css)$
    {
        root $root;
    }
    location / {
        root    $root;
        index   index.html index.php;
        if ( -f $request_filename) {
            break;
        }
        if ( !-e $request_filename) {
            rewrite ^(.*)$ /index.php/$1 last;
            break;
        }
    }
    location ~ .+\.php($|/) {
        fastcgi_pass    unix:/tmp/php-cgi.sock;
        fastcgi_split_path_info ^((?U).+.php)(/?.+)$;
        fastcgi_param   PATH_INFO          $fastcgi_path_info;
        fastcgi_param   PATH_TRANSLATED    $document_root$fastcgi_path_info;
        fastcgi_param   SCRIPT_FILENAME    $root$fastcgi_script_name;
        include         fastcgi_params;
    }
}
```


### local_config.php
> 项目业务配置
`./thinkphp/application/local_config.php`

```php

```

### local_database.php
> 数据库配置
`./thinkphp/application/local_database.php`

```php

```