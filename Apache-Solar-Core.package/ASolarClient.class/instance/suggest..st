client-api
suggest: aBlockWithQuery


	aBlockWithQuery value: self suggest.
	httpMethod := #GET.
	httpHandler := self suggest handler.	