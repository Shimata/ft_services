CREATE DATABASE wordpress;
CREATE USER 'wquinoa'@'%' IDENTIFIED BY 'wquinoa';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wquinoa'@'%';
FLUSH PRIVILEGES;