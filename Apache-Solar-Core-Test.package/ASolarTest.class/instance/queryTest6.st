as yet unclassified
queryTest6
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host: '172.16.208.135' port:8983 username:'admin' password:'admin'.
	solr core:'techproducts'.
	
	solr dismaxQuery:[:query|
				query 
					q: 'video';
					fl: #('*' 'score')];
			searchAndCallback:[:r| r inspect].
			
	solr dismaxQuery:[:query|
				query 
					q: 'video';
					qf: {
							#features ->20.0.
							#text -> 0.3	}];
			searchAndCallback:[:r| r inspect].
			
	solr dismaxQuery:[:query|
				query 
					q: 'video';
					fl: #( #name #score #inStock);
					qt: #instock ];
			searchAndCallback:[:r| r inspect].
			
	solr dismaxQuery:[:query|
				query 
					q: #('belkin' 'ipod');
					debugQuery ];
			searchAndCallback:[:r| r inspect]
