tests
testQueryFaceting
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host: self defaultHost  port:8983 username:'admin' password:'admin'.

	
	solr  
		core:'techproducts';
		dismaxQuery:[:query|
			query
				q:'*'; 
				facet:[:f|
					f  field:'manu';
		 				query: #price->('*' TO:100);
						query: #price->(100 TO:200);
						query: #price->(200 TO:300);
						query: #price->(300 TO:400);
						query: #price->(400 TO:500);
						query: #price->(500 TO:'*')]]
		callback:[:r| r inspect].	
