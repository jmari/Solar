tests
test4QueryDemo

	| solr |

	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.
		
	solr 
			core:'demo';
			debug;
			query:[:query| 
						query 
							q: 'title_t'->'black';
							fl: #(#author_s #title_t)];
			callback:[:result| result inspect]
			