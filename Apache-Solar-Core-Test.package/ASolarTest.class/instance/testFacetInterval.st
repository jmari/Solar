tests
testFacetInterval
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host: self defaultHost  port:8983 username:'admin' password:'admin'.
	solr core:'techproducts'.
	solr 
		query:[:q| q 
						q:'*:*';
						facet:[ :facet|facet interval:'price']];
		f:[:f| 
			f  fieldName:#price;
				facet:[:facet| 
					facet interval:[:interv| 
						interv 	set:'[0,100]';
									set:'[100,200]']]];					
		searchAndCallback:[:r| r inspect].	
			
