adding
addTest
	
	| solr docs |
	docs := OrderedCollection new.
	1 to:10 do:[:each| docs add: { 'id' -> (25 + each).
											'title_t' -> ('Title'  , each asString).
											'description_t' -> ('Text ' , each asString ,'Alice')} asSCJsonObject].

	solr := ASolarClient host: '172.16.208.136' port:8983 username:'admin' password:'admin'.
	solr 
			core:'techproducts';
			autoCommit;
			add: docs asArray callback:[:result| result inspect]