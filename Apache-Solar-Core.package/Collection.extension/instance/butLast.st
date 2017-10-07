*Apache-Solar-Core
butLast
	^ self size> 1 
		ifTrue:[self copyFrom:1 to: (self size -1 )]
		ifFalse:[self]