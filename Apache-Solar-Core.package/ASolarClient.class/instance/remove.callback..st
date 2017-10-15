client-api
remove: aFieldOrAlistOfIds callback: aBlock
	"removes all the ocurrences "
	| url entity jsonString oc|
	jsonString := self serializer serialize: aFieldOrAlistOfIds.
	entity := (ZnStringEntity text: jsonString) contentType: ZnMimeType applicationJson.
	
	oc := OrderedCollection new.
	
	url := oc 
					addAll:self path ;
					add:self core;
					addAll: self updateHandler;
					yourself.

	^ self post: url entity:entity callback:aBlock
