tests
test4AddCSV

	
	| solr rows |
	rows:= self csvContent.

	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.
	
	solr 
			core:'samplecsv';
			addCSV: rows;
			autoCommit;
			header;
			overwrite;
			callback:[:result| result inspect]