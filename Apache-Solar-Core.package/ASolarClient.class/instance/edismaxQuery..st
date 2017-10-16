client-api
edismaxQuery: aBlockWithQuery 
	
	aBlockWithQuery value: self edismaxQuery.
	httpMethod := #GET.
	httpHandler := self selectHandler.
