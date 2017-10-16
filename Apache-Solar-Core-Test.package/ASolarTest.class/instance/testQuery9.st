tests
testQuery9
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host:self defaultHost  port:8983 userName:'admin' password:'admin'.
	
	solr  core:'techproducts';
			edismaxQuery:[:query|
				query 
					q: { 
							{ 	#complexphrase.
							 	#inOrder->true}.
							#name -> '"(john jon jonathan~) peters*"'.
					 	} ];
			callback:[:r| r inspect].	
