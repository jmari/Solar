persistence
removeAll: aClass


	^ self solarClient 
				core:self collection;
				removeByQuery: {'#indexOf'-> aClass name};
				callback: [ :response| response ]
	
	
