docker run --rm  -p 3306:3306  --name mysqldock -v DBfiles:/var/lib/mysql -e MYSQL_ROOT_PASSWORD="rootpass" -e MYSQL_USER="haseong" -e MYSQL_PASSWORD="haseongpass" haseong/mysql:v0 
