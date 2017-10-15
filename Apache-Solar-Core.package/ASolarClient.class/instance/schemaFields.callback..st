schema-api
schemaFields: aFieldName callback: aBlock
	self get: ( self schemaFieldsHandler , aFieldName ) callback: aBlock