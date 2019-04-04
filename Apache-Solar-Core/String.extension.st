Extension { #name : #String }

{ #category : #'*Apache-Solar-Core' }
String >> ! aNumber [
	|selfy|
	selfy := (self includesSubstring:' ') 
		ifTrue:[
			(self size > 1 and:[self first ~=$"]) 
				ifTrue:[ self surroundedBy: '"'] 
				ifFalse:[self]]
		ifFalse:[self].
	^ self class streamContents: [ :s|
		s nextPutAll: selfy.
		s nextPutAll: (ASBoostOperator new: aNumber) ] 
]

{ #category : #'*Apache-Solar-Core' }
String >> != aNumber [
	|selfy|
	selfy := (self includesSubstring:' ') 
		ifTrue:[
			(self size > 1 and:[self first ~=$"]) 
				ifTrue:[ self surroundedBy: '"'] 
				ifFalse:[self]]
		ifFalse:[self].
	^ self class streamContents: [ :s|
		s nextPutAll: selfy.
		s nextPutAll: (ASConstantBoostOperator new: aNumber) ] 
]

{ #category : #'*Apache-Solar-Core' }
String >> MINUS [
	|selfy|
	selfy := (self includesSubstring:' ') 
		ifTrue:[
			(self size > 1 and:[self first ~=$"]) 
				ifTrue:[ self surroundedBy: '"'] 
				ifFalse:[self]]
		ifFalse:[self].
	^ self class streamContents: [ :s|
		s nextPutAll: '-'.
		s nextPutAll: selfy ] 
]

{ #category : #'*Apache-Solar-Core' }
String >> NOT [
	|selfy|
	selfy := (self includesSubstring:' ') 
		ifTrue:[
			(self size > 1 and:[self first ~=$"]) 
				ifTrue:[ self surroundedBy: '"'] 
				ifFalse:[self]]
		ifFalse:[self].
	^ self class streamContents: [ :s|
		s nextPutAll: '-'.
		s nextPutAll: selfy ] 
]

{ #category : #'*Apache-Solar-Core' }
String >> PLUS [
	|selfy|
	selfy := (self includesSubstring:' ') 
		ifTrue:[
			(self size > 1 and:[self first ~=$"]) 
				ifTrue:[ self surroundedBy: '"'] 
				ifFalse:[self]]
		ifFalse:[self].
	^ self class streamContents: [ :s|
		s nextPutAll: '+'.
		s nextPutAll: selfy ] 
]

{ #category : #'*Apache-Solar-Core' }
String >> TO: anIntegerOrWildcard [
	 ^  String streamContents: [ :s|
		s 	nextPut: $[;
			nextPutAll: self asString;
			nextPut: Character space;
			nextPutAll: 'TO';
			nextPut: Character space;
			nextPutAll: anIntegerOrWildcard asString;
			nextPut: $]] 
]

{ #category : #'*Apache-Solar-Core' }
String >> ~ anObject [
	|selfy|

	selfy := (self includesSubstring:' ') 
		ifTrue:[
			(self size > 1 and:[self first ~=$"]) 
				ifTrue:[ self surroundedBy: '"'] 
				ifFalse:[self]]
		ifFalse:[self].
	^ self class streamContents: [ :s|
		s nextPutAll: selfy.
		s nextPutAll: '~'.
		s nextPutAll: anObject asString ] 
]
