adding
addFileTest
	
	| solr |


	solr := ASolarClient host: '172.16.208.136' port:8983 username:'admin' password:'admin'.
	solr 
			core:'techproducts';
			autoCommit;
			addFile: 'DB5.pdf' asFileReference  callback:[:result| result inspect]