http
post: urlArray entity:entity callback:aBlock
	| response result|

	response := ( self httpClient 
									addPath: urlArray;
									entity: entity;
									post;
									response ).
	self resetZnClientPath.
	result := SCMaterializer materializeFromString:response contents. 
	response isSuccess 
						ifTrue: [ aBlock value: result ]
						ifFalse: [ self solrError: result ].

