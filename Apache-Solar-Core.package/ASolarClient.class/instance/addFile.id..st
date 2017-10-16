client-api
addFile: aFileHandler id: anId
	| stream type length entity |
	
	anId 
		ifNil:[ self httpClient queryAt:'literal.id' put: aFileHandler fullName  asString]
		ifNotNil:[ self httpClient queryAt:'literal.id' put: anId].		
	stream := ZnFileSystemUtils fileStreamFor: aFileHandler.
	stream binary.
	type := ZnMimeType forFilenameExtension: (ZnFileSystemUtils extensionFor: aFileHandler).
	length := ZnFileSystemUtils fileSizeFor: aFileHandler.
	entity := (ZnStreamingEntity readFrom: stream usingType: type andLength: length).

	httpMethod := #POST.
	httpHandler := self updateExtractHandler.	
	httpEntity := entity.
	

