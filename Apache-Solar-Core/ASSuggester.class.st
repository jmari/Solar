Class {
	#name : #ASSuggester,
	#superclass : #ASParameterCollection,
	#instVars : [
		'range',
		'pivot',
		'interval',
		'serializer'
	],
	#category : 'Apache-Solar-Core-Others'
}

{ #category : #'instance creation' }
ASSuggester >> <- aString [
	self add: (self root ,'suggest') -> (ASQueryString from:aString)
]

{ #category : #building }
ASSuggester >> build [
	self at:'build' put: true
]

{ #category : #'as yet unclassified' }
ASSuggester >> buildAll [
	self at:'buildAll' put: true
]

{ #category : #accessing }
ASSuggester >> cfq: aString [
	self at: 'cfq' put: aString
]

{ #category : #accessing }
ASSuggester >> count: anInteger [
	self at: 'count' put: anInteger
]

{ #category : #accessing }
ASSuggester >> dictionary: aString [
	self at: 'dictionary' put: aString
]

{ #category : #accessing }
ASSuggester >> handler [
	^ #('suggest')
]

{ #category : #initialization }
ASSuggester >> initialize: size [
	super initialize:size.
	self add:'suggest'->true.
]

{ #category : #accessing }
ASSuggester >> q: aQuery [
	self at: 'q' put:((aQuery isKindOf:SCJsonObject )
		ifTrue:[ self serializer serialize:aQuery]
		ifFalse:[ ASQueryString from:aQuery ])
]

{ #category : #actions }
ASSuggester >> reload [
	self at:'reload' put: true
]

{ #category : #'as yet unclassified' }
ASSuggester >> reloadAll [
	self at:'reloadAll' put: true
]

{ #category : #accessing }
ASSuggester >> serializer [
	^ serializer ifNil:[ serializer := SCSerializer new idField: 'id'] 
]

{ #category : #'as yet unclassified' }
ASSuggester >> tagField [
	^ self root , 'suggest.'
]
