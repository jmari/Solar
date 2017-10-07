*Apache-Solar-Core
asASLocalParameters

	^ String streamContents: [ :s|
		s 	nextPutAll: '{!';
			nextPutAll: (ASQueryString from: self usingCharacter:$=);
			nextPutAll: '}' ] 