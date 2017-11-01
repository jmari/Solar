accessing
serializer
	^ serializer ifNil:[ serializer := SCSerializer new 
																	idField: 'id';
																	serializeAllCollectionsAsArrays;
																	yourself  ] 