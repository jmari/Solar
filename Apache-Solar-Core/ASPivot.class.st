Class {
	#name : #ASPivot,
	#superclass : #ASParameterCollection,
	#category : 'Apache-Solar-Core-Facet'
}

{ #category : #'instance creation' }
ASPivot >> <- aString [
	self add: (self root ,'pivot') -> (ASQueryString from:aString)
]

{ #category : #'instance creation' }
ASPivot >> fromString: aString [
	self <- aString
]

{ #category : #accessing }
ASPivot >> minCount: anInteger [
	self at: 'mincount' put: anInteger
]

{ #category : #query }
ASPivot >> tagField [
	^ self root , 'pivot.'
]
