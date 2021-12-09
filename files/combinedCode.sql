-- createTables.sql

create database if not exists Streaming;

use Streaming;

drop table Customer;
drop table streamingplatform;
drop table SubscribesTo;

create table if not exists Customer (
customerID int unique not null,
customerFName varchar(20),
customerLName varchar(20),
customerEmail varChar(20) unique,
-- streamingPlatformID int,
Primary key (customerID)
);

create table if not exists StreamingPlatform (
streamingPlatformID int unique not null,
streamingPlatformName varChar(20),
streamingPlatformPrice float,
Primary Key(streamingPlatformID)
);

create table if not exists SubscribesTo (
customerID int,
streamingPlatformID int,
primary key(customerID, streamingPlatformID)
);

-- createVideo.sql

use Streaming;

alter table TVShow drop constraint FK_TVShowToVideo;
alter table Movie drop constraint FK_MovieToVideo;
   
 drop table if exists Video;
 drop table if exists Movie;
 drop table if exists TVShow;
 drop table if exists Streams;

create table if not exists Video(
videoID int unique not null,
videoName varChar(50),
videoUserRating float,
videoParentalRating varChar(10),
genre varChar(20),
primary key(videoID)
);

alter table Video add constraint CK_UserRating check (videoUserRating >= 0.0 and videoUserRating <= 5.0);


create table if not exists Movie (
	movieID int unique not null,   
    directorName varChar(50),
    movieRuntime float,
    primary key(movieID)
);

create table if not exists TVShow(
tvShowID int unique not null,
numEpisodes int,
numSeasons int,
primary key(tvShowID)
); 

alter table Movie add constraint FK_MovieToVideo  Foreign key(movieID) references Video(videoID) on update cascade on delete cascade;
alter table TVShow add constraint FK_TVShowToVideo Foreign key(tvShowID) references Video(videoID) on update cascade on delete cascade;

create table if not exists Streams(
	streamingPlatformID int,
    videoID int,
    primary key(videoID, streamingPlatformID)
);

-- DataEntry.sql

use Streaming;

truncate table Customer;
truncate table StreamingPlatform;
truncate table SubscribesTo;


insert into StreamingPlatform values(1,"Netflix",8.99);
insert into StreamingPlatform values(2,"Hulu",12.99);
insert into StreamingPlatform values(3,"HBO",5.99);
insert into StreamingPlatform values(4,"Disney Plus",15.99);
insert into StreamingPlatform values(5,"Amazon Prime Video",13.99);


insert into SubscribesTo values(1,1);
insert into SubscribesTo values(1,2);
insert into SubscribesTo values(1,4);
insert into SubscribesTo values(2,5);
insert into SubscribesTo values(2,1);
insert into SubscribesTo values(3,3);
insert into SubscribesTo values(4,5);
insert into SubscribesTo values(4,2);
insert into SubscribesTo values(5,5);

insert into SubscribesTo values(5,2);
insert into SubscribesTo values(6,1);
insert into SubscribesTo values(7,3);
insert into SubscribesTo values(7,4);

insert into SubscribesTo values(7,5);
insert into SubscribesTo values(7,1);
insert into SubscribesTo values(8,2);
insert into SubscribesTo values(8,4);
insert into SubscribesTo values(9,5);
insert into SubscribesTo values(9,3);
insert into SubscribesTo values(10,1);
insert into SubscribesTo values(10,2);

Insert into Customer values(1,"Bob", "Smith", "Bob4254@gmail.com");
Insert into Customer values(2,"Jane", "Doe", "Jdoe5@gmail.com");
Insert into Customer values(3,"Michael", "Donalds", "MikeDon@hotmail.com");
Insert into Customer values(4,"Charlie", "Welch", "Char25@gmail.com");
Insert into Customer values(5,"Kayla", "Murrey", "Kayla525@gmail.com");
Insert into Customer values(6,"Damien", "French", "Dam32@aol.com");
Insert into Customer values(7,"Jodie", "Swanson", "Jodie52@aol.com");
Insert into Customer values(8,"Oliver", "Wade", "Oliver5@gmail.com");
Insert into Customer values(9,"Neve", "Love", "Neve2@gmail.com");
Insert into Customer values(10,"Danielle", "Fernandez", "DanDernan@gmail.com");


-- update.sql

use Streaming;

select * from Movie;
update  Video set videoID = 20 where videoID = 1;
select * from Movie;

update Video set genre = null where videoID > 1 and videoID < 5;
select * from Video;

select * from Video right join Movie on videoID = movieID;

-- alter table Video add constraint CK_UserRating check (videoUserRating >= 0.0 and videoUserRating <= 5.0); -- added already in createVideo
insert into Video values(100,"The asdas",5.6,"R","Drama");

-- nested query to select movies
select * from Video where videoID = (select movieID from Movie where videoID = movieID);

-- list of all directors and their movies
create view movieDirector as
select  Movie.directorName, Video.videoName, Video.genre from Video join Movie on Video.videoID = Movie.movieID;
select * from movieDirector;

-- list netflix shows/movie
create view Netflix as
select streamingPlatform.streamingPlatformName, Video.videoName  from Video join StreamingPlatform join Streams on video.videoID = Streams.videoID and streamingPlatform.streamingPlatformID = Streams.streamingPlatformID and streamingPlatform.streamingPlatformName = "Netflix";
select * from Netflix;

create view customerStreams as
select Customer.customerFName, StreamingPlatform.streamingPlatformName from Customer join StreamingPlatform join SubscribesTo on Customer.customerID = SubscribesTo.customerID and StreamingPlatform.streamingPlatformID = SubscribesTo.StreamingPlatformID ;-- group by Customer.customerFName;
select * from customerStreams;


-- videoDataEntry.sql

use Streaming;

insert into Video values(1,"The Dark Knight",4.5,"PG-13","Action");
insert into Video values(2,"The Godfather",4.2,"R","Drama");
insert into Video values(3, "Lord of the Rings", 4.7, "PG-13", "Action");
insert into Video values(4, "Saw", 3.8, "R", "Horror");
insert into Video values(5, "Toy Story", 4.1, "G", "Adventure");
insert into Video values(6, "The Hangover", 4.1, "R", "Comedy");
insert into Video values(7, "The Thing", 4.5, "R", "Horror");
insert into Video values(8, "V for Vendetta", 3.5, "R", "Action");
insert into Video values(9, "Game of Thrones", 4.1, "R", "Action");
insert into Video values(10, "Breaking Bad", 4.8, "R", "Crime");
insert into Video values(11, "You", 3.5, "R", "Comedy");
insert into Video values(12, "Seinfeld",2.1, "G", "Comedy");
insert into Video values(13, "Cowboy Bebop", 5, "PG-13", "Action");
insert into Video values(14, "The Walking Dead", 3.8, "R", "Horror");
insert into Video values(15, "The Sopranos", 4.5, "R", "Crime");
insert into Video values(16, "Law & Order", 4.1, "PG-13", "Crime");

Insert into Movie values(1, "Christopher Nolan", 213);
Insert into Movie values(2, "Francis Ford Copolla", 195);
Insert into Movie values(3, "Peter Jackson", 204);
Insert into Movie values(4, "James Wan", 150);
Insert into Movie values(5, "John Lasseter", 135);
Insert into Movie values(6, "Todd Phillips", 164);
Insert into Movie values(7, "John Carpenter", 157);
Insert into Movie values(8, "James McTeigue", 187);

Insert into TVShow values(9, 8, 73);
Insert into TVShow values(10, 5, 63);
Insert into TVShow values(11, 2, 30);
Insert into TVShow values(12, 9, 180);
Insert into TVShow values(13, 1, 23);
Insert into TVShow values(14, 11, 147);
Insert into TVShow values(15, 6, 86);
Insert into TVShow values(16, 20, 456);

insert into Streams values(1,1);
insert into Streams values(2,2);
insert into Streams values(1,4);
insert into Streams values(1,5);
insert into Streams values(1,6);
insert into Streams values(1,8);
insert into Streams values(1,11);
insert into Streams values(1,13);
insert into Streams values(1,16);
insert into Streams values(2,3);
insert into Streams values(2,4);
insert into Streams values(2,6);
insert into Streams values(2,7);
insert into Streams values(2,8);
insert into Streams values(2,11);
insert into Streams values(2,13);
insert into Streams values(2,14);
insert into Streams values(2,1);
insert into Streams values(2,15);
insert into Streams values(2,16);
insert into Streams values(3,1);
insert into Streams values(3,3);
insert into Streams values(3,4);
insert into Streams values(3,5);
insert into Streams values(3,6);
insert into Streams values(3,8);
insert into Streams values(3,9);
insert into Streams values(3,10);
insert into Streams values(3,11);
insert into Streams values(3,12);
insert into Streams values(4,4);
insert into Streams values(4,5);
insert into Streams values(4,7);
insert into Streams values(4,8);
insert into Streams values(4,9);
insert into Streams values(4,12);
insert into Streams values(4,15);
insert into Streams values(4,16);
insert into Streams values(5,5);
insert into Streams values(5,7);
insert into Streams values(5,9);
insert into Streams values(5,10);
insert into Streams values(5,12);
insert into Streams values(5,13);
insert into Streams values(5,15);
insert into Streams values(5,16);
insert into Streams values(5,1);

-- select * from Movie;
 select * from Video;

-- select Video.videoName, Movie.directorName from Movie join Video ON Movie.movieID = Video.videoID where Movie.movieRuntime > 150;

-- select Video.videoName, streamingPlatform.streamingPlatformName from Video join StreamingPlatform join Streams on video.videoID = Streams.videoID and streamingPlatform.streamingPlatformID = Streams.streamingPlatformID;


