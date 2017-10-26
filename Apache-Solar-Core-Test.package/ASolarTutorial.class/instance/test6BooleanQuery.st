tests
test6BooleanQuery

	| solr |

	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.
		
	solr 
			core:'demo';
			query:[:query| 
						query 
							q: #title_t-> {'Way'PLUS. 'added'} ;
							fl: #(#author_s #title_t)];
			callback:[:result| result inspect];
			query:[:query| 
						query 
							q: #title_t-> {'Way'PLUS. 'Kings'PLUS. 'added'MINUS} ;
							fl: #(#author_s #title_t)];
			callback:[:result| result inspect].
			