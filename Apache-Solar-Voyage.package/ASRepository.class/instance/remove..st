persistence
remove: anObject
	
	| uuid |
	uuid := self uuidProvider discoverIdFor: anObject.
	uuid ifNil:[ ASolarException signal:'Object does not have an ID.'].
	^ self solarClient 
				core:self collection;
				removeByQuery: {'_id'-> uuid}
				callback: [ :response| response ]