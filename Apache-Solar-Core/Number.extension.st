Extension { #name : #Number }

{ #category : #'*Apache-Solar-Core' }
Number >> TO: anIntegerOrWildcard [
	 ^  String streamContents: [ :s|
		s 	nextPut: $[;
			nextPutAll: self asString;
			nextPut: Character space;
			nextPutAll: 'TO';
			nextPut: Character space;
			nextPutAll: anIntegerOrWildcard asString;
			nextPut: $]] 
]
