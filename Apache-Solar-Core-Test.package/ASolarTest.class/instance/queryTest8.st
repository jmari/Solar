as yet unclassified
queryTest8
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host: '172.16.208.136' port:8983 userName:'admin' password:'admin'.
	solr core:'techproducts'.
	solr edismaxQuery:[:query|
				query 
					q: { 
							{ #boost.
							 	#b->'log(popularity)'}.
							#foo
					 } ];
			callback:[:r| r inspect].
		
	
	solr edismaxQuery:[:query|
				query 
					q: { 
							{ 	#complexphrase.
							 	#inOrder->true}.
							#name -> { 'john'. 'jon'. 'jonathan~' }.
					 } ];
			callback:[:r| r inspect].	
