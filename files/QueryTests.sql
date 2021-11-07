use Streaming;


select * from Streams;
create view CustomerView as
select Customer.customerFName, StreamingPlatform.streamingPlatformName from Customer join StreamingPlatform join SubscribesTo on Customer.customerID = SubscribesTo.customerID and StreamingPlatform.streamingPlatformID = SubscribesTo.StreamingPlatformID;-- group by StreamingPlatform.streamingPlatformName;-- group by Customer.customerFName; -- and StreamingPlatform.streamingPlatformID = Streams.streamingPlatformID group by Customer.customerFName;
select * from CustomerView;
