client-api
suggest: aBlock 
	aBlock value: self suggester.
	httpMethod := #GET.
	httpHandler := self suggester handler.
