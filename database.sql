-- name : Labballi Maroua
-- email : labballimaroua@gmail.com

--create database
CREATE DATABASE streaming_plateform;

--use database
USE streaming_plateform;

--add table user_plt
CREATE TABLE user_plt(
UserID int PRIMARY KEY, 
FirstName varchar (100) NOT NULL,
LastName varchar (100) NOT NULL,
Email varchar (100) UNIQUE,
RegistrationDate date,
SubscriptionID int NOT NULL 
)

