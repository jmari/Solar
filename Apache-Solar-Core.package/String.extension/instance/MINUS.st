*Apache-Solar-Core
MINUS
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