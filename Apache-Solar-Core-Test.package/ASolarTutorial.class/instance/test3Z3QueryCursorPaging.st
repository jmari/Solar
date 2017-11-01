tests
test3Z3QueryCursorPaging

	
	| solr cursorMark|


	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.

		
	solr 
			core:'demo';
			query:[:query| 
						query 
							q: #id->'book*';
							sort: {#pubyear_i-> #desc.
									#id->#asc};
							fl: #(#title_t #pubyear_i);
							rows:5;
							cursorMark:'*'];
			callback:[:result| result inspect.cursorMark := result nextCursorMark].
			
	solr 
			core:'demo';
			query:[:query| 
						query 
							q: #id->'book*';
							sort: {#pubyear_i-> #desc.
									#id->#asc};
							fl: #(#title_t #pubyear_i);
							rows:5;
							cursorMark:cursorMark];
			callback:[:result| result inspect].