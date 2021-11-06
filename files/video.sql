use Streaming;

-- video type "Movie" or "TV Show"

create table if not exists Video(
videoID int unique not null,
primary key(videoID)
);

-- drop table Video;
-- drop table Movie;
create table if not exists Movie (
	movieID int unique not null references Video,    
    primary key(movieID)
);

-- alter table Movie add foreign key(movieID) references Video (videoID) on update cascade on delete cascade;

alter table Movie add constraint FK_MovieToVideo  Foreign key(movieID) references Video(videoID) on update cascade on delete cascade;
alter table Video add constraint FK_VideoToMovie Foreign key(videoID) references Movie(movieID) on update cascade on delete cascade;

create table if not exists TVShow(
tvShowID int unique not null references Video,
primary key(tvShowID)
);
-- alter table TVShow drop constraint FK_TVShow;
-- alter table Video drop constraint FK_VideoToTVShow;
-- drop table if exists TVShow;
-- alter table TVShow add foreign key(tvShowID) references Video (videoID) on update cascade on delete cascade;
alter table TVShow add constraint FK_TVShowToVideo Foreign key(tvShowID) references Video(videoID) on update cascade on delete cascade;
alter table Video add constraint FK_VideoToTVShow Foreign key(videoID) references TVShow(tvShowID) on update cascade on delete cascade;
create table if not exists Streams(
	streamingPlatformID int,
    MovieID int,
    tvShowID int
);


