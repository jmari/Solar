tests
testMoreLikeThis
	"http://localhost:8983/solr/select?q=apache&mlt=true&mlt.fl=manu,cat&mlt.mindf=1&mlt.mintf=1&fl=id,score"
	|solr|	
	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.
	solr 
		core:'techproducts';
		query:[:query|
				query 
					q: 'apache';
					fl:#(#id score);
					mlt:[:mlt|
						mlt 
							fl:#(#manu #cat);
							mindf:1;
							mintf:1]
						];
		callback:[:r| r inspect].
