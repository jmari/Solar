as yet unclassified
queryFacetTest
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host: '172.16.208.136' port:8983 username:'admin' password:'admin'.
	solr core:'techproducts'.
	
	solr dismaxQuery:[:query|
			query
				q:'camera'; 
				facet:[:f|
					f  field:'manu';
						field:'camera_type';
		 				query: #price->('*' TO:100);
						query: #price->(100 TO:200);
						query: #price->(200 TO:300);
						query: #price->(300 TO:400);
						query: #price->(400 TO:500);
						query: #price->(500 TO:'*')]];
			searchAndCallback:[:r| r inspect].	
