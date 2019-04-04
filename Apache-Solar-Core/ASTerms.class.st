Class {
	#name : #ASTerms,
	#superclass : #ASParameterCollection,
	#category : 'Apache-Solar-Core-Others'
}

{ #category : #accessing }
ASTerms >> fl:  aField [
	
	 self at:'fl' put: aField 
]

{ #category : #accessing }
ASTerms >> handler [
	^ #('terms')
]

{ #category : #accessing }
ASTerms >> includeLower [
	
	 self at:'lower.include' put: true 
]

{ #category : #accessing }
ASTerms >> includeUpper [
	
	 self at:'upper.include' put: true 
]

{ #category : #initialization }
ASTerms >> initialize: size [
	super initialize:size.
	self add:'terms'->true.
]

{ #category : #accessing }
ASTerms >> limit: anInteger [
	
	 self at:'limit' put: anInteger 
]

{ #category : #accessing }
ASTerms >> list:  collectionOfield [
	
	 self at:'fl' put: collectionOfield asCommaString 
]

{ #category : #'as yet unclassified' }
ASTerms >> lower: aString [
	
	 self at:'lower' put: aString 
]

{ #category : #accessing }
ASTerms >> maxCount: anInteger [
	
	 self at:'maxcount' put: anInteger 
]

{ #category : #accessing }
ASTerms >> minCount: anInteger [
	
	 self at:'mincount' put: anInteger 
]

{ #category : #accessing }
ASTerms >> prefix: aString [
	
	 self at:'prefix' put: aString 
]

{ #category : #'as yet unclassified' }
ASTerms >> raw [
	
	 self at:'raw' put: true 
]

{ #category : #accessing }
ASTerms >> regex: aString [
	
	 self at:'regex' put: aString 
]

{ #category : #'as yet unclassified' }
ASTerms >> regexFlag: aString [
	
	 self at:'regex.flag' put: aString 
]

{ #category : #sorting }
ASTerms >> sortByCount [
	
	 self at:'sort' put: 'count' 
]

{ #category : #sorting }
ASTerms >> sortByIndex [
	
	 self at:'sort' put: 'index' 
]

{ #category : #accessing }
ASTerms >> stats [
	
	 self at:'stats' put: true 
]

{ #category : #'as yet unclassified' }
ASTerms >> tagField [
	^ 'terms.'
]

{ #category : #'as yet unclassified' }
ASTerms >> ttf [
	
	 self at:'ttf' put: true
]

{ #category : #'as yet unclassified' }
ASTerms >> upper: aString [
	
	 self at:'upper' put: aString 
]
