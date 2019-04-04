Class {
	#name : #ASUnifiedHighlighter,
	#superclass : #ASHighlighting,
	#category : 'Apache-Solar-Core-Highlighting'
}

{ #category : #'as yet unclassified' }
ASUnifiedHighlighter >> breakiteratorLanguage: aString [

	self at:'bs.country' put: aString
]

{ #category : #'as yet unclassified' }
ASUnifiedHighlighter >> breakiteratorSeparator: aString [
	"Requires breakIteratorType=SEPARATOR"
	self at:'bs.separator' put: aString
]

{ #category : #'as yet unclassified' }
ASUnifiedHighlighter >> breakiteratorType: aString [
	"SEPARATOR, SENTENCE, WORD, CHARACTER, LINE, or WHOLE"
	self at:'bs.type' put: aString
]

{ #category : #'as yet unclassified' }
ASUnifiedHighlighter >> breakiteratorVariant: aString [

	self at:'bs.variant' put: aString
]

{ #category : #'as yet unclassified' }
ASUnifiedHighlighter >> defaultSummary [

	self at:'defaultSummary' put: true
]

{ #category : #'as yet unclassified' }
ASUnifiedHighlighter >> offsetSource: anString [
	"ANALYSIS, POSTINGS, POSTINGS_WITH_TERM_VECTORS, TERM_VECTORS"
	self at:'offsetSource' put: anString
]

{ #category : #'as yet unclassified' }
ASUnifiedHighlighter >> scoreB: aNumber [

	self at:'score.b' put: aNumber
]

{ #category : #'as yet unclassified' }
ASUnifiedHighlighter >> scoreK1: aNumber [

	self at:'score.k1' put: aNumber
]

{ #category : #'as yet unclassified' }
ASUnifiedHighlighter >> scorePivot: aNumber [

	self at:'score.pivot' put: aNumber
]
