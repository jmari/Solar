client-api
removeByQuery: aQuery callback: aBlock
	"removes all the ocurrences "
	self q:aQuery.
	^ self updateAndCallback: aBlock