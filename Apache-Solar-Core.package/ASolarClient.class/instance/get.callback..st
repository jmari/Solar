http
get: handler callback: callback
	|tmpPath response result|

	self httpClient 
		headerAt: 'accept' put: 'application/json; charset=utf-8'.
	tmpPath := OrderedCollection new.
	(handler = self adminCollectionsHandler or:[handler = self adminCoresHandler or:[self hasCore not]] )
					ifTrue:[ tmpPath addAll:self path; addAll: handler ]
					ifFalse:[  tmpPath addAll: self path; add: self core; addAll: handler].
					
	self build.
	self httpClient queryAt:'wt' put:'json'.
	self httpClient addPath: tmpPath asArray.
	response := (self httpClient get;response).

	self resetZnClientPath.
	result := SCMaterializer materializeFromString:(response contents ifNil:['null']). 
	response isSuccess 
						ifTrue: [ callback value: result ]
						ifFalse: [ self solrError: result ].