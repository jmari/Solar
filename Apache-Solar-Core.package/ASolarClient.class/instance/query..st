client-api
query: aBlockWithQuery 
	
	aBlockWithQuery value: self query.
	httpMethod := #GET.
	httpHandler := self selectHandler.
