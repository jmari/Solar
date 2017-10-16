client-api
dismaxQuery: aBlockWithQuery
	
	aBlockWithQuery value: self dismaxQuery.
	httpMethod := #GET.
	httpHandler := self selectHandler.	
