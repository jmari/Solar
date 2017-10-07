instance creation
from: aQuery usingCharacter: aChar
	|queryStream|
	
	queryStream := WriteStream on:String new.
	
	^ self fromString:  (
	
	((aQuery isKindOf: Collection ) and:[(aQuery isKindOf: String ) not] )
		ifTrue:[
			aQuery doWithIndex:[:each :index|
				((each isKindOf: Collection ) and:[(each isKindOf: String ) not] )
				ifTrue:[
					queryStream 
						nextPut:$(;
						nextPutAll: (self from: each);
					 	nextPut:$)] 
				ifFalse:[  
					(each isKindOf: Association)
						ifTrue:[
							queryStream 
								nextPutAll: each key asString;
								nextPut: aChar;
							 	nextPutAll: (self convertToString: each value )]
						ifFalse:[
							queryStream 
								nextPutAll: each asString]].
						((index < aQuery size) 
						and:[ ((each isKindOf:String) and:[self isNotSurrounded: each])
								or:[(each isKindOf:String) not]])
						ifTrue:[ queryStream nextPut: Character space]
			].
			queryStream contents]
		ifFalse:[
			(aQuery isKindOf: Association)
						ifTrue:[
							queryStream 
								nextPutAll: aQuery key asString;
								nextPut: aChar;
							 	nextPutAll: (self convertToString: aQuery value ).
							queryStream contents	]
						ifFalse:[aQuery asString]])