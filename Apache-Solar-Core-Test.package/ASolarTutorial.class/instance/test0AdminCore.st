tests
test0AdminCore
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host:self defaultHost  port:8983 userName:'admin' password:'admin'.

	
	solr cores: [:cores|
				cores
					name: 'demo';
					configSet:#basic_configs;
					create 
					 ];
			callback:[:r| r inspect].	
