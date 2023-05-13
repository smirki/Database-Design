ALTER TABLE User
ADD COLUMN Account_Type ENUM('free', 'standard', 'premium') NOT NULL;

CREATE TABLE Playlists (
    Playlist_ID INT AUTO_INCREMENT PRIMARY KEY,
    User_Email VARCHAR(255),
    Playlist_Name VARCHAR(255) NOT NULL,
    FOREIGN KEY (User_Email) REFERENCES User(Email)
);

ALTER TABLE Playlist
DROP FOREIGN KEY User_Email;

ALTER TABLE Playlist
ADD COLUMN Playlist_ID INT,
ADD FOREIGN KEY (Playlist_ID) REFERENCES Playlists(Playlist_ID);

ALTER TABLE Playlist
DROP COLUMN User_Email;
