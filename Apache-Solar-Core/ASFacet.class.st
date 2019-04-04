Class {
	#name : #ASFacet,
	#superclass : #ASParameterCollection,
	#instVars : [
		'range',
		'pivot',
		'interval',
		'serializer',
		'overRequest'
	],
	#category : 'Apache-Solar-Core-Facet'
}

{ #category : #'instance creation' }
ASFacet >> <- aString [
	self add: (self root ,'facet') -> (ASQueryString from:aString)
]

{ #category : #building }
ASFacet >> build [
	self hasRange ifTrue:[ self addAll: self range].
	self hasPivot ifTrue:[ self addAll: self pivot].
	self hasInterval ifTrue:[ self addAll: interval].
	self hasOverRequest ifTrue:[ self addAll: self overRequest]
]

{ #category : #testing }
ASFacet >> contains: aString [
	"Limits the terms used for faceting to those that contain the specified substring."
	self at:'contains' put:aString
]

{ #category : #facet }
ASFacet >> containsIgnoreCase [
	"Limits the terms used for faceting to those that contain the specified substring."
	self at:'contains.ignoreCase' put: 'on'
]

{ #category : #'as yet unclassified' }
ASFacet >> enumCacheMinDf: anInteger [
	self at:'enum.cache.minDf' put: anInteger
]

{ #category : #'as yet unclassified' }
ASFacet >> excludeTerms: terms [
	self at: 'excludeTerms' put: terms
]

{ #category : #'as yet unclassified' }
ASFacet >> exist [
		self at:'exists' put: true
]

{ #category : #query }
ASFacet >> field: aFieldName [
	"Identifies a field to be treated as a facet."
	self at:'field' put:aFieldName
]

{ #category : #'instance creation' }
ASFacet >> fromString: aString [
	self <- aString
]

{ #category : #testing }
ASFacet >> hasInterval [
	^ interval notNil
]

{ #category : #'factory methods' }
ASFacet >> hasOverRequest [

	^ overRequest  notNil
	
		
]

{ #category : #testing }
ASFacet >> hasPivot [
	^ pivot notNil
]

{ #category : #testing }
ASFacet >> hasRange [
	^ range notNil
]

{ #category : #initialization }
ASFacet >> initialize: size [
	super initialize:size.
	self add:'facet'->true.
]

{ #category : #'factory methods' }
ASFacet >> interval [

	^ interval ifNil:[ interval := ASInterval onAField: self]
	
		
]

{ #category : #'factory methods' }
ASFacet >> interval: anIntervalBlock [
		(anIntervalBlock isKindOf: BlockClosure )
			ifTrue:[ 	anIntervalBlock value: self interval ]
			ifFalse: [ self at:'interval' put: anIntervalBlock]
]

{ #category : #accessing }
ASFacet >> limit: anInteger [
	self at:'limit' put: anInteger
]

{ #category : #accessing }
ASFacet >> method: method [
	self at: 'method' put: method
]

{ #category : #accessing }
ASFacet >> methodEnum [
	self at:'method' put: 'enum'
]

{ #category : #accessing }
ASFacet >> methodFc [
	self at:'method' put: 'fc'
]

{ #category : #accessing }
ASFacet >> methodFcs [
	self at:'method' put: 'fcs'
]

{ #category : #accessing }
ASFacet >> minCount: anInteger [
	self at:'mincount' put: anInteger
]

{ #category : #accessing }
ASFacet >> missing [
	self at:'missing' put: true
]

{ #category : #accessing }
ASFacet >> offset: anInteger [
	self at:'offset' put: anInteger
]

{ #category : #'factory methods' }
ASFacet >> overRequest [

	^ overRequest  ifNil:[ overRequest  := ASOverRequest onAField: self]
	
		
]

{ #category : #'factory methods' }
ASFacet >> overRequest: aBlock [

	aBlock value: overRequest  
	
		
]

{ #category : #'factory methods' }
ASFacet >> pivot [
	
	^ pivot	ifNil: [ pivot := ASPivot onAField: self ]
	
		
]

{ #category : #'factory methods' }
ASFacet >> pivot: aPivotBlock [
		(aPivotBlock isKindOf: BlockClosure )
			ifTrue:[ 	aPivotBlock value: self pivot ]
			ifFalse: [ self at:'pivot' put: aPivotBlock]
]

{ #category : #accessing }
ASFacet >> prefix: aString [
	"Limits the terms used for faceting to those that begin with the specified prefix"
	self at:'prefix' put:aString
]

{ #category : #accessing }
ASFacet >> query: aQuery [
	self at: 'query' put:((aQuery isKindOf:SCJsonObject )
		ifTrue:[ self serializer serialize:aQuery]
		ifFalse:[ ASQueryString from:aQuery ])
]

{ #category : #'factory methods' }
ASFacet >> range [

	^ range ifNil:[ range := ASRange onAField: self]
	
		
]

{ #category : #'factory methods' }
ASFacet >> range: aRangeBlock [
	(aRangeBlock isKindOf: BlockClosure )
			ifTrue:[ 	aRangeBlock value: self range ]
			ifFalse: [ self at:'range' put: aRangeBlock]
]

{ #category : #accessing }
ASFacet >> serializer [
	^ serializer ifNil:[ serializer := SCSerializer new idField: 'id'] 
]

{ #category : #sorting }
ASFacet >> sortByCount [
	self at: 'sort' put: 'count'
]

{ #category : #sorting }
ASFacet >> sortByIndex [
	self at: 'sort' put: 'index'
]

{ #category : #query }
ASFacet >> tagField [
	^ self root , 'facet.'
]

{ #category : #'as yet unclassified' }
ASFacet >> threads: anInteger [
	self at: 'threads' put: anInteger
]
