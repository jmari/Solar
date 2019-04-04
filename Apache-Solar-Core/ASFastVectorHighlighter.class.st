Class {
	#name : #ASFastVectorHighlighter,
	#superclass : #ASHighlighting,
	#category : 'Apache-Solar-Core-Highlighting'
}

{ #category : #accessing }
ASFastVectorHighlighter >> alternateField: aString [
	self at:'alternateField' put: aString
]

{ #category : #accessing }
ASFastVectorHighlighter >> boundaryScanner: aString [
	" breakIterator and simple"
	self at:'boundaryScanner' put: aString
]

{ #category : #accessing }
ASFastVectorHighlighter >> bs: aString [
	"  WORD, LINE, SENTENCE, and CHARACTER"
	self at:'bs' put: aString
]

{ #category : #accessing }
ASFastVectorHighlighter >> fragListBuilder: aString [
	"simple or weighted"
	self at:'fragListBuilder' put: aString
]

{ #category : #accessing }
ASFastVectorHighlighter >> fragmentsBuilder: aString [

	self at:'fragListBuilder' put: aString
]

{ #category : #accessing }
ASFastVectorHighlighter >> highlightAlternateOff [

	self at:'highlightAlternate' put: false
]

{ #category : #accessing }
ASFastVectorHighlighter >> highlightAlternateOn [

	self at:'highlightAlternate' put: true
]

{ #category : #accessing }
ASFastVectorHighlighter >> maxAlternateFieldLength: anInteger [
	"This parameter is only used in conjunction with the hl.alternateField parameter"
	self at:'maxAlternateFieldLength' put: anInteger
]

{ #category : #accessing }
ASFastVectorHighlighter >> multiValuedSeparatorChar: aString [

	self at:'multiValuedSeparatorChar' put: aString
]

{ #category : #accessing }
ASFastVectorHighlighter >> phraseLimit: anInteger [

	self at:'phraseLimit' put: anInteger
]
