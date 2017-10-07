tests
testRangeFaceting
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host: '172.16.208.136' port:8983 username:'admin' password:'admin'.
	solr core:'techproducts'.
	
	"http://localhost:8983/solr/select?q=*:*&rows=0&facet=true&facet.range=price&   facet.range.start=0&facet.range.end=400&facet.range.gap=100"
	
	solr dismaxQuery:[:query|
			query
				q:'*'->'*'; 
				rows:8;
				facet:[:f|
					f  range:[:r|
									r 	<-'price';
										start:0;
										end:400;
										gap:100]]];
			searchAndCallback:[:r| r inspect].	
