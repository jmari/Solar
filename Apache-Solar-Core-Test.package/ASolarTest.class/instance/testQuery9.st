tests
testQuery9
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host:self defaultHost  port:8983 username:'admin' password:'admin'.
	solr core:'techproducts'.
	
	solr edismaxQuery:[:query|
				query 
					q: { 
							{ 	#complexphrase.
							 	#inOrder->true}.
							#name -> '"(john jon jonathan~) peters*"'.
					 	} ]
			callback:[:r| r inspect].	
