create database if not exists Streaming;

use Streaming;

drop table Customer;
drop table streamingplatform;
drop table SubscribesTo;

create table if not exists Customer (
customerID int unique not null,
customerFName varchar(20),
customerLName varchar(20),
customerEmail varChar(20) unique,
-- streamingPlatformID int,
Primary key (customerID)
);

create table if not exists StreamingPlatform (
streamingPlatformID int unique not null,
streamingPlatformName varChar(20),
streamingPlatformPrice float,
Primary Key(streamingPlatformID)
);

create table if not exists SubscribesTo (
customerID int,
streamingPlatformID int,
primary key(customerID, streamingPlatformID)
);