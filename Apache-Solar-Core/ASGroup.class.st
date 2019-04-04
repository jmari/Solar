Class {
	#name : #ASGroup,
	#superclass : #ASParameterCollection,
	#category : 'Apache-Solar-Core-Queries'
}

{ #category : #accessing }
ASGroup >> cache: percent [
	self at:'cache.percent' put: percent 
]

{ #category : #accessing }
ASGroup >> field: aFieldName [
	self at:'field' put: aFieldName
]

{ #category : #accessing }
ASGroup >> format: format [
	self at:'format' put: format
]

{ #category : #accessing }
ASGroup >> groupByField: fieldArray [
	 self field: fieldArray 
]

{ #category : #initialization }
ASGroup >> initialize:size [
	super initialize: size.
	self add:'group' ->true.
]

{ #category : #accessing }
ASGroup >> main: main [
	self at:'main' put: main
]

{ #category : #accessing }
ASGroup >> ngroups: ngroups [
	self at:'ngroups' put: ngroups
]

{ #category : #'as yet unclassified' }
ASGroup >> tagField [
	^ 'group.'
]

{ #category : #accessing }
ASGroup >> truncate: truncate [
	self at:'truncate' put: truncate
]
