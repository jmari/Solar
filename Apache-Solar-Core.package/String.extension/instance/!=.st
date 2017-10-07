*Apache-Solar-Core
!= aNumber
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