tests
test2AddJSON

	
	| solr doc |
	doc:={'id' -> 'book1'.
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
			query:[:q| q q: 'id:book1'];
			callback:[:result| result inspect].
			