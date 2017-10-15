as yet unclassified
queryTest6
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host: '172.16.208.135' port:8983 userName:'admin' password:'admin'.
	solr core:'techproducts'.
	
	solr dismaxQuery:[:query|
				query 
					q: 'video';
					fl: #('*' 'score')];
			callback:[:r| r inspect].
			
	solr dismaxQuery:[:query|
				query 
					q: 'video';
					qf: {
							#features ->20.0.
							#text -> 0.3	}];
			callback:[:r| r inspect].
			
	solr dismaxQuery:[:query|
				query 
					q: 'video';
					fl: #( #name #score #inStock);
					qt: #instock ];
			callback:[:r| r inspect].
			
	solr dismaxQuery:[:query|
				query 
					q: #('belkin' 'ipod');
					debugQuery ];
			callback:[:r| r inspect]
