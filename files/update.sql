use Streaming;

select * from Movie;
select * from Video;

update  Video set videoID = 20 where videoID = 1;

select * from Movie;
select * from Video;

update Video set genre = null where videoID > 1 and videoID < 5;
select * from Video;

select * from Video right join Movie on videoID = movieID;