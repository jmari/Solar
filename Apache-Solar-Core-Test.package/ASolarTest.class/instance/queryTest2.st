as yet unclassified
queryTest2
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host: '172.16.208.136' port:8983 username:'admin' password:'admin'.
	solr core:'techproducts'.
	solr dismaxQuery:[:query|
				query q: 'video'; 
						fl: #( #name #score)];
			callback:[:r| r inspect]
