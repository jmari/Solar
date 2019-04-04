Class {
	#name : #ASParameterCollection,
	#superclass : #OrderedCollection,
	#instVars : [
		'root'
	],
	#category : 'Apache-Solar-Core'
}

{ #category : #'instance creation' }
ASParameterCollection class >> new [ 
	| a |
	a := super new.
	a initialize: a size.
	^ a
]

{ #category : #'as yet unclassified' }
ASParameterCollection class >> onAField: aParameter [
	| bn |
	bn := self new.
	^ bn root: aParameter tagField 
]

{ #category : #accessing }
ASParameterCollection >> at: anObject put: otherObject [
	self add: (( self tagField , anObject) -> otherObject)
]

{ #category : #initialization }
ASParameterCollection >> initialize: size [ 
	super initialize
]

{ #category : #enumerating }
ASParameterCollection >> keysAndValuesDo: aBlock [
	self do:[:each|
			aBlock value: each key value:each value ]
]

{ #category : #accessing }
ASParameterCollection >> root [
	^ root ifNil:[ root :='' ]
]

{ #category : #accessing }
ASParameterCollection >> root: aTagField [
	root := aTagField
]

{ #category : #'as yet unclassified' }
ASParameterCollection >> tagField [
	self subclassResponsibility 
]
