CREATE DATABASE MusicApp;
USE MusicApp;
CREATE TABLE Song(SongID int NOT NULL PRIMARY KEY, SongTitle text NOT NULL, Duration time NOT NULL, SongYear int NOT NULL);
INSERT INTO Song VALUES(1, 'The Ringer', '00:05:38', 2018);
INSERT INTO Song VALUES(2, 'Normal', '00:03:43', 2018);
INSERT INTO Song VALUES(3, 'Lucky You', '00:04:05', 2018);
INSERT INTO Song VALUES(4, 'Some Nights', '00:04:37', 2012);
INSERT INTO Song VALUES(5, 'We Are Young', '00:04:10', 2012);
INSERT INTO Song VALUES(6, 'Why Am I the One', '00:04:46', 2012);
INSERT INTO Song VALUES(7, 'Rap God', '00:06:03', 2013);
INSERT INTO Song VALUES(8, 'The Monster', '00:04:10', 2013);
INSERT INTO Song VALUES(9, 'Headlights', '00:05:43', 2013);
INSERT INTO Song VALUES(10, 'American Idiot', '00:02:54', 2004);
INSERT INTO Song VALUES(11, 'Wake me up when September Ends', '00:07:13', 2004);
INSERT INTO Song VALUES(12, 'Holiday/Boulevard of Broken Dreams', '00:08:13', 2004);
INSERT INTO Song VALUES(13, 'Alone', '00:03:20', 2016);
INSERT INTO Song VALUES(14, 'Viva La Vida', '00:05:19', 2008);
INSERT INTO Song VALUES(15, 'Heathens', '00:03:15', 2016);
INSERT INTO Song VALUES(16, 'Complicated', '00:03:04', 2017);
INSERT INTO Song VALUES(17, 'bad guy', '00:03:14', 2019);
CREATE TABLE Genre(GenreID int NOT NULL PRIMARY KEY, GenreName text NOT NULL);
INSERT INTO Genre VALUES(1, 'Hip-Hop');
INSERT INTO Genre VALUES(2, 'Rap');
INSERT INTO Genre VALUES(3, 'Pop');
INSERT INTO Genre VALUES(4, 'Rock');
INSERT INTO Genre VALUES(5, 'Indie');
INSERT INTO Genre VALUES(6, 'Dance/Electronic');
CREATE TABLE belongsTo(SongID int NOT NULL, GenreID int NOT NULL,FOREIGN KEY(SongID) REFERENCES Song(SongID), FOREIGN KEY(GenreID) REFERENCES Genre(GenreID), PRIMARY KEY(SongID, GenreID));
INSERT INTO belongsTo VALUES(1,1);
INSERT INTO belongsTo VALUES(1,2);
INSERT INTO belongsTo VALUES(2,1);
INSERT INTO belongsTo VALUES(2,2);
INSERT INTO belongsTo VALUES(3,1);
INSERT INTO belongsTo VALUES(3,2);
INSERT INTO belongsTo VALUES(4,3);
INSERT INTO belongsTo VALUES(4,5);
INSERT INTO belongsTo VALUES(5,3);
INSERT INTO belongsTo VALUES(6,3);
INSERT INTO belongsTo VALUES(7,1);
INSERT INTO belongsTo VALUES(7,2);
INSERT INTO belongsTo VALUES(8,1);
INSERT INTO belongsTo VALUES(8,2);
INSERT INTO belongsTo VALUES(9,1);
INSERT INTO belongsTo VALUES(9,2);
INSERT INTO belongsTo VALUES(10,5);
INSERT INTO belongsTo VALUES(11,5);
INSERT INTO belongsTo VALUES(12,4);
INSERT INTO belongsTo VALUES(13,6);
INSERT INTO belongsTo VALUES(14,3);
INSERT INTO belongsTo VALUES(15,1);
INSERT INTO belongsTo VALUES(15,2);
INSERT INTO belongsTo VALUES(15,4);
INSERT INTO belongsTo VALUES(16,3);
INSERT INTO belongsTo VALUES(17,5);
CREATE TABLE PremiumPlan(PremiumPlanID int NOT NULL PRIMARY KEY, Plan text NOT NULL, DurationOfPlan int NOT NULL, Price$ int NOT NULL);
INSERT INTO PremiumPlan VALUES(1, 'Value Pack', 1, 5);
INSERT INTO PremiumPlan VALUES(2, 'Value Pack', 3, 10);
INSERT INTO PremiumPlan VALUES(3, 'Value Pack', 6, 15);
INSERT INTO PremiumPlan VALUES(4, 'Value Pack', 9, 20);
INSERT INTO PremiumPlan VALUES(5, 'Value Pack', 12, 25);
CREATE TABLE Artist(ArtistID int NOT NULL PRIMARY KEY, ArtistName text NOT NULL);
INSERT INTO Artist VALUES(1,'Eminem');
INSERT INTO Artist VALUES(2, 'Joyner Lucas');
INSERT INTO Artist VALUES(3, 'fun.');
INSERT INTO Artist VALUES(4, 'Janelle Monáe');
INSERT INTO Artist VALUES(5, 'Rihanna');
INSERT INTO Artist VALUES(6, 'Nate Ruess');
INSERT INTO Artist VALUES(7, 'Green Day');
INSERT INTO Artist VALUES(8, 'Marshmello');
INSERT INTO Artist VALUES(9, 'Coldplay');
INSERT INTO Artist VALUES(10, 'Twenty One Pilots');
INSERT INTO Artist VALUES(11, 'David Guetta');
INSERT INTO Artist VALUES(12, 'Dimitri Vegas');
INSERT INTO Artist VALUES(13, 'Like Mike');
INSERT INTO Artist VALUES(14, 'Billie Eilish');
CREATE TABLE Album(AlbumID int NOT NULL PRIMARY KEY, AlbumTitle text NOT NULL, AlbumYear int NOT NULL);
INSERT INTO Album VALUES(1, 'Kamikaze', 2018);
INSERT INTO Album VALUES(2, 'Some Nights', 2012);
INSERT INTO Album VALUES(3, 'The Marshall Mathers LP2', 2013);
INSERT INTO Album VALUES(4, 'American Idiot', 2004);
CREATE TABLE contains(AlbumID int NOT NULL, SongID int NOT NULL, FOREIGN KEY(AlbumID) REFERENCES Album(AlbumID), FOREIGN KEY(SongID) REFERENCES Song(SongID), PRIMARY KEY(AlbumID,SongID));
INSERT INTO contains VALUES(1,1);
INSERT INTO contains VALUES(1,2);
INSERT INTO contains VALUES(1,3);
INSERT INTO contains VALUES(2,4);
INSERT INTO contains VALUES(2,5);
INSERT INTO contains VALUES(2,6);
INSERT INTO contains VALUES(3,7);
INSERT INTO contains VALUES(3,8);
INSERT INTO contains VALUES(3,9);
INSERT INTO contains VALUES(4,10);
INSERT INTO contains VALUES(4,11);
INSERT INTO contains VALUES(4,12);
CREATE TABLE releasesAn(ArtistID int NOT NULL, AlbumID int NOT NULL, FOREIGN KEY(ArtistID) REFERENCES Artist(ArtistID), FOREIGN KEY(AlbumID) REFERENCES Album(AlbumID), PRIMARY KEY(ArtistID, AlbumID));
INSERT INTO releasesAn VALUES(1,1);
INSERT INTO releasesAn VALUES(3,2);
INSERT INTO releasesAn VALUES(1,3);
INSERT INTO releasesAn VALUES(7,4);
CREATE TABLE writesA(ArtistID int NOT NULL, SongID int NOT NULL, FOREIGN KEY(ArtistID) REFERENCES Artist(ArtistID), FOREIGN KEY(SongID) REFERENCES Song(SongID), PRIMARY KEY(ArtistID, SongID));
INSERT INTO writesA VALUES(1,1);
INSERT INTO writesA VALUES(1,2);
INSERT INTO writesA VALUES(1,3);
INSERT INTO writesA VALUES(2,3);
INSERT INTO writesA VALUES(3,4);
INSERT INTO writesA VALUES(3,5);
INSERT INTO writesA VALUES(4,5);
INSERT INTO writesA VALUES(3,6);
INSERT INTO writesA VALUES(1,7);
INSERT INTO writesA VALUES(1,8);
INSERT INTO writesA VALUES(5,8);
INSERT INTO writesA VALUES(1,9);
INSERT INTO writesA VALUES(6,9);
INSERT INTO writesA VALUES(7,10);
INSERT INTO writesA VALUES(7,11);
INSERT INTO writesA VALUES(7,12);
INSERT INTO writesA VALUES(8,13);
INSERT INTO writesA VALUES(9,14);
INSERT INTO writesA VALUES(10,15);
INSERT INTO writesA VALUES(11,16);
INSERT INTO writesA VALUES(12,16);
INSERT INTO writesA VALUES(13,16);
INSERT INTO writesA VALUES(14,17);
CREATE TABLE UserSubscribesTo(UserID int NOT NULL PRIMARY KEY, UserName text NOT NULL, DateOfBirth date NOT NULL, CountryCode text NOT NULL, TenDigitNumber varchar(10) NOT NULL, DateOfSubscription date, PaymentMethod text, PremiumPlanID int, FOREIGN KEY(PremiumPlanID) REFERENCES PremiumPlan(PremiumPlanID));
INSERT INTO UserSubscribesTo VALUES(1, 'Aryan Chauhan', '2001-08-04', '+91', '8836885789', '2020-05-13', 'UPI', 1);
INSERT INTO UserSubscribesTo VALUES(2, 'Dhruv Datta', '2001-10-30', '+91', '9818896547', null, null, null);
INSERT INTO UserSubscribesTo VALUES(3, 'Aryan Anand', '2001-06-24', '+44', '8368975098', null, null, null);
INSERT INTO UserSubscribesTo VALUES(4, 'Arjun Sharma', '2001-09-05', '+91', '9868723161', '2020-05-15', 'Paytm', 3);
CREATE TABLE followsAn(UserID int NOT NULL, ArtistID int NOT NULL, FOREIGN KEY(UserID) REFERENCES UserSubscribesTo(UserID), FOREIGN KEY(ArtistID) REFERENCES Artist(ArtistID), PRIMARY KEY(UserID, ArtistID));
INSERT INTO followsAn VALUES(1,1);
INSERT INTO followsAn VALUES(1,9);
INSERT INTO followsAn VALUES(1,11);
INSERT INTO followsAn VALUES(2,9);
INSERT INTO followsAn VALUES(2,11);
INSERT INTO followsAn VALUES(4,1);
INSERT INTO followsAn VALUES(4,3);
INSERT INTO followsAn VALUES(4,9);
INSERT INTO followsAn VALUES(4,11);
INSERT INTO followsAn VALUES(4,8);
CREATE TABLE likesAn(UserID int NOT NULL, AlbumID int NOT NULL, FOREIGN KEY(UserID) REFERENCES UserSubscribesTo(UserID), FOREIGN KEY(AlbumID) REFERENCES Album(AlbumID), PRIMARY KEY(UserID, AlbumID));
INSERT INTO likesAn VALUES(1,1);
INSERT INTO likesAn VALUES(1,3);
INSERT INTO likesAn VALUES(2,2);
INSERT INTO likesAn VALUES(2,4);
INSERT INTO likesAn VALUES(3,4);
INSERT INTO likesAn VALUES(4,1);
INSERT INTO likesAn VALUES(4,2);
CREATE TABLE likesA(UserID int NOT NULL, SongID int NOT NULL, FOREIGN KEY(UserID) REFERENCES UserSubscribesTo(UserID), FOREIGN KEY(SongID) REFERENCES Song(SongID), PRIMARY KEY(UserID, SongID));
INSERT INTO likesA VALUES(1,7);
INSERT INTO likesA VALUES(1,8);
INSERT INTO likesA VALUES(1,12);
INSERT INTO likesA VALUES(1,13);
INSERT INTO likesA VALUES(2,2);
INSERT INTO likesA VALUES(2,9);
INSERT INTO likesA VALUES(3,14);
INSERT INTO likesA VALUES(3,16);
INSERT INTO likesA VALUES(4,4);
INSERT INTO likesA VALUES(4,5);
INSERT INTO likesA VALUES(4,7);
CREATE TABLE listensTo(UserID int NOT NULL, SongID int NOT NULL, Frequency int NOT NULL, FOREIGN KEY(UserID) REFERENCES UserSubscribesTo(UserID), FOREIGN KEY(SongID) REFERENCES Song(SongID), PRIMARY KEY(UserID, SongID));
INSERT INTO listensTo VALUES(1, 4, 7);
INSERT INTO listensTo VALUES(1, 7, 14);
INSERT INTO listensTo VALUES(1, 8, 29);
INSERT INTO listensTo VALUES(1, 9, 1);
INSERT INTO listensTo VALUES(1, 10, 24);
INSERT INTO listensTo VALUES(1, 11, 28);
INSERT INTO listensTo VALUES(2, 1, 3);
INSERT INTO listensTo VALUES(2, 2, 16);
INSERT INTO listensTo VALUES(2, 3, 25);
INSERT INTO listensTo VALUES(2, 7, 19);
INSERT INTO listensTo VALUES(2, 8, 25);
INSERT INTO listensTo VALUES(2, 9, 12);
INSERT INTO listensTo VALUES(3, 4, 30);
INSERT INTO listensTo VALUES(3, 5, 34);
INSERT INTO listensTo VALUES(3, 6, 37);
INSERT INTO listensTo VALUES(3, 14, 20);
INSERT INTO listensTo VALUES(3, 17, 10);
INSERT INTO listensTo VALUES(4, 7, 11);
INSERT INTO listensTo VALUES(4, 8, 16);
INSERT INTO listensTo VALUES(4, 9, 2);
INSERT INTO listensTo VALUES(4, 13, 21);
INSERT INTO listensTo VALUES(4, 15, 33);
CREATE TABLE createsAplaylist(PlaylistID int NOT NULL PRIMARY KEY, PlaylistName text NOT NULL, UserID int NOT NULL, FOREIGN KEY(UserID) REFERENCES UserSubscribesTo(UserID));
INSERT INTO createsAplaylist VALUES(1, 'BANGERS', 1);
INSERT INTO createsAplaylist VALUES(2, 'Rap', 1);
INSERT INTO createsAplaylist VALUES(3, 'Rock Classics', 2);
INSERT INTO createsAplaylist VALUES(4, 'EDM', 3);
INSERT INTO createsAplaylist VALUES(5, '2010s', 4);
CREATE TABLE consistsOf(PlaylistID int NOT NULL, SongID int NOT NULL, FOREIGN KEY(PlaylistID) REFERENCES createsAplaylist(PlaylistID), FOREIGN KEY(SongID) REFERENCES Song(SongID), PRIMARY KEY(PlaylistID, SongID));
INSERT INTO consistsOf VALUES(1,8);
INSERT INTO consistsOf VALUES(1,9);
INSERT INTO consistsOf VALUES(1,14);
INSERT INTO consistsOf VALUES(1,15);
INSERT INTO consistsOf VALUES(1,16);
INSERT INTO consistsOf VALUES(2,1);
INSERT INTO consistsOf VALUES(2,2);
INSERT INTO consistsOf VALUES(2,3);
INSERT INTO consistsOf VALUES(2,7);
INSERT INTO consistsOf VALUES(3,10);
INSERT INTO consistsOf VALUES(3,11);
INSERT INTO consistsOf VALUES(3,12);
INSERT INTO consistsOf VALUES(4,13);
INSERT INTO consistsOf VALUES(4,16);
INSERT INTO consistsOf VALUES(5,4);
INSERT INTO consistsOf VALUES(5,5);
INSERT INTO consistsOf VALUES(5,6);
INSERT INTO consistsOf VALUES(5,14);











 






































