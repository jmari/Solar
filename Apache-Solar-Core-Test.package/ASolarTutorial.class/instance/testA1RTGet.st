tests
testA1RTGet
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.
		
	solr  
		core:'demo';
		realTimeGet: #(#book1 #book2);
		callback:[:r| r inspect]