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

--add table movie
CREATE TABLE movie(
MovieID INT AUTO_INCREMENT PRIMARY KEY, 
Title VARCHAR(255) UNIQUE NOT NULL,
Genre VARCHAR(100) NOT NULL, 
ReleaseYear INT NOT NULL,
Duration INT NOT NULL, 
Rating VARCHAR(10) NOT NULL
);

--add FK link between user and subscription table
ALTER TABLE user_plt
ADD CONSTRAINT FK_userSubscription
FOREIGN KEY (SubscriptionID) REFERENCES subscription(SubscriptionID);

--add FK link between review and user table
ALTER TABLE review 
ADD CONSTRAINT FK_userReview
FOREIGN KEY (UserID) REFERENCES user_plt(UserId);

--add FK link between watchhistory and user table
ALTER TABLE watchhistory 
ADD CONSTRAINT FK_userhistory
FOREIGN KEY (UserID) REFERENCES user_plt(UserId);

--add FK link betweeb watchhistory and movie table
ALTER TABLE watchhistory 
ADD CONSTRAINT FK_movieHistory
FOREIGN KEY (MovieID) REFERENCES movie(MovieId);