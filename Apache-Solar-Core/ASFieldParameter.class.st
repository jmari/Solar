Class {
	#name : #ASFieldParameter,
	#superclass : #ASGlobalParameter,
	#instVars : [
		'fieldName',
		'facet',
		'hl'
	],
	#category : 'Apache-Solar-Core-Fields'
}

{ #category : #building }
ASFieldParameter >> build [
	self hasFacet ifTrue: [  self addAll: self facet build].
	self hasHl ifTrue: [  self addAll: self hl ]
]

{ #category : #facet }
ASFieldParameter >> facet [
	
	^ facet ifNil:[ facet := ASFacet onAField: self ]
]

{ #category : #facet }
ASFieldParameter >> facet: aFacetBlock [
	aFacetBlock value: self facet
]

{ #category : #factory }
ASFieldParameter >> fastVectorHl [
	 ^ hl ifNil: [
				self at:'hl' put:true.
				hl := ASFastVectorHighlighter new] 
]

{ #category : #factory }
ASFieldParameter >> fastVectorHl: aBlockWithHlParameter [
	 aBlockWithHlParameter value: self  fastVectorHl
]

{ #category : #query }
ASFieldParameter >> fieldName [
	^ fieldName 
]

{ #category : #query }
ASFieldParameter >> fieldName: aString [
	fieldName := aString
]

{ #category : #facet }
ASFieldParameter >> hasFacet [
	
	^ facet  notNil
]

{ #category : #accessing }
ASFieldParameter >> hasHl [
	 ^ hl notNil 
]

{ #category : #accessing }
ASFieldParameter >> hl [
	 ^ hl ifNil:[
		self at:'hl' put:true.
		hl := ASHighlighting new]
]

{ #category : #accessing }
ASFieldParameter >> hl: aBlockWithHlParameter [
	 aBlockWithHlParameter value: self hl
]

{ #category : #query }
ASFieldParameter >> limit: anInteger [
	self at:'facet.limit' put: anInteger
]

{ #category : #factory }
ASFieldParameter >> originalHl [
	 ^ hl ifNil: [
				self at:'hl' put:true.
				hl := ASOriginalHighlighter new] 
]

{ #category : #factory }
ASFieldParameter >> originalHl: aBlockWithHlParameter [
	 aBlockWithHlParameter value: self originalHl
]

{ #category : #accessing }
ASFieldParameter >> qf: aQuery [ 
	 self at:'qf' put: (
		((aQuery isKindOf: Collection ) and:[(aQuery isKindOf: String ) not])
			ifTrue:[aQuery asPlusString ] 
			ifFalse:[	aQuery])
]

{ #category : #query }
ASFieldParameter >> split [
	self at:'split' put:true
]

{ #category : #query }
ASFieldParameter >> tagField [
	self fieldName ifNil:[self error:'You should specify a field name before'].
	^ 'f.' , self fieldName ,'.'
]

{ #category : #factory }
ASFieldParameter >> unifiedHl [
	 ^ hl ifNil: [
				self at:'hl' put:true.
				hl := ASUnifiedHighlighter new] 
]

{ #category : #factory }
ASFieldParameter >> unifiedHl: aBlockWithHlParameter [
	 aBlockWithHlParameter value: self unifiedHl
]
