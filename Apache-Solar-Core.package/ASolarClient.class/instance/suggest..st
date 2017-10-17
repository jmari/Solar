factory
suggest: aBlockWithQuery

	httpMethod := #GET.
	httpHandler := self suggest handler.	
	aBlockWithQuery value: self suggest