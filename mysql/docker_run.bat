docker run --rm -d  -p 3306:3306  --name mysql -v d:\mydocs\mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD="rootpass" -e MYSQL_USER="haseong" -e MYSQL_PASSWORD="haseongpass" mysql:latest 
