adding
testAddPdfFile
	
	| solr |


	solr := ASolarClient host: self defaultHost  port:8983 username:'admin' password:'admin'.
	solr 
			core:'smalltalk-core';
			autoCommit;
			addFile: 'DB5.pdf' asFileReference  callback:[:result| result inspect]