use Streaming;

truncate table Customer;
truncate table StreamingPlatform;
truncate table SubscribesTo;


insert into StreamingPlatform values(1,"Netflix",8.99);
insert into StreamingPlatform values(2,"Hulu",12.99);
insert into StreamingPlatform values(3,"HBO",5.99);
insert into StreamingPlatform values(4,"Disney Plus",15.99);
insert into StreamingPlatform values(5,"Amazon Prime Video",13.99);


insert into SubscribesTo values(1,1);
insert into SubscribesTo values(1,2);
insert into SubscribesTo values(1,4);
insert into SubscribesTo values(2,5);
insert into SubscribesTo values(2,1);
insert into SubscribesTo values(3,3);
insert into SubscribesTo values(4,5);
insert into SubscribesTo values(4,2);
insert into SubscribesTo values(5,5);

insert into SubscribesTo values(5,2);
insert into SubscribesTo values(6,1);
insert into SubscribesTo values(7,3);
insert into SubscribesTo values(7,4);

insert into SubscribesTo values(7,5);
insert into SubscribesTo values(7,1);
insert into SubscribesTo values(8,2);
insert into SubscribesTo values(8,4);
insert into SubscribesTo values(9,5);
insert into SubscribesTo values(9,3);
insert into SubscribesTo values(10,1);
insert into SubscribesTo values(10,2);

Insert into Customer values(1,"Bob", "Smith", "Bob4254@gmail.com");
Insert into Customer values(2,"Jane", "Doe", "Jdoe5@gmail.com");
Insert into Customer values(3,"Michael", "Donalds", "MikeDon@hotmail.com");
Insert into Customer values(4,"Charlie", "Welch", "Char25@gmail.com");
Insert into Customer values(5,"Kayla", "Murrey", "Kayla525@gmail.com");
Insert into Customer values(6,"Damien", "French", "Dam32@aol.com");
Insert into Customer values(7,"Jodie", "Swanson", "Jodie52@aol.com");
Insert into Customer values(8,"Oliver", "Wade", "Oliver5@gmail.com");
Insert into Customer values(9,"Neve", "Love", "Neve2@gmail.com");
Insert into Customer values(10,"Danielle", "Fernandez", "DanDernan@gmail.com");



