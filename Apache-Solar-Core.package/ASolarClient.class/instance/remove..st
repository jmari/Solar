client-api
remove: aFieldOrAlistOfIds
	"removes all the ocurrences "
	|  entity jsonString |
	jsonString := self serializer serialize: aFieldOrAlistOfIds.
	entity := (ZnStringEntity text: jsonString) contentType: ZnMimeType applicationJson.
	httpMethod := #POST.
	httpHandler := self updateHandler.	
	httpEntity := entity.
	 

