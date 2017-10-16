tests
testAdminCollections
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host:self defaultHost  port:8983 userName:'admin' password:'admin'.

	solr collections: [:collections|
				collections
					name: 'smalltalk-collection';
					numShards:2;
					replicationFactor:1;
					create 
					 ];
			callback:[:r| r inspect].	
