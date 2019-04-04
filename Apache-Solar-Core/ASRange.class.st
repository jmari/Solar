Class {
	#name : #ASRange,
	#superclass : #ASParameterCollection,
	#category : 'Apache-Solar-Core-Facet'
}

{ #category : #'instance creation' }
ASRange >> <- aString [
	self add: (self root ,'range') -> aString
]

{ #category : #accessing }
ASRange >> end: upperBound [
	self at: 'end' put: upperBound
]

{ #category : #'instance creation' }
ASRange >> fromString: aString [
	self <- aString
]

{ #category : #accessing }
ASRange >> gap: span [
	self at: 'gap' put: span
]

{ #category : #accessing }
ASRange >> hardEnd [
	self at: 'hardend' put: true
]

{ #category : #accessing }
ASRange >> includeAll [
	self at: 'include' put: 'all'
]

{ #category : #accessing }
ASRange >> includeEdge [
	self at: 'include' put: 'edge'
]

{ #category : #accessing }
ASRange >> includeLower [
	self at: 'include' put: 'lower'
]

{ #category : #accessing }
ASRange >> includeOuter [
	self at: 'include' put: 'outer'
]

{ #category : #accessing }
ASRange >> includeUpper [
	self at: 'include' put: 'upper'
]

{ #category : #accessing }
ASRange >> minCount: anInteger [
	self at: 'mincount' put: anInteger
]

{ #category : #accessing }
ASRange >> otherAfter [
	self at:'other' put:'after'
]

{ #category : #accessing }
ASRange >> otherAll [
	self at:'other' put:'all'
]

{ #category : #accessing }
ASRange >> otherBefore [
	self at:'other' put:'before'
]

{ #category : #accessing }
ASRange >> otherBetween [
	self at:'other' put:'between'
]

{ #category : #accessing }
ASRange >> otherNone [
	self at:'other' put:'none'
]

{ #category : #accessing }
ASRange >> start: lowerBound [
	self at: 'start' put: lowerBound
]

{ #category : #query }
ASRange >> tagField [
	^ self root , 'range.'
]

{ #category : #accessing }
ASRange >> useDocValuesMethod [
	self at:'method' put:'dv'
]

{ #category : #accessing }
ASRange >> useFilterMethod [
	self at:'method' put:'filter'
]
