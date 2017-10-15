tests
testFilter
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.
		
	solr  
		core:'techproducts';
		query:[ :query|
				query q: ('manu'->'A*'); 
						fl: #( #name #manu #inStock #price);
 						qf: {	'name'! 0.2.
								'price'!3.3 };
						fq: #price -> (0 TO: 600);
						mm:2;
						start:0;
						rows:10]
			callback:[:r| r inspect]