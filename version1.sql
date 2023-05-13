CREATE DATABASE SpotifyApp;

USE SpotifyApp;

CREATE TABLE User (
    Email VARCHAR(255) PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL
);

CREATE TABLE Artist (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    DateOfBirth DATE NOT NULL
);

CREATE TABLE Genre (
    Name VARCHAR(255) PRIMARY KEY
);

CREATE TABLE Song (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Artist_ID INT,
    Duration INT NOT NULL,
    Explicit BOOLEAN NOT NULL,
    Link VARCHAR(255),
    FOREIGN KEY (Artist_ID) REFERENCES Artist(ID)
);

CREATE TABLE Genre_Song (
    Song_ID INT,
    Genre_Name VARCHAR(255),
    PRIMARY KEY (Song_ID, Genre_Name),
    FOREIGN KEY (Song_ID) REFERENCES Song(ID),
    FOREIGN KEY (Genre_Name) REFERENCES Genre(Name)
);

CREATE TABLE Playlist (
    User_Email VARCHAR(255),
    Song_ID INT,
    Song_Order INT,
    PRIMARY KEY (User_Email, Song_ID),
    FOREIGN KEY (User_Email) REFERENCES User(Email),
    FOREIGN KEY (Song_ID) REFERENCES Song(ID)
);

CREATE TABLE Favorites (
    User_Email VARCHAR(255),
    Song_ID INT,
    PRIMARY KEY (User_Email, Song_ID),
    FOREIGN KEY (User_Email) REFERENCES User(Email),
    FOREIGN KEY (Song_ID) REFERENCES Song(ID)
);
