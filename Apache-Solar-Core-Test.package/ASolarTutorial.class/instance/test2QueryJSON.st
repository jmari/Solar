tests
test2QueryJSON

	
	| solr |


	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.

		
	solr 
			core:'demo';
			query:[:q| q q: 'id'->'book1'];
			callback:[:result| result inspect].
			