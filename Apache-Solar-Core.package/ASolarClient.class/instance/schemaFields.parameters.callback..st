schema-api
schemaFields: aFieldName  parameters: aBlock callback: anotherBlock
	"set global parameters before calling the handler"
	|handler|
	self g:aBlock.
	handler := OrderedCollection new.
	handler 	
		addAll:self schemaFieldsHandler;
		add: aFieldName.
	
	self get: handler callback: anotherBlock