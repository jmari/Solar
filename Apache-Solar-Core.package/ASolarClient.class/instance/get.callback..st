http
get: handler callback: callback
	|tmpPath response result|

	self httpClient 
		headerAt: 'accept' put: 'application/json; charset=utf-8'.
	tmpPath := OrderedCollection new.
	(handler = self collectionsHandler )
					ifTrue:[ tmpPath addAll:self path; addAll: handler ]
					ifFalse:[  tmpPath addAll: self path; add: self core; addAll: handler].
					
	self build.
	self httpClient queryAt:'wt' put:'json'.
	self httpClient addPath: tmpPath asArray.
	response := (self httpClient get;response).
	self resetZnClientPath.
	result := SCMaterializer materializeFromString:response contents. 
	response isSuccess 
						ifTrue: [ callback value: result ]
						ifFalse: [ self solrError: result ].