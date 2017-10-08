accessing
name:aDictionary put: anAssociation
	self at: (aDictionary ,'.', anAssociation key asString) put:anAssociation value