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

