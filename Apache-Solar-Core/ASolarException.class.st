Class {
	#name : #ASolarException,
	#superclass : #Error,
	#instVars : [
		'solrError'
	],
	#category : 'Apache-Solar-Core-Exceptions'
}

{ #category : #signalling }
ASolarException class >> signal: aJsonSolrError [
	|inst|
	inst := self new.
	inst messageText: ((aJsonSolrError at:'error') at:'msg').
	inst solrError:aJsonSolrError.
	inst signal
]

{ #category : #accessing }
ASolarException >> solrError [
	^ solrError
]

{ #category : #accessing }
ASolarException >> solrError: anObject [
	solrError := anObject
]
