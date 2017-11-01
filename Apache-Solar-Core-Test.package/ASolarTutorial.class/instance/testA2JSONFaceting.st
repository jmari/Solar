tests
testA2JSONFaceting

	
	| solr |


	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.

		
	solr 
			core:'demo';
			query:[:q| q 
				q: ('*'->'*');
				jsonFacet: { #top_authors -> { #terms -> { #field -> #author_s. #limit -> 5 } } }];
			debug;
			callback:[:result| result inspect].
			