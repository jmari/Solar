tests
test5ProximityQuery

	| solr |

	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.
		
	solr 
			core:'demo';
			query:[:query| 
						query 
							q: #title_t-> ('Way Kings'~1);
							fl: #(#author_s #title_t)];
			callback:[:result| result inspect];
			query:[:query| 
						query 
							q: #title_t-> ('Way Kings'~7);
							fl: #(#author_s #title_t)];
			callback:[:result| result inspect]
			