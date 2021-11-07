alter table TVShow drop constraint FK_TVShowToVideo;
-- alter table Video drop constraint FK_VideoToTVShow;
alter table Movie drop constraint FK_MovieToVideo;
-- alter table Video drop constraint FK_VideoToMovie;
   
 drop table if exists Video;
 drop table if exists Movie;
 drop table if exists TVShow;
 drop table if exists Streams;