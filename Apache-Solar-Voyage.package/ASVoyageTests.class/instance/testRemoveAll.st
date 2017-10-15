tests
testRemoveAll
	
	| repo doc objects doc2 objects2  |
	
	repo := ASRepository userName:'admin' password:'admin'.
	
	doc := ASVoyageDomainObject new. 
	doc2 := ASVoyageDomainObject2 new. 
	1 to:20 do:[: i |
				repo save: ( doc firstName:i ;copy )].
			
	1 to:20 do:[: i |
				repo save: ( doc2 firstName:i;copy )].
	"database is full of objects...remove all of them"
	"we need to do garbageCollect because we don't want repo objects cached"
	Smalltalk garbageCollect.
	
	objects :=repo removeAll: ASVoyageDomainObject.
	objects2 :=repo removeAll: ASVoyageDomainObject2.
	objects explore.
	objects2 explore.



	
