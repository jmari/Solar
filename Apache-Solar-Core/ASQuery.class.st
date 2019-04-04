Class {
	#name : #ASQuery,
	#superclass : #ASParameterCollection,
	#instVars : [
		'facet',
		'group',
		'mlt',
		'hl',
		'serializer'
	],
	#category : 'Apache-Solar-Core-Queries'
}

{ #category : #accessing }
ASQuery >> bf:  anObject [
	 self at:'bf'  put: anObject
]

{ #category : #accessing }
ASQuery >> bq:  anObject [
		 self at:'bq'  put: ((anObject isKindOf: String )ifTrue:[anObject] ifFalse:[anObject asSCJsonObject])
]

{ #category : #building }
ASQuery >> build [
	self  hasGroup ifTrue:[ self addAll: self group].
	self  hasFacet  ifTrue:[ self addAll: self facet build].
	self  hasHl ifTrue:[ self addAll: self hl].
	self  hasMlt ifTrue:[ self addAll: self moreLikeThis ].
	
]

{ #category : #accessing }
ASQuery >> cursorMark: aMark [
	 self at:'cursorMark' put: aMark
]

{ #category : #accessing }
ASQuery >> debugQuery [
	^ self at:'debugQuery' put:'true'
]

{ #category : #accessing }
ASQuery >> defType: aType [
	self at:'defType' put: aType
]

{ #category : #accessing }
ASQuery >> df: defaultQueryField [
	 self at:'df' put: defaultQueryField 
]

{ #category : #factory }
ASQuery >> facet [
	 ^ facet ifNil:[facet := ASFacet new] 
]

{ #category : #accessing }
ASQuery >> facet: aBlockWithFacetParameter [
	
	(aBlockWithFacetParameter isKindOf: BlockClosure )
		ifTrue:[ 	aBlockWithFacetParameter value: self facet ]
		ifFalse: [ self at:'facet' put: aBlockWithFacetParameter]
]

{ #category : #factory }
ASQuery >> fastVectorHl [
	 ^ hl ifNil: [	hl := ASFastVectorHighlighter new] 
]

{ #category : #factory }
ASQuery >> fastVectorHl: aBlockWithHlParameter [
	 aBlockWithHlParameter value: self  fastVectorHl
]

{ #category : #accessing }
ASQuery >> fl:  collectionOfield [
	
	 self at:'fl' put: collectionOfield asCommaString 
]

{ #category : #accessing }
ASQuery >> fq:  sortOptions [
	
	 self at:'fq'  put: (ASQueryString from:sortOptions)
]

{ #category : #factory }
ASQuery >> group [
	 ^ group ifNil: [	group := ASGroup new] 
]

{ #category : #accessing }
ASQuery >> group: aBlockWithGroupOptions [
	 aBlockWithGroupOptions value: self group
]

{ #category : #factory }
ASQuery >> hasFacet [
	^ facet notNil
]

{ #category : #factory }
ASQuery >> hasGroup [
	^ group notNil
]

{ #category : #factory }
ASQuery >> hasHl [
	^ hl notNil
]

{ #category : #factory }
ASQuery >> hasMlt [
	^ mlt notNil 
]

{ #category : #factory }
ASQuery >> hl [
	 ^ hl ifNil:[ hl := ASHighlighting new]
]

{ #category : #factory }
ASQuery >> hl: aBlockWithHlParameter [
	 aBlockWithHlParameter value: self hl
]

{ #category : #accessing }
ASQuery >> ids:  aListOfIds [
	aListOfIds do:[:each| self at:'ids'  put: each]
]

{ #category : #accessing }
ASQuery >> jsonFacet: jsonFacetCollection [
	"facet passes has a JSON object (smalltalk format)"
	|  jsonString |
	jsonString := self serializer serialize: jsonFacetCollection asSCJsonObject.
	self at:'json.facet' put:jsonString
]

{ #category : #accessing }
ASQuery >> matchFilter:  filterOptions [
	 self at:'fq' put: filterOptions
]

{ #category : #factory }
ASQuery >> mlt [
	 ^ self moreLikeThis 
]

{ #category : #factory }
ASQuery >> mlt: aMlt [
	 self moreLikeThis: aMlt
]

{ #category : #accessing }
ASQuery >> mm:  anObject [
	 self at:'mm'  put: anObject
]

{ #category : #factory }
ASQuery >> moreLikeThis [
	 ^ mlt ifNil:[ mlt := ASMoreLikeThis new] 
]

{ #category : #factory }
ASQuery >> moreLikeThis: aBlockWithMltParameter [
	 aBlockWithMltParameter value: self moreLikeThis
]

{ #category : #factory }
ASQuery >> originalHl [
	 ^ hl ifNil: [	hl := ASOriginalHighlighter new] 
]

{ #category : #factory }
ASQuery >> originalHl: aBlockWithHlParameter [
	 aBlockWithHlParameter value: self originalHl
]

{ #category : #accessing }
ASQuery >> ps:  anObject [
	 self at:'ps'  put: anObject
]

{ #category : #accessing }
ASQuery >> q: aQuery [ 
	
			self at:'q' put: (ASQueryString from: aQuery)
]

{ #category : #accessing }
ASQuery >> qOp: aQueryOperation [  
	 self at:'q.op' put: aQueryOperation 
]

{ #category : #accessing }
ASQuery >> qf:  aQuery [
	"String format 'fieldOne^2.3 fieldTwo fieldThree^0.4'
	 or an array of associations {fieldOne!2.3. fieldTwo!1.0. fieldThree!0.4}"
	 self at:'qf'  put:  (ASQueryString from: aQuery)
]

{ #category : #accessing }
ASQuery >> qs: anObject [  
	 self at:'qs' put: anObject 
]

{ #category : #accessing }
ASQuery >> qt:  aBlockHandler [
	 self at:'qt'  put: aBlockHandler
]

{ #category : #accessing }
ASQuery >> rangeFilter:  filterOptions [
	 self at:'fq' put: filterOptions
]

{ #category : #accessing }
ASQuery >> rows: numberOfRows [
	 self at:'rows' put: numberOfRows
]

{ #category : #'as yet unclassified' }
ASQuery >> rq: aQuery [ 
	
			self at:'rq' put: (ASQueryString from: aQuery)
]

{ #category : #accessing }
ASQuery >> serializer [
	^ serializer ifNil:[ serializer := SCSerializer new 
																	idField: 'id';
																	serializeAllCollectionsAsArrays;
																	yourself  ] 
]

{ #category : #accessing }
ASQuery >> sort:  sortOptions [
	
	 self at:'sort'  put: (ASSortString from:sortOptions)
]

{ #category : #accessing }
ASQuery >> start: offset [
	 self at:'start' put: offset 
]

{ #category : #private }
ASQuery >> tagField [
	^ self root ,''
]

{ #category : #accessing }
ASQuery >> tie: anObject [  
	 self at:'tie' put: anObject 
]

{ #category : #accessing }
ASQuery >> timeout: timeout [
	 self at:'timeAllowed' put: timeout 
]

{ #category : #factory }
ASQuery >> unifiedHl [
	 ^ hl ifNil: [ hl := ASUnifiedHighlighter new] 
]

{ #category : #factory }
ASQuery >> unifiedHl: aBlockWithHlParameter [
	 aBlockWithHlParameter value: self unifiedHl
]
