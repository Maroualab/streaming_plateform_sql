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

--add table subscription
CREATE TABLE subscription(
SubscriptionID INT AUTO_INCREMENT PRIMARY KEY, 
SubscriptionType varchar (50) NOT NULL
CHECK (SubscriptionType = 'Basic' OR SubscriptionType = 'Premium'),
MonthlyFee DECIMAL (10,2)
);

--add table watchhistory
CREATE TABLE watchhistory(
WatchHistoryID INT AUTO_INCREMENT PRIMARY KEY, 
UserID INT NOT NULL,
MovieID INT NOT NULL,
WatchDate DATE NOT NULL,
CompletionPercentage INT DEFAULT (0)
);

--add table review
CREATE TABLE review(
ReviewID INT AUTO_INCREMENT PRIMARY KEY, 
UserID INT NOT NULL,
MovieID INT NOT NULL,
RATING INT NOT NULL,
ReviewText TEXT,
ReviewDate DATE NOT NULL 
);