tests
test3Z2QueryPaging

	
	| solr |


	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.

		
	solr 
			core:'demo';
			query:[:query| 
						query 
							q: #id->'book*';
							sort: {#pubyear_i-> 'desc'};
							fl: #(#title_t #pubyear_i);
							start:3;
							rows:2];
			callback:[:result| result inspect].
			