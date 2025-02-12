CREATE DATABASE QApp;

CREATE USER 'app_user'@'localhost' IDENTIFIED BY 'ThisPasswordShouldNotBeUsed';

GRANT EXECUTE ON PROCEDURE QApp.get_all_categories TO 'app_user'@'localhost';