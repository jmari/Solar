accessing
at: anObject put: otherObject
	self add: (( self tagField , anObject) -> otherObject)