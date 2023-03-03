# docker-compose exec mysql mysql -uroot -p

USE example_db;
CREATE TABLE outbox (event JSON);

# Enable filter, restart

USE example_db;
INSERT INTO example_table SET name="Obi-Wan";
INSERT INTO outbox VALUES ('{"event_id": 1, "event": "user_registered", "data": {"name": "Obi-Wan"}}');