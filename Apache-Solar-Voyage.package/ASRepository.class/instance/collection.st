accessing
collection
	^ collection ifNil:[ self collection:	self defaultCollectionName. self defaultCollectionName].