accessing
collection: aCollectionName

	collection ~=aCollectionName ifTrue:[
		collection := self solarClient core: aCollectionName.
		[self 	solarClient cores: [:cores|
					cores
						name: aCollectionName;
						configSet:#basic_configs;
						create ]
				callback:[:r| r inspect]] 
		on:ASolarException 
		do:[:ex| ].
		self modifySchema:aCollectionName	].	