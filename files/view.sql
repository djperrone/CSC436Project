use Streaming;
    
create view movieDirector as
select  Movie.directorName, Video.videoName, Video.genre from Video join Movie on Video.videoID = Movie.movieID;
select * from movieDirector;

-- drop view Netflix;
create view Netflix as
select streamingPlatform.streamingPlatformName, Video.videoName  from Video join StreamingPlatform join Streams on video.videoID = Streams.videoID and streamingPlatform.streamingPlatformID = Streams.streamingPlatformID and streamingPlatform.streamingPlatformName = "Netflix";
select * from Netflix;