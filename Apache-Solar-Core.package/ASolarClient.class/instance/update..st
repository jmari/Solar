private-httpclient
update:docs 
	|  entity jsonString |
	jsonString := self serializer serialize: docs.
	entity := (ZnStringEntity text: jsonString) contentType: ZnMimeType applicationJson.
	httpMethod := #POST.
	httpHandler := self updateJSONHandler.
	httpEntity := entity.
	
