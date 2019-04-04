Class {
	#name : #ASEDismaxQuery,
	#superclass : #ASDismaxQuery,
	#category : 'Apache-Solar-Core-Queries'
}

{ #category : #'as yet unclassified' }
ASEDismaxQuery >> autoRelax [
	self at:'mm.autoRelax' put:true
]

{ #category : #accessing }
ASEDismaxQuery >> boost: aQuery [
			 self at:'boost'  put:  (ASQueryString from: aQuery)
]

{ #category : #initialization }
ASEDismaxQuery >> initialize: size [
	super initialize: size.
	self defType:'edismax'
]

{ #category : #accessing }
ASEDismaxQuery >> lowercaseOperators [
	self at:'lowercaseOperators' put: true
]

{ #category : #'as yet unclassified' }
ASEDismaxQuery >> pf2:  aQuery [
	"String format 'fieldOne^2.3 fieldTwo fieldThree^0.4'
	 or an array of associations {fieldOne->2.3. fieldTwo->1.0. fieldThree->0.4}"
	 self at:'qf2'  put:  (ASQueryString from: aQuery)
]

{ #category : #'as yet unclassified' }
ASEDismaxQuery >> pf3:  aQuery [
	"String format 'fieldOne^2.3 fieldTwo fieldThree^0.4'
	 or an array of associations {fieldOne->2.3. fieldTwo->1.0. fieldThree->0.4}"
	 self at:'qf3'  put:  (ASQueryString from: aQuery)
]

{ #category : #'as yet unclassified' }
ASEDismaxQuery >> ps2:  aQuery [
	"String format 'fieldOne^2.3 fieldTwo fieldThree^0.4'
	 or an array of associations {fieldOne->2.3. fieldTwo->1.0. fieldThree->0.4}"
	 self at:'qs2'  put:  (ASQueryString from: aQuery)
]

{ #category : #'as yet unclassified' }
ASEDismaxQuery >> ps3:  aQuery [
	"String format 'fieldOne^2.3 fieldTwo fieldThree^0.4'
	 or an array of associations {fieldOne->2.3. fieldTwo->1.0. fieldThree->0.4}"
	 self at:'qs3'  put:  (ASQueryString from: aQuery)
]

{ #category : #accessing }
ASEDismaxQuery >> ps:  anObject [
	"String format 'fieldOne^2.3 fieldTwo fieldThree^0.4'
	 or an array of associations {fieldOne->2.3. fieldTwo->1.0. fieldThree->0.4}"
	 super ps: anObject
]

{ #category : #accessing }
ASEDismaxQuery >> qf: aQuery [ 
	super qf: aQuery
]

{ #category : #'as yet unclassified' }
ASEDismaxQuery >> sowOff [
	self at:'sow' put:false
]

{ #category : #'as yet unclassified' }
ASEDismaxQuery >> sowOn [
	self at:'sow' put: true
]

{ #category : #'as yet unclassified' }
ASEDismaxQuery >> stopWordsOff [
	self at:'stopwords' put:false
]

{ #category : #'as yet unclassified' }
ASEDismaxQuery >> stopWordsOn [
	self at:'stopwords' put: true
]
