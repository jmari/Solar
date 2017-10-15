tests
testSchemaAPI
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host: self defaultHost port:8983 userName:'admin' password:'admin'.

	
	solr 
			core:'techproducts';
			schemaName: [:r| r inspect];
			schemaVersion: [:r| r inspect];		
			schemaSimilarity: [:r| r inspect];	
			schemaUniqueKey:  [:r| r inspect];	
			schemaDefaultOperatorForQueryParser: [:r| r inspect];
			currentSchema:[:r| r inspect];
			schemaFields: [:r| r inspect];
			schemaFields: 'author' parameters: [:p|p includeDynamic] callback: [:r| r inspect];
			schema:{
    			'add-field'->{
       			'name'->'sell-by'.
       			'type'->'tdate'.
       			'stored'->true }}
			callback:	[:r| r inspect]