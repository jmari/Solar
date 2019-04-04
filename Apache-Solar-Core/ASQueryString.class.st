Class {
	#name : #ASQueryString,
	#superclass : #String,
	#category : 'Apache-Solar-Core-SpecialTypes'
}

{ #category : #private }
ASQueryString class >> convertToString: anObject [

	|dic|
	(anObject isKindOf: Boolean ) ifTrue:[^ anObject asString].
	(anObject isKindOf: Number  ) ifTrue:[^ anObject asString].
	(anObject isKindOf: String ) ifTrue: [  
		^ (anObject includesSubstring:  ' ') 
				ifTrue: [
					(self isNotSurrounded: anObject)
						ifTrue:[anObject surroundedBy:'"' ]
						ifFalse:[anObject]]
				ifFalse: [ anObject  ] ].
	(anObject isKindOf: Collection ) ifTrue: [ ^ '(',anObject asSpacedString,')' ].
	
	^ (anObject isKindOf: Dictionary )
			ifTrue:[ self convertToString: anObject associations]
			ifFalse:[  
						dic := OrderedCollection new.
						anObject class allInstVarNames do:[ :aiName|
							dic add: (aiName -> (anObject instVarNamed:aiName ))].
						self convertToString: dic]
]

{ #category : #'instance creation' }
ASQueryString class >> from: aQuery [ 
	^ self from: aQuery usingCharacter: $:
]

{ #category : #'instance creation' }
ASQueryString class >> from: aQuery usingCharacter: aChar [
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
]

{ #category : #private }
ASQueryString class >> isNotSurrounded: anObject [
	^ (self isSurrounded: anObject) not
]

{ #category : #private }
ASQueryString class >> isSurrounded: anObject [
	^ (anObject size>1 and:[
			anObject first=$" 
			or:[ anObject first=$[
			or:[ anObject first=${
					]]])
]
