client-api
spellchecker: aBlock 

	aBlock value: self spellchecker.
	httpMethod := #GET.
	httpHandler := self spellchecker handler.
