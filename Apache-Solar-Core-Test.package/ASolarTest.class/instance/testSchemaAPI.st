tests
testSchemaAPI
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host: self defaultHost port:8983 userName:'admin' password:'admin'.

	
	solr 
			core:'techproducts';
			schema:[:s| s current] callback:[:r| r inspect];
			schema:[:s| s version] callback:[:r| r inspect];	
			schema:[:s| s similarity ] callback:[:r| r inspect];	
			schema:[:s| s uniqueKey] callback:[:r| r inspect];	
			schema:[:s| s defaultOperatorForQueryParser ] callback:[:r| r inspect];	
			schema:[:s| s fields ] callback:[:r| r inspect];	
			schema:[:s| s field:'author';
							  includeDynamic ] callback:[:r| r inspect];	
			
			modifySchema:{'d-field'->{
       			'name'->'sell-by'.
       			'type'->'tdate'.
       			'stored'->true }}
			callback:	[:r| r inspect]