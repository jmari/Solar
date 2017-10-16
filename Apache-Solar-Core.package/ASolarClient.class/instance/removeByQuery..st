client-api
removeByQuery: aQuery 
	"removes all the ocurrences "
	self query q:aQuery.
	httpMethod := #GET.
	httpHandler := self updateHandler.
