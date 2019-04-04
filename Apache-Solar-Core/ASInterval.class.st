Class {
	#name : #ASInterval,
	#superclass : #ASParameterCollection,
	#category : 'Apache-Solar-Core-Facet'
}

{ #category : #'instance creation' }
ASInterval >> <- aString [
	self add: (self root ,'interval') -> (ASQueryString from:aString)
]

{ #category : #query }
ASInterval >> field: aFieldName [
	self <- aFieldName.
]

{ #category : #'instance creation' }
ASInterval >> fromString: aString [
	self <- aString
]

{ #category : #query }
ASInterval >> set: aQuery [
	self at:'set' put: (ASQueryString from:aQuery)
]

{ #category : #'as yet unclassified' }
ASInterval >> tagField [
	^ self root , 'interval.'
]
