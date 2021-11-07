use Streaming;
-- nested query to select movies
select * from Video where videoID = (select movieID from Movie where videoID = movieID);