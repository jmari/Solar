tests
testRerankQuery
	"  q=greetings&rq={!rerank reRankQuery=$rqq reRankDocs=1000 reRankWeight=3}&rqq=(hi+hello+hey+hiya)"
	|solr|	
	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.
	solr core:'techproducts';
		  query:[:query|
				query 
					q: 'greetings';
					rq: ({	#rerank. 
								#reRankQuery->'$rqq'.
								#reRankDocs->1000.
								#reRankWeight->3} asASLocalParameters);
					at:#rqq put:'(hi+hello+hey+hiya)'
					];
			callback:[:r| r inspect].		
	"we can add 	a new parameter using at: put:"
