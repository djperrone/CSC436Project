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


