tests
test3AddCSV

	
	| solr rows |
	rows:= self csvContent.

	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.
	
	solr 
			core:'demo';
			addCSV: rows;
			autoCommit;
			header;
			overwrite;
			callback:[:result| result inspect]