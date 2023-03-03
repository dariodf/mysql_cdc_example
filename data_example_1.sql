# docker-compose exec mysql mysql -uroot -p

CREATE DATABASE example_db;
USE example_db;
CREATE TABLE example_table (
  id int(10) not null primary key auto_increment, 
  name varchar(255)
);

INSERT INTO example_table SET name="George";
UPDATE example_table SET name="Lucas" WHERE name="George";
DELETE FROM example_table WHERE name="Lucas";