as yet unclassified
queryTest10
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host: '172.16.208.136' port:8983 username:'admin' password:'admin'.
	solr core:'techproducts'.
	
	solr query:[:query|
				query 
					q: { 
							{ 	#field.
								#f->#myField}.
								#Foo.
								#Bar }
			];
			callback:[:r| r inspect].	
