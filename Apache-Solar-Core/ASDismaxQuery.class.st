Class {
	#name : #ASDismaxQuery,
	#superclass : #ASQuery,
	#category : 'Apache-Solar-Core-Queries'
}

{ #category : #accessing }
ASDismaxQuery >> bf:  anObject [
	super bf: anObject
]

{ #category : #accessing }
ASDismaxQuery >> bq:  anObject [
	 super bq: anObject
]

{ #category : #initialization }
ASDismaxQuery >> initialize: size [
	super initialize: size.
	self defType:'dismax'
]

{ #category : #accessing }
ASDismaxQuery >> mm:  anObject [
	 super mm: anObject
]

{ #category : #'as yet unclassified' }
ASDismaxQuery >> pf:  anObject [
	 self at:'pf'  put: anObject
]

{ #category : #accessing }
ASDismaxQuery >> ps:  anObject [
	super ps: anObject
]

{ #category : #accessing }
ASDismaxQuery >> q:  anObject [
	 super q: anObject
]

{ #category : #'as yet unclassified' }
ASDismaxQuery >> qAlt:  anObject [
	 self at:'q.alt'  put: anObject
]

{ #category : #accessing }
ASDismaxQuery >> qf: aQuery [ 
	super qf: aQuery
	 "self at:'qf' put: (
			((aQuery isKindOf: Collection ) and:[(aQuery isKindOf: String ) not])
			ifTrue:[aQuery asPlusString ] 
			ifFalse:[	aQuery asString])"
]

{ #category : #accessing }
ASDismaxQuery >> qs:  aQuery [
	"String format 'fieldOne^2.3 fieldTwo fieldThree^0.4'
	 or an array of associations {fieldOne->2.3. fieldTwo->1.0. fieldThree->0.4}"
	 self at:'qs'  put:  (ASQueryString from: aQuery)
]

{ #category : #accessing }
ASDismaxQuery >> tie:  anObject [
	super tie: anObject
]
