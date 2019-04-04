Class {
	#name : #ASVoyageTests,
	#superclass : #TestCase,
	#category : 'Apache-Solar-Voyage-Tests'
}

{ #category : #tests }
ASVoyageTests >> testRemoveAll [
	
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



	

]

{ #category : #tests }
ASVoyageTests >> testSaveObject [
	"NEDD TO MODIFY SCHEMA IN SORLR!!!"
	| repo doc docs |
	
	repo := ASRepository userName:'admin' password:'admin'.
	repo enableSingleton.
	
	doc := 1@1 corner:10@10.
	doc save.
	doc := nil.
	doc := Rectangle selectOne:[:aRect| aRect corner x =  10].
	doc inspect. 
	docs := Rectangle selectMany:[:aRect| aRect corner x =  10].
	docs inspect. 
	doc privateSetCorner: 13@13.
	doc save.



	

]

{ #category : #tests }
ASVoyageTests >> testSelectAll [
	
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



	

]

{ #category : #tests }
ASVoyageTests >> testSelectAllSortBy [
	
	| repo doc objects objects2  |
	
	repo := ASRepository userName:'admin' password:'admin'.

	doc := ASVoyageDomainObject new. 

	1 to:20 do:[: i |
				repo save: ( doc firstName:i ;copy )].
			
	"ordered by the server"
	objects :=repo selectAll: ASVoyageDomainObject sortBy:{#firstName}.
	objects explore.
	"ordered by the pharo"
	objects2 :=repo selectAll: ASVoyageDomainObject sortBy:[:a :b | a firstName > b firstName].
	objects2 explore.



	

]

{ #category : #tests }
ASVoyageTests >> testSingletonCount [
	
	| repo doc objects doc2 objects2  |
	
	repo := ASRepository userName:'admin' password:'admin'.
	repo enableSingleton.
	
	doc := ASVoyageDomainObject new. 
	doc2 := ASVoyageDomainObject2 new. 
	1 to:20 do:[: i |
				( doc firstName:i ;copy ) save].
			
	1 to:15 do:[: i |
				( doc2 firstName:i asString;copy ) save].
	"database is full of objects...select all of the objects"
	
	Smalltalk garbageCollect.
	
	objects := ASVoyageDomainObject count.
	objects2 := ASVoyageDomainObject2 count.
	objects explore.
	objects2 explore.



	

]

{ #category : #tests }
ASVoyageTests >> testSingletonRemoveAll [
	
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
	
	Smalltalk garbageCollect.
	
	objects := ASVoyageDomainObject removeAll.
	objects2 := ASVoyageDomainObject2 removeAll.
	objects explore.
	objects2 explore.



	

]

{ #category : #tests }
ASVoyageTests >> testSingletonSelectAll [
	
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



	

]
