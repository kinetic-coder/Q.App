docker build --env-file .env -t mysql-custom .
docker run -d -p 3306:3306 --name mysql-custom mysql-custom
