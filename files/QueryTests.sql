use Streaming;


select * from Streams;
select Customer.customerFName, StreamingPlatform.streamingPlatformName from Customer join StreamingPlatform join streams on Customer.customerID = Streams.customerID and StreamingPlatform.streamingPlatformID = Streams.StreamingPlatformID;-- group by StreamingPlatform.streamingPlatformName;-- group by Customer.customerFName; -- and StreamingPlatform.streamingPlatformID = Streams.streamingPlatformID group by Customer.customerFName;
