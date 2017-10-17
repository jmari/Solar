tests
testSuggestQuery
	"http://localhost:8983/solr/techproducts/suggest?suggest=true&suggest.build=true&suggest.dictionar
  y=mySuggester&wt=json&suggest.q=elec"
	|solr|	
	solr := ASolarClient host:self defaultHost  port:8983 userName:'admin' password:'admin'.
	
	solr  core:'techproducts';
			suggest:[:suggest|
				suggest 
					build;
					dictionary:'mySuggester';
					q:'elec'];
			callback:[:r| r inspect].	
