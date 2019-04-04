Class {
	#name : #ASRepository,
	#superclass : #VORepository,
	#instVars : [
		'indexForClass',
		'uuidProvider',
		'sortingIndexes',
		'maxObjectsInMem',
		'collection',
		'solarClient'
	],
	#category : 'Apache-Solar-Voyage'
}

{ #category : #configuration }
ASRepository class >> defaultHost [
	^ '172.16.208.138'
]

{ #category : #defaults }
ASRepository class >> defaultPort [
	^  8983 
]

{ #category : #'as yet unclassified' }
ASRepository class >> host: aHost port: aPort userName:aUserName password:aPassword [
	| repo |
	repo := self new.
	repo solarClient: (ASolarClient  host: aHost port: aPort userName:aUserName password:aPassword).
	^ repo
]

{ #category : #accessing }
ASRepository class >> platformIdentifier [
	self shouldBeImplemented
]

{ #category : #'as yet unclassified' }
ASRepository class >> userName:aUserName password:aPassword [

	^ self host: self defaultHost  port: self defaultPort   userName: aUserName  password: aPassword 
]

{ #category : #accessing }
ASRepository >> collection [
	^ collection ifNil:[ self collection:	self defaultCollectionName. self defaultCollectionName].
]

{ #category : #accessing }
ASRepository >> collection: aCollectionName [

	collection ~=aCollectionName ifTrue:[
		collection := self solarClient core: aCollectionName.
		[self 	solarClient 
				cores: [:cores|
					cores
						name: aCollectionName;
						configSet:#basic_configs;
						create ];
				callback:[:r| r inspect]] 
		on:ASolarException 
		do:[:ex| ].
		self modifySchema:aCollectionName	].	
]

{ #category : #persistence }
ASRepository >> commit: aBlock [
	self solarClient commit
]

{ #category : #persistence }
ASRepository >> count: aClass [
	|app appName index|
	index := self indexForClassSortedBy:#().
	appName := (index ddoc findTokens: $/) at:2.
	app := self collection applicationAt: appName.
	^ ((app view 
			name:index name;
			key: (Array with:aClass name) ;
			reduce;
			execute) at:1) at:'value'
]

{ #category : #persistence }
ASRepository >> count: aClass where: aWhereBlock [
	| index mq|
	"@todo we need to convert the where block to query parameters in order to call the view like count"
	mq := self collection mangoQuery 
						selector:[:aDoc| (aDoc at:'#instanceOf') = aClass name];
						fields: #(#_id);
						limit: self maxObjectsInMem.
	aWhereBlock ifNotNil:[ mq selector: aWhereBlock].
	index := self indexForClassSortedBy: #().

	^ (mq	
		useIndex: index;
		execute) size
				
			
]

{ #category : #accessing }
ASRepository >> defaultCollectionName [
	^ #smalltalk_image
]

{ #category : #accessing }
ASRepository >> flushCache [
	self shouldBeImplemented
]

{ #category : #accessing }
ASRepository >> futureClass [
	self shouldBeImplemented
]

{ #category : #private }
ASRepository >> indexForClassSortedBy: arrayInSortSyntax [
	| oc |
	oc := Array with:'#instanceOf'withAll: arrayInSortSyntax.
		
	^ self sortingIndexes 
			at: oc asString 
			ifAbsentPut:[ self collection index 
													name: oc asString;
													fields:  oc;
													new]
]

{ #category : #initialization }
ASRepository >> initialize [
	super initialize.

]

{ #category : #testing }
ASRepository >> isNew: anObject [ 
	"checks the revision field (HEAD is the most lighweight call)"
	| isNew |
	isNew := false.

	^ isNew
 
]

{ #category : #accessing }
ASRepository >> lazyProxyClass [
	self shouldBeImplemented
]

{ #category : #accessing }
ASRepository >> maxObjectsInMem [
	^ maxObjectsInMem ifNil:[maxObjectsInMem := 65536]
]

{ #category : #accessing }
ASRepository >> maxObjectsInMem: anInteger [
	maxObjectsInMem := anInteger
]

{ #category : #'as yet unclassified' }
ASRepository >> modifySchema [
	
	self
]

{ #category : #persistence }
ASRepository >> remove: anObject [
	
	| uuid |
	uuid := self uuidProvider discoverIdFor: anObject.
	uuid ifNil:[ ASolarException signal:'Object does not have an ID.'].
	^ self solarClient 
				core:self collection;
				removeByQuery: {'_id'-> uuid};
				callback: [ :response| response ]
]

{ #category : #persistence }
ASRepository >> removeAll: aClass [


	^ self solarClient 
				core:self collection;
				removeByQuery: {'#indexOf'-> aClass name};
				callback: [ :response| response ]
	
	

]

{ #category : #persistence }
ASRepository >> save: aDoc [
	"insert or update a doc"

	^ self solarClient 
				core:self collection;
				add: aDoc;
				callback: [ :response| response ]

]

{ #category : #persistence }
ASRepository >> selectAll: aClass [
	^ self selectMany: aClass where: nil sortBy: nil limit: self maxObjectsInMem offset: nil

						  
]

{ #category : #persistence }
ASRepository >> selectAll: aClass sortBy: sortOptions [
	^ self selectMany: aClass where: nil sortBy: sortOptions limit: self maxObjectsInMem offset: nil
]

{ #category : #persistence }
ASRepository >> selectMany: aClass where: queryOptions [
	^ self selectMany: aClass where: queryOptions sortBy: nil limit: self maxObjectsInMem offset: nil
]

{ #category : #persistence }
ASRepository >> selectMany: aClass where: queryOptions sortBy: sortOptions [
	^ self selectMany: aClass where: queryOptions sortBy: sortOptions limit: self maxObjectsInMem offset: nil
]

{ #category : #persistence }
ASRepository >> selectMany: aClass where: queryOptions sortBy: sortOptions limit: limit [
	^ self selectMany: aClass where: queryOptions sortBy: sortOptions limit: limit offset: nil
]

{ #category : #persistence }
ASRepository >> selectMany: aClass where: queryOptions sortBy: sortOptions limit: limit offset: offset [
	^ self solarClient 
				core:self collection;
				query:[:query|
							query 
								q: '#instanceOf'-> aClass name.
								queryOptions ifNotNil:[query q:queryOptions].
								sortOptions ifNotNil:[query sort: sortOptions].
								limit ifNotNil:[query rows: limit].
								offset ifNotNil:[query start: offset]];
			callback:[:r| r ].	
				
			
]

{ #category : #persistence }
ASRepository >> selectOne: aClass where: queryOptions [	
	^ self selectMany: aClass where: queryOptions sortBy: nil limit: 1 offset: nil

]

{ #category : #accessing }
ASRepository >> solarClient [
	^ solarClient 
]

{ #category : #accessing }
ASRepository >> solarClient: aSc [
	solarClient := aSc
]

{ #category : #accessing }
ASRepository >> uuidProvider [
	^ uuidProvider ifNil:[ uuidProvider := SCSmalltalkUUIDProvider new]
]
