client-api
config: configCollection
	"ask for config, the config is passes has a JSON object (smalltalk format)"
	|  entity jsonString |
	jsonString := self serializer serialize: configCollection asSCJsonObject.
	entity := (ZnStringEntity text: jsonString) contentType: ZnMimeType applicationJson.
	
	httpMethod := #POST.
	httpHandler := self configHandler.	
	httpEntity := entity.
