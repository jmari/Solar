persistence
save: aDoc
	"insert or update a doc"

	^ self solarClient 
				core:self collection;
				add: aDoc callback: [ :response| response ]
