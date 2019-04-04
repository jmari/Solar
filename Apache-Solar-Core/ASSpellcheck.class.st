Class {
	#name : #ASSpellcheck,
	#superclass : #ASQuery,
	#instVars : [
		'range',
		'pivot',
		'interval',
		'collateParam'
	],
	#category : 'Apache-Solar-Core-Others'
}

{ #category : #accessing }
ASSpellcheck >> accuracy: aNumber [
	self at:'accuracy' put: aNumber
]

{ #category : #accessing }
ASSpellcheck >> build [
	self hasCollateParam ifTrue:[ self addAll: collateParam ]
]

{ #category : #accessing }
ASSpellcheck >> buildDictionary [
	self at:'build' put: true
]

{ #category : #accessing }
ASSpellcheck >> collate [
	self at:'collate' put: true
]

{ #category : #accessing }
ASSpellcheck >> collateExtendedResults [
	self at:'collateExtendedResults' put: true
]

{ #category : #accessing }
ASSpellcheck >> collateMaxCollectDocs: anInteger [
	self at:'collateMaxCollectDocs' put: anInteger
]

{ #category : #accessing }
ASSpellcheck >> collateParam: aBlock [
	aBlock value: ( collateParam := ASQuery onAField: self)
]

{ #category : #accessing }
ASSpellcheck >> dictionary: aString [
	self at:'dictionary' put: aString
]

{ #category : #accessing }
ASSpellcheck >> handler [
	^ #('spell')
]

{ #category : #testing }
ASSpellcheck >> hasCollateParam [
	^ collateParam notNil
]

{ #category : #initialization }
ASSpellcheck >> initialize:size [
	super initialize:size.
	self at:'spellcheck' put:true
]

{ #category : #accessing }
ASSpellcheck >> maxCollation: anInteger [
	self at:'maxCollation' put: anInteger
]

{ #category : #accessing }
ASSpellcheck >> maxCollationEvaluations: anInteger [
	self at:'maxCollationEvaluations' put: anInteger
]

{ #category : #accessing }
ASSpellcheck >> maxCollationTries: anInteger [
	self at:'maxCollationTries' put: anInteger
]

{ #category : #accessing }
ASSpellcheck >> name:aDictionary put: anAssociation [
	self at: (aDictionary ,'.', anAssociation key asString) put:anAssociation value
]

{ #category : #'as yet unclassified' }
ASSpellcheck >> tagField [
	^ self root , 'spellcheck.'
]
