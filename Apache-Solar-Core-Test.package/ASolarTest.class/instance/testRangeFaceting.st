tests
testRangeFaceting
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.
	
	"http://localhost:8983/solr/select?q=*:*&rows=0&facet=true&facet.range=price&   facet.range.start=0&facet.range.end=400&facet.range.gap=100"
	
	solr 	  
		core:'techproducts'; 
		dismaxQuery:[:query|
			query
				q:'*'->'*'; 
				rows:8;
				facet:[:f|
					f  range:[:r|
									r 	<-'price';
										start:0;
										end:400;
										gap:100]]];
		callback:[:r| r inspect].	
