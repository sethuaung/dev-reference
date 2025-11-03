# Install Common Unix Packages for Initial/New Server Setup

## Require Packages
1. Required dependencies (curl wget git gcc make)
2. Web server
3. PHP and Perl Modules (Php, Perl and all required modules)
4. SQL Server (Mysql & MaraiDB, SQL Useful-Commands)

* NGINX [or] Apache Web server 2.4/
* MariaDB 10.x [or] MySQL 5.6, 5.7+
* PHP 5.6 (deprecated), 7.x
PHP extensions: bcmath, ctype, curl, fileinfo, gd, imagick, json, ldap, mbstring, memcached, mysqli, mysqlnd, pgsql, session, soap, xml, zip

# Step - 1 > Dependencies (curl wget git gcc make) <
### Required Dependencies
```
sudo apt update
sudo apt -y install apt-transport-https curl wget git software-properties-common lsb-release ca-certificates gnupg
```

## Make, GCC and Essential packages
```
sudo apt update
sudo apt install build-essential
```
```
sudo apt -y install make cmake gcc make memcached unzip moreutils
```

# Step - 2 > Webserver <

### NGINX [with mod modules]
```
sudo apt install nginx
sudo ufw allow 'Nginx HTTP'
sudo apt install php8.0-fpm
```
### APACHE2 [with mod modules]

```
sudo apt -y install apache2
sudo apt install php8.0 libapache2-mod-php
```

# Step - 3 > PHP and Perl Modules <

### Install/Enabling PHP Repository
```
sudo apt install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt update
```
#### Option-1
```
sudo apt install php8.0-mysql php8.0-gd
```
#### Option-2
```
sudo apt install php8.0-[extname]
sudo apt -y install php-{bcmath,cli,common,fpm,curl,gd,json,ldap,mbstring,mysql,pgsql,soap,xml,zip,imagick,memcached}
```
### PHP and php-zip module
```
sudo apt -y install php php-zip php-pclzip php-gd php-soap php-curl php-json
```
### Perl and all required modules
```
sudo apt -y install perl libxml-simple-perl libcompress-zlib-perl libdbi-perl libdbd-mysql-perl libnet-ip-perl libsoap-lite-perl libio-compress-perl libapache-dbi-perl  libapache2-mod-perl2 libapache2-mod-perl2-dev
 ```
 ```
sudo perl -MCPAN -e 'install Apache2::SOAP'
sudo perl -MCPAN -e 'install XML::Entities'
sudo perl -MCPAN -e 'install Net::IP'
sudo perl -MCPAN -e 'install Apache::DBI'
sudo perl -MCPAN -e 'install Mojolicious'
sudo perl -MCPAN -e 'install Switch'
sudo perl -MCPAN -e 'install Plack::Handler'
```
### Default PHP version
```
sudo update-alternatives --set php /usr/bin/php8.1 
```
```
sudo update-alternatives --set php /usr/bin/php7.4
```

# Step - 3 > Database Server <
## MySQL 8.0 packages
#### Option-1
```
wget https://dev.mysql.com/get/mysql-apt-config_0.8.33-1_all.deb
sudo dpkg -i mysql-apt-config_0.8.33-1_all.deb
```
#### Search for MySQL 8.0 using apt cache
```
apt-cache policy mysql-server
```
#### Option-2
```
sudo apt install mysql-client mysql-community-server mysql-server
```
```
sudo mysql_secure_installation
```
## MariaDB Packages
```
sudo apt install mariadb-server mariadb-client
```
#### Access the database from a remote machine;
```
mysql -u user -h database_server_ip -p
```

e.g., 
```
$ sudo mysql -u root -p 
```
[or]
```  
$ sudo mysql -uroot -p 
```
[or]
``` 
$ sudo mysql -u root -h 192.168.1.2 -p
```
## <<< Useful SQL Commands >>>

#### User Create
```
CREATE USER 'username'@'localhost' IDENTIFIED BY 'P@ssw0rd';
CREATE USER 'username'@'%' IDENTIFIED BY 'P@ssw0rd';
```
```
CREATE USER 'username'@'localhost' IDENTIFIED WITH mysql_native_password BY 'P@ssw0rd';
```
#### Change user password
```
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'P@ssw0rd';
```
#### Permission & Roles Setup
```
GRANT CREATE, ALTER, DROP, INSERT, UPDATE, DELETE, SELECT, REFERENCES, RELOAD on *.* TO 'username'@'localhost' WITH GRANT OPTION;
```
```
GRANT ALL PRIVILEGES ON *.* TO 'username'@'localhost' WITH GRANT OPTION;
```
```
GRANT ALL PRIVILEGES ON *.* TO 'username'@'%' WITH GRANT OPTION;
```
```
FLUSH PRIVILEGES;
```
#### Exit from sql server
```
exit; [or] quit;
```
