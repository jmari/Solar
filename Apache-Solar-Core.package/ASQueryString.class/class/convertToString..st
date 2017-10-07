private
convertToString: anObject

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