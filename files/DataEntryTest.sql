create database if not exists Streaming;

use Streaming;

truncate table Customer;
truncate table StreamingPlatform;
truncate table Streams;


insert into Customer values(1,"David","Perrone","dperrone@gmail.com");
insert into Customer values(2,"Joey","Buono","jb@gmail.com");
select * from Customer;

insert into StreamingPlatform values(1,"Netflix",10.0);
insert into StreamingPlatform values(2,"Hulu",5.0);
insert into StreamingPlatform values(3,"Amazon",15.0);
insert into StreamingPlatform values(4,"AppleTV",12.0);

insert into Streams values(1,1);
insert into Streams values(1,2);
insert into Streams values(1,3);

insert into Streams values(2,4);
