tests
testSelectAll
	
	| repo doc objects doc2 objects2  |
	
	repo := ASRepository userName:'admin' password:'admin'.

	doc := ASVoyageDomainObject new. 
	doc2 := ASVoyageDomainObject2 new. 
	1 to:20 do:[: i |
				repo save: ( doc firstName:i ;copy )].
			
	1 to:20 do:[: i |
				repo save: ( doc2 firstName:i asString;copy )].
	"database is full of objects...select all of the objects"
	objects :=repo selectAll: ASVoyageDomainObject.
	objects2 :=repo selectAll: ASVoyageDomainObject2.
	self assert: objects size equals:20.
	self assert: objects2 size equals:20.



	
