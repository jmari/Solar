tests
test8RangeQuery

	| solr |

	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.
	"boost operator ^ is ! in smalltalk"	
	solr 
			core:'demo';
			query:[:query| 
						query 
							q:{
								#pubyear_i->('1965'!=1).
								#title_t -> ('Kings'!=1)};
							fl: #(#author_s #title_t #pubyear_i)];
			callback:[:result| result inspect].