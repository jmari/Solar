client-api
schema: aSchemaBlock 
	aSchemaBlock value: self schema.
	httpMethod := #GET.
	httpHandler := self schema handler.
