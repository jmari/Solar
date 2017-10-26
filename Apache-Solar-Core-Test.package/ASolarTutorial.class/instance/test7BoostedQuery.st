tests
test7BoostedQuery

	| solr |

	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.
	"boost operator ^ is ! in smalltalk"	
	solr 
			core:'demo';
			query:[:query| 
						query 
							q:#title_t->{'Black'!10.
											#OR.
											'Company'!5 } ;
							fl: #(#author_s #title_t)];
			callback:[:result| result inspect].