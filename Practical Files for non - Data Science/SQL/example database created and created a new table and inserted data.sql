
CREATE DATABASE example;
USE my_database;
create table user (
	id int auto_increment,
    name varchar(15),
    refrence varchar(15),
    amount int,
    primary key(id));
INSERT INTO user (name, refrence, amount) VALUES
('John Doe', 'ABC123', 500),
('Jane Smith', 'XYZ456', 1000),
('Alice Johnson', 'LMN789', 1500);
Select*from user;