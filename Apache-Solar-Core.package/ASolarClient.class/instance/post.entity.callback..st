http
post: urlArray entity:entity callback:aBlock
	| response result url  |
	"Adds a files and puts its file path as ID"
	url := OrderedCollection new.
	url  
		addAll:self path ;
		add:self core;
		addAll: urlArray.
					
	self build.
	self httpClient queryAt:'wt' put:'json'.

	response := ( self httpClient 
									addPath: url;
									entity: entity;
									post;
									response ).
	self resetZnClientPath.
	result := SCMaterializer materializeFromString:response contents. 
	response isSuccess 
						ifTrue: [ aBlock value: result ]
						ifFalse: [ self solrError: result ].

