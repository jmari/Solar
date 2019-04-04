Class {
	#name : #ASOverRequest,
	#superclass : #ASParameterCollection,
	#category : 'Apache-Solar-Core-Facet'
}

{ #category : #enumerating }
ASOverRequest >> count: aNumber [
	self at:'count' put: aNumber
]

{ #category : #'as yet unclassified' }
ASOverRequest >> ratio: aNumber [
	self at:'ratio' put: aNumber
]

{ #category : #'as yet unclassified' }
ASOverRequest >> tagField [
	^ self root , 'facet.overrequest.' 
]
