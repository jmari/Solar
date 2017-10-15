tests
testTerms
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host:self defaultHost  port:8983 userName:'admin' password:'admin'.

	
	solr 
			core:'techproducts';
			terms: [:terms|
				terms
					fl: 'name']
			callback:[:r| r inspect].	
