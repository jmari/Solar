client-api
update:docs callback: aBlock
	| url entity jsonString oc|
	jsonString := SCSerializer serialize: docs.
	entity := (ZnStringEntity text: jsonString) contentType: ZnMimeType applicationJson.
	
	oc := OrderedCollection new.
	
	url := oc 
					addAll:self path ;
					add:self core;
					addAll: self updateJSONHandler;
					yourself.

	^ self post: url entity:entity callback:aBlock