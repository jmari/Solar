client-api
config: configCollection callback: aBlock
	"ask for config, the config is passes has a JSON object (smalltalk format)"
	| url entity jsonString oc|
	jsonString := SCSerializer serialize: configCollection asSCJsonObject.
	entity := (ZnStringEntity text: jsonString) contentType: ZnMimeType applicationJson.
	
	oc := OrderedCollection new.
	
	url := oc 
					addAll:self path ;
					add:self core;
					addAll: self configHandler;
					yourself.

	^ self post: url entity:entity callback:aBlock