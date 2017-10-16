tests
testFacetPivotAsString
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.

	solr  
		core:'techproducts';
		query:[:q|
			q q:'*:*';
			  facet:[ :facet|
					facet 
						query: '{!tag=q1}manufacturedate_dt:[2006-01-01T00:00:00Z TO NOW]'; 
						query: '{!tag=q1}price:[0 TO 100]'; 
						pivot:[:pivot| pivot <-'{!query=q1}cat,inStock']]];
		callback:[:r| r inspect].	

