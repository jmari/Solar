tests
testAdminCore
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host:self defaultHost  port:8983 username:'admin' password:'admin'.

	
	solr cores: [:cores|
				cores
					name: 'smalltalk-core';
					configSet:#basic_configs;
					create 
					 ]
			callback:[:r| r inspect].	
