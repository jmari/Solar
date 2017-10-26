tests
test9FilterQuery
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.
		
	solr  
		core:'demo';
		query:[ :query|
				query q: #title_t->'*'; 
						fq: #pubyear_i->(1960 TO:1995)];
			callback:[:r| r inspect]