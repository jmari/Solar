adding
testAddJSON

	
	| solr docs |
	docs := OrderedCollection new.
	1 to:10 do:[:each| docs add: { 'id' -> (each + 100000).
											'title_t' -> ('Title'  , each asString).
											'description_t' -> ('Text ' , each asString ,'Alice')} asSCJsonObject].

	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.
	solr 
			core:'techproducts';
			autoCommit;
			add: docs asArray;
			callback:[:result| result inspect]