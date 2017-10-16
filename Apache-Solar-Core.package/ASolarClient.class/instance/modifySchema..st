client-api
modifySchema: schemaInJSON
	"ask for admin schema, the chema modifications are passed has a JSON object (smalltalk format)"
	| entity jsonString|
	jsonString := self serializer serialize: schemaInJSON asSCJsonObject.
	entity := (ZnStringEntity text: jsonString) contentType: ZnMimeType applicationJson.
	httpMethod := #POST.
	httpHandler := self schemaHandler.
	httpEntity := entity.
