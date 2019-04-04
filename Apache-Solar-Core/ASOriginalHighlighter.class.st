Class {
	#name : #ASOriginalHighlighter,
	#superclass : #ASHighlighting,
	#category : 'Apache-Solar-Core-Highlighting'
}

{ #category : #'as yet unclassified' }
ASOriginalHighlighter >> alternateField: aString [
	self at:'alternateField' put: aString
]

{ #category : #'as yet unclassified' }
ASOriginalHighlighter >> formatter: aString [
	"Currently the only legal value is simple"
	self at:'formater' put: aString
]

{ #category : #'as yet unclassified' }
ASOriginalHighlighter >> fragmenter: aString [
	"Specifies a text snippet generator for highlighted text. The standard fragmenter is gap, which creates fixed-sized fragments with gaps for multi-valued fields. Another option is regex, which tries to create fragments that resemble a specified regular expression."
	self at:'fragmenter' put: aString
]

{ #category : #'as yet unclassified' }
ASOriginalHighlighter >> highlightAlternateOff [

	self at:'highlightAlternate' put: false
]

{ #category : #'as yet unclassified' }
ASOriginalHighlighter >> highlightAlternateOn [

	self at:'highlightAlternate' put: true
]

{ #category : #accessing }
ASOriginalHighlighter >> maxAlternateFieldLength: anInteger [
	"This parameter is only used in conjunction with the hl.alternateField parameter"
	self at:'maxAlternateFieldLength' put: anInteger
]

{ #category : #accessing }
ASOriginalHighlighter >> maxMultiValuedToEMatch: anInteger [
	self at:'maxMultiValuedToMatch' put: anInteger
]

{ #category : #accessing }
ASOriginalHighlighter >> maxMultiValuedToExamine: anInteger [
	self at:'maxMultiValuedToExamine' put: anInteger
]

{ #category : #'as yet unclassified' }
ASOriginalHighlighter >> mergeContinuous [

	self at:'mergeContinuous' put: false
]

{ #category : #'as yet unclassified' }
ASOriginalHighlighter >> payloadsOff [
	self at:'payloads' put: false
]

{ #category : #'as yet unclassified' }
ASOriginalHighlighter >> preserveMulti [
	self at:'preserveMulti' put: true
]

{ #category : #'as yet unclassified' }
ASOriginalHighlighter >> regexMaxAnalyzedChars: aNumber [
	self at:'regex.maxAnalyzedChars' put: aNumber
]

{ #category : #'as yet unclassified' }
ASOriginalHighlighter >> regexPattern: aString [
	self at:'regex.pattern' put: aString
]

{ #category : #'as yet unclassified' }
ASOriginalHighlighter >> regexSlop: aNumber [
	self at:'regex.slop' put: aNumber
]

{ #category : #'as yet unclassified' }
ASOriginalHighlighter >> simplePost: aString [

	self at:'simple.post' put: aString
]

{ #category : #'as yet unclassified' }
ASOriginalHighlighter >> simplePre: aString [

	self at:'simple.pre' put: aString
]
