Extension { #name : #Collection }

{ #category : #'*Apache-Solar-Core' }
Collection >> ! anInteger [
	^ (ASQueryString  from:{self}) , (ASBoostOperator new:anInteger) 
	
]

{ #category : #'*Apache-Solar-Core' }
Collection >> != anInteger [
	^ (ASQueryString  from:{self}) , (ASConstantBoostOperator new:anInteger) 
]

{ #category : #'*Apache-Solar-Core' }
Collection >> NOT [
	^ '-',(ASQueryString  from:{self}) 
	
]

{ #category : #'*Apache-Solar-Core' }
Collection >> PLUS [
	^ '+',(ASQueryString  from:{self}) 
	
]

{ #category : #'*Apache-Solar-Core' }
Collection >> asASLocalParameters [

	^ String streamContents: [ :s|
		s 	nextPutAll: '{!';
			nextPutAll: (ASQueryString from: self usingCharacter:$=);
			nextPutAll: '}' ] 
]

{ #category : #'*Apache-Solar-Core' }
Collection >> asPlusString [
	"Return collection printed as 'a, b and c' "

	^String streamContents: [:s | self asStringOn: s delimiter: ' + ']
		
]

{ #category : #'*Apache-Solar-Core' }
Collection >> asSpacedString [
	"Return collection printed as 'a, b and c' "

	^String streamContents: [:s | self asStringOn: s delimiter: ' ']
		
]

{ #category : #'*Apache-Solar-Core' }
Collection >> butLast [
	^ self size> 1 
		ifTrue:[self copyFrom:1 to: (self size -1 )]
		ifFalse:[self]
]
