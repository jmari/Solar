tests
test1AddJSON

	
	| solr doc |
	doc:={'id' -> 'book0'.
   			'author_s'-> 'Brandon Sanderson'.
    		'title_t' -> 'The Way of Kings' }.

	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.
	
	solr 
			core:'demo';
			autoCommit;
			add: doc;
			callback:[:result| result inspect].
		
	solr 
			core:'demo';
			query:[:q| q q: 'id:book0'];
			callback:[:result| result inspect].
			