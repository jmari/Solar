client-api
addRemoteRessource: urlOrFilePath format: format callback: aBlock 
	"Ask to the server for adding remote file 
	 format of the resource. XML, CSV or JSON formats must be used."
	| handler |
	(urlOrFilePath isKindOf: ZnUrl )  
		ifTrue:[ self httpClient queryAt:'stream.url' put: urlOrFilePath asString ]
		ifFalse:[ self httpClient queryAt:'stream.file' put: urlOrFilePath].
		
	handler := OrderedCollection withAll:  self updateHandler.
	(format = 'xml') ifFalse:[handler add: format]. 
	self httpClient queryAt:'stream.contentType' put: 'text/plain;charset=utf-8'.
	self httpClient queryAt:'literal.id' put: urlOrFilePath asString stringhash.
	self get: handler callback: aBlock 