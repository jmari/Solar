tests
testFacetPivot
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host: self defaultHost  port:8983 username:'admin' password:'admin'.
	solr core:'techproducts'.
	solr query:[:query|
		query
			q:'*.*'; 
			facet:[ :facet|
				facet 
					query: { {#tag->#q1} asASLocalParameters.
								'manufacturedate_dt'->'[2006-01-01T00:00:00Z TO NOW]'}; 
					query: { {#tag->#q1} asASLocalParameters.
								#price->(0 TO: 100)}; 
					pivot:[:pivot| pivot <- {{ #query->#q1} asASLocalParameters.
														  'cat,inStock'}]]]
		callback:[:r| r inspect].	
			
