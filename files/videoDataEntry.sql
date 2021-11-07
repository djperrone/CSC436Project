use Streaming;

-- insert into Video values(1,"The Dark Knight",4.5,"PG-13","Action");
-- insert into Movie values(1,"Christopher Nolan",213);

-- insert into Video values(2,"The Godfather",5.2,"R","Drama");

-- insert into Video values(2,"The Godfather",4.2,"R","Drama");
-- insert into Movie values(2,"Francis Ford Coppola",195);

insert into Video values(1,"The Dark Knight",4.5,"PG-13","Action");
insert into Video values(2,"The Godfather",5.2,"R","Drama");
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

select * from Movie;
select * from Video;

select Video.videoName, Movie.directorName from Movie join Video ON Movie.movieID = Video.videoID where Movie.movieRuntime > 150;

select Video.videoName, streamingPlatform.streamingPlatformName from Video join StreamingPlatform join Streams on video.videoID = Streams.videoID and streamingPlatform.streamingPlatformID = Streams.streamingPlatformID;