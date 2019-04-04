Class {
	#name : #ASMoreLikeThis,
	#superclass : #ASParameterCollection,
	#category : 'Apache-Solar-Core-Queries'
}

{ #category : #accessing }
ASMoreLikeThis >> boost:  aQuery [
	 self at:'boost' put:  (ASQueryString from: aQuery)
]

{ #category : #accessing }
ASMoreLikeThis >> count:  aNumber [
	 self at:'count' put: aNumber
]

{ #category : #accessing }
ASMoreLikeThis >> doNotIncludeMatch [
	 self at:'match.include' put: false
]

{ #category : #accessing }
ASMoreLikeThis >> fl:  collectionOfield [
	
	 self at:'fl' put: collectionOfield asCommaString 
]

{ #category : #initialization }
ASMoreLikeThis >> initialize:size [
	super initialize: size.
	self add: 'mlt'->true
]

{ #category : #accessing }
ASMoreLikeThis >> interestingTerms:  aString [
	"Controls how the MoreLikeThis component presents the interesting terms (the top TF/IDF terms) for the query. Supports three settings. The setting list lists the terms. The setting none lists no terms. The setting details lists the terms along with the boost value used for each term. Unless mlt.boost=true, all terms will have boost=1.0."
	 self at:'interestingTerms' put: aString
]

{ #category : #accessing }
ASMoreLikeThis >> matchOffset:  aNumber [
	 self at:'match.offset' put: aNumber
]

{ #category : #accessing }
ASMoreLikeThis >> maxntp:  aNumber [
	 self at:'maxntp' put: aNumber
]

{ #category : #accessing }
ASMoreLikeThis >> maxqt:  aNumber [
	 self at:'maxqt' put: aNumber
]

{ #category : #accessing }
ASMoreLikeThis >> maxwl:  aNumber [
	 self at:'maxwl' put: aNumber
]

{ #category : #accessing }
ASMoreLikeThis >> mindf:  aNumber [
	 self at:'mindf' put: aNumber
]

{ #category : #accessing }
ASMoreLikeThis >> mintf:  aNumber [
	 self at:'mintf' put: aNumber
]

{ #category : #accessing }
ASMoreLikeThis >> minwl:  aNumber [
	 self at:'minwl' put: aNumber
]

{ #category : #accessing }
ASMoreLikeThis >> qf:  qfObject [
	 self at:'qf' put: qfObject
]

{ #category : #'as yet unclassified' }
ASMoreLikeThis >> tagField [
	^ 'mlt.'
]
