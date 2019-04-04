Class {
	#name : #ASHighlighting,
	#superclass : #ASParameterCollection,
	#category : 'Apache-Solar-Core-Highlighting'
}

{ #category : #accessing }
ASHighlighting >> defType: aType [
	self at:'qparser' put: aType
]

{ #category : #accessing }
ASHighlighting >> fl:  collectionOfield [
	
	 self at:'fl' put: collectionOfield asCommaString 
]

{ #category : #accessing }
ASHighlighting >> fragSize: anInteger [
	self at:'fragsize' put: anInteger
]

{ #category : #accessing }
ASHighlighting >> highlightMultiTerm [
	self at:'highlightMultiTerm' put: true
]

{ #category : #initialization }
ASHighlighting >> initialize: size [
	super initialize:size.
	self add:'hl' -> true.
]

{ #category : #accessing }
ASHighlighting >> maxAnalyzedChar: anInteger [
	self at:'maxAnalyzedChar' put: anInteger
]

{ #category : #accessing }
ASHighlighting >> q: aQuery [ 
	
			self at:'q' put: (ASQueryString from: aQuery)
]

{ #category : #accessing }
ASHighlighting >> requireFieldMatch [
	self at:'requireFieldMatch' put: true
]

{ #category : #accessing }
ASHighlighting >> snippets: anInteger [
	self at:'snippets' put: anInteger
]

{ #category : #private }
ASHighlighting >> tagField [
	^ 'hl.'
]

{ #category : #accessing }
ASHighlighting >> tagPost: anString [
	self at:'tag.post' put: anString
]

{ #category : #accessing }
ASHighlighting >> tagPre: anString [
	self at:'tag.pre' put: anString
]

{ #category : #accessing }
ASHighlighting >> usePhraseHighlighter [
	self at:'usePhraseHighlighter' put: true
]
