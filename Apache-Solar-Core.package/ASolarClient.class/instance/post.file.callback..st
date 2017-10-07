http
post: aUrl file:fileReference callback: aBlock
	|stream type length|
	
	stream := ZnFileSystemUtils fileStreamFor: fileReference.
	stream binary.
	type := ZnMimeType forFilenameExtension: (ZnFileSystemUtils extensionFor: fileReference).
	length := ZnFileSystemUtils fileSizeFor: fileReference.
	
	self httpClient queryAt:'literal.id' put: fileReference fullPath  asString .
	self httpClient queryAt:'wt' put:'json'.	
	^ self post:aUrl 
			 entity:(ZnStreamingEntity readFrom: stream usingType: type andLength: length)
			 callback: aBlock


