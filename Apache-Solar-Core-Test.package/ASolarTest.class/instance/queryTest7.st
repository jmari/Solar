as yet unclassified
queryTest7
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host: '172.16.208.136' port:8983 username:'admin' password:'admin'.
	solr core:'techproducts'.
	solr edismaxQuery:[:query|
				query 
					q: 'hello';
					pf:'text';
					boost:'popularity' ];
			callback:[:r| r inspect].
			
	solr edismaxQuery:[:query|
				query 
					q: #('ipos' 'OR' 'video')];
			callback:[:r| r inspect].
			
			
	solr edismaxQuery:[:query|
				query 
					q:'video';
					qf: {  'features'->20.0.
							 'text' -> 0.3};
					sort: {  'div(popularity,price)'-> 'desc'.
								'score' -> 'desc'}];
			callback:[:r| r inspect]
