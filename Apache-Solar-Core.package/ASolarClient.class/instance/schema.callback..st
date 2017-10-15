schema-api
schema: schemaInJSON callback: aBlock
	"ask for admin schema, the chema modifications are passed has a JSON object (smalltalk format)"
	| url entity jsonString oc|
	jsonString := self serializer serialize: schemaInJSON asSCJsonObject.
	entity := (ZnStringEntity text: jsonString) contentType: ZnMimeType applicationJson.
	
	oc := OrderedCollection new.
	
	url := oc 
					addAll:self path ;
					add:self core;
					addAll: self schemaHandler;
					yourself.

	^ self post: url entity:entity callback:aBlock