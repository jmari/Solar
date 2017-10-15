tests
testSingletonSelectAll
	
	| repo doc objects doc2 objects2  |
	
	repo := ASRepository userName:'admin' password:'admin'.
	repo enableSingleton.
	
	doc := ASVoyageDomainObject new. 
	doc2 := ASVoyageDomainObject2 new. 
	1 to:20 do:[: i |
				( doc firstName:i ;copy ) save].
			
	1 to:20 do:[: i |
				( doc2 firstName:i asString;copy ) save].
	"database is full of objects...select all of the objects"
	objects := ASVoyageDomainObject selectAll.
	objects2 := ASVoyageDomainObject2 selectAll.
	objects explore.
	objects2 explore.



	
