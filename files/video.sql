use Streaming;

-- video type "Movie" or "TV Show"

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
	movieID int unique not null references Video,   
    directorName varChar(50),
    movieRuntime float,
    primary key(movieID)
);


create table if not exists TVShow(
tvShowID int unique not null references Video,
numEpisodes int,
numSeasons int,
primary key(tvShowID)
); 
 
 alter table Movie add constraint FK_MovieToVideo  Foreign key(movieID) references Video(videoID) on update cascade on delete cascade;
-- alter table Video add constraint FK_VideoToMovie Foreign key(videoID) references Movie(movieID) on update cascade on delete cascade;
alter table TVShow add constraint FK_TVShowToVideo Foreign key(tvShowID) references Video(videoID) on update cascade on delete cascade;
-- alter table Video add constraint FK_VideoToTVShow Foreign key(videoID) references TVShow(tvShowID) on update cascade on delete cascade;


create table if not exists Streams(
	streamingPlatformID int,
    videoID int,
    primary key(videoID, streamingPlatformID)
);


