Class {
	#name : #ASolarClient,
	#superclass : #Object,
	#instVars : [
		'httpClient',
		'host',
		'port',
		'core',
		'path',
		'query',
		'globalParameters',
		'fieldParameters',
		'spell',
		'cores',
		'collections',
		'suggester',
		'terms',
		'serializer',
		'schema',
		'httpMethod',
		'httpHandler',
		'httpEntity'
	],
	#category : 'Apache-Solar-Core'
}

{ #category : #'connection open/close' }
ASolarClient class >> host: host port:port userName: username password: password [
	| client |

	client := self basicNew.
	client host: host.
	client port: port.
	client basicAuth: username password: password.
	
	^ client
]

{ #category : #'connection open/close' }
ASolarClient class >> userName: userName password: password [

	^ self host: 'localhost' port: 8983 userName:userName password: password
	
			
]

{ #category : #'client-api' }
ASolarClient >> add: docs [
	"Adds a collection of objects (will be serialized as JSON and callback"
	| documents d|
	d := docs asSCJsonObject.
	documents := (( d isKindOf: Collection ) and:[(d isKindOf:Dictionary) not])
		ifTrue:[docs] ifFalse:[ Array with:d].
		self update: documents. 

]

{ #category : #adding }
ASolarClient >> addCSV: stream [
	"stream is a csv rows stream"
	| type length entity |

	type := ZnMimeType main:'text' sub:'csv' .
	stream binary.
	length := stream size.	
	entity := (ZnStringEntity text: stream contents) contentType: type.

	httpMethod := #POST.
	httpHandler := self updateCSVHandler.	
	httpEntity := entity.
]

{ #category : #'client-api' }
ASolarClient >> addFile: aFileHandler [
	"Adds a files and puts its file path as ID"
	self addFile: aFileHandler id: nil
]

{ #category : #'client-api' }
ASolarClient >> addFile: aFileHandler id: anId [
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
	


]

{ #category : #'client-api' }
ASolarClient >> addRemoteRessource: urlOrFilePath format: format [ 
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
	
	httpMethod := #GET.
	httpHandler := handler.	
		

]

{ #category : #'private-handlers' }
ASolarClient >> adminCollectionsHandler [
	^ #('admin' 'collections')
]

{ #category : #'private-handlers' }
ASolarClient >> adminCoresHandler [
	^ #('admin' 'cores')
]

{ #category : #http }
ASolarClient >> basicAuth: username password: password [
	self httpClient 
		username: username password: password;
		headerAt: 'accept' put: 'application/json; charset=utf-8';
		host:self host;
		port: self port
]

{ #category : #building }
ASolarClient >> build [
	self hasQuery ifTrue:[self httpClient queryAddWithDuplicatesAll:  self query build].
	self hasGlobalParameters ifTrue:[ self httpClient queryAddWithDuplicatesAll: self  g build].
	self hasFieldParameters ifTrue:[ self httpClient queryAddWithDuplicatesAll: self  f build  ].
	self hasSpellchecker ifTrue:[self httpClient queryAddWithDuplicatesAll:  self spellchecker build].
	self hasCoresOrCollections ifTrue:[self httpClient queryAddWithDuplicatesAll:  self cores ].
	self hasSuggester ifTrue:[self httpClient queryAddWithDuplicatesAll:  self suggest ].
	self hasTerms ifTrue:[self httpClient queryAddWithDuplicatesAll:  self terms ].
	self hasSchema ifTrue:[self httpClient queryAddWithDuplicatesAll:  self schema ].
]

{ #category : #'client-api' }
ASolarClient >> callback: aBlock [

	^ httpMethod = #GET
		ifTrue:[self get: httpHandler callback:aBlock]
		ifFalse:[self post:  httpHandler entity: httpEntity  callback: aBlock]
]

{ #category : #'private factory' }
ASolarClient >> collections [
	
	^ cores ifNil:[ collections := cores := ASCollections new ]
]

{ #category : #'client-api' }
ASolarClient >> collections: aBlock [
	"call admin handles for cores and collections"
	aBlock value: self collections. 
	httpMethod := #GET.
	httpHandler := self cores handler.	

	
]

{ #category : #'client-api' }
ASolarClient >> commit [
	"ask for commit changes"
	self autoCommit.
	self update: {}.
	self callback:[ :r|  ] 
]

{ #category : #'client-api' }
ASolarClient >> config: configCollection [
	"ask for config, the config is passes has a JSON object (smalltalk format)"
	|  entity jsonString |
	jsonString := self serializer serialize: configCollection asSCJsonObject.
	entity := (ZnStringEntity text: jsonString) contentType: ZnMimeType applicationJson.
	
	httpMethod := #POST.
	httpHandler := self configHandler.	
	httpEntity := entity.

]

{ #category : #'private-handlers' }
ASolarClient >> configHandler [
	^ #('config')
]

{ #category : #accessing }
ASolarClient >> core [
	^ core 
]

{ #category : #accessing }
ASolarClient >> core: aCore [
	core := aCore
]

{ #category : #'private factory' }
ASolarClient >> cores [
	^ cores ifNil:[ cores := ASCores new ]
]

{ #category : #'client-api' }
ASolarClient >> cores: aBlock [ 
	"call admin handles for cores and collections"
	aBlock value: self cores. 
	httpMethod := #GET.
	httpHandler := self cores handler .	

	
]

{ #category : #'private factory' }
ASolarClient >> dismaxQuery [
	
	^ query ifNil:[ query := ASDismaxQuery new ]
]

{ #category : #'client-api' }
ASolarClient >> dismaxQuery: aBlockWithQuery [
	
	aBlockWithQuery value: self dismaxQuery.
	httpMethod := #GET.
	httpHandler := self selectHandler.	

]

{ #category : #'reflective operations' }
ASolarClient >> doesNotUnderstand: aMessage [
	^ self g perform:aMessage selector withArguments:aMessage arguments .

]

{ #category : #'private factory' }
ASolarClient >> edismaxQuery [
	
	^ query ifNil:[ query := ASEDismaxQuery new ]
]

{ #category : #'client-api' }
ASolarClient >> edismaxQuery: aBlockWithQuery [ 
	
	aBlockWithQuery value: self edismaxQuery.
	httpMethod := #GET.
	httpHandler := self selectHandler.

]

{ #category : #parameters }
ASolarClient >> f [

	^ fieldParameters ifNil:[ fieldParameters := ASFieldParameter new ]
]

{ #category : #parameters }
ASolarClient >> f: aBlockWithFieldParameter [
	
	aBlockWithFieldParameter value: self f
]

{ #category : #parameters }
ASolarClient >> g [
	
	^ globalParameters ifNil:[ globalParameters := ASGlobalParameter new ]
]

{ #category : #parameters }
ASolarClient >> g: aBlockWithGlobalParameter [
	
	aBlockWithGlobalParameter value: self g
]

{ #category : #http }
ASolarClient >> get: handler callback: callback [
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
]

{ #category : #testing }
ASolarClient >> hasCollections [
	
	^ collections notNil 
]

{ #category : #testing }
ASolarClient >> hasCore [
	^ core notNil
]

{ #category : #testing }
ASolarClient >> hasCoresOrCollections [
	
	^ cores notNil
]

{ #category : #testing }
ASolarClient >> hasFieldParameters [
	
	^ fieldParameters notNil
]

{ #category : #testing }
ASolarClient >> hasGlobalParameters [
	
	^ globalParameters notNil
]

{ #category : #testing }
ASolarClient >> hasQuery [
	
	^ query notNil
]

{ #category : #testing }
ASolarClient >> hasSchema [
	
	^ schema notNil 
]

{ #category : #testing }
ASolarClient >> hasSpellchecker [
	
	^ spell notNil
]

{ #category : #testing }
ASolarClient >> hasSuggester [
	
	^ suggester notNil
]

{ #category : #testing }
ASolarClient >> hasTerms [
	
	^ terms notNil 
]

{ #category : #accessing }
ASolarClient >> host [
	^ host ifNil:[ host := 'localhost' ]
]

{ #category : #accessing }
ASolarClient >> host: aInetAddress [
	host := aInetAddress
]

{ #category : #'private-httpclient' }
ASolarClient >> httpClient [
	^ httpClient ifNil:[ httpClient := ZnClient new 	autoResetEntityMethods: #(HEAD DELETE GET);yourself ]
]

{ #category : #'client-api' }
ASolarClient >> modifySchema: schemaInJSON [
	"ask for admin schema, the chema modifications are passed has a JSON object (smalltalk format)"
	| entity jsonString|
	jsonString := self serializer serialize: schemaInJSON asSCJsonObject.
	entity := (ZnStringEntity text: jsonString) contentType: ZnMimeType applicationJson.
	httpMethod := #POST.
	httpHandler := self schemaHandler.
	httpEntity := entity.

]

{ #category : #accessing }
ASolarClient >> path [
	^ path ifNil:[ path := Array with:'solr']
]

{ #category : #accessing }
ASolarClient >> path: anArray [
	path := anArray
]

{ #category : #'private-handlers' }
ASolarClient >> pingHandler [
	^ #('admin' 'ping')
]

{ #category : #accessing }
ASolarClient >> port [
	^ port ifNil:[ port := 8983]
]

{ #category : #accessing }
ASolarClient >> port: aPort [
	port := aPort
]

{ #category : #http }
ASolarClient >> post: urlArray entity:entity callback:aBlock [
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


]

{ #category : #'private factory' }
ASolarClient >> query [
	
	^ query ifNil:[ query := ASQuery new ]
]

{ #category : #'client-api' }
ASolarClient >> query: aBlockWithQuery [ 
	
	aBlockWithQuery value: self query.
	httpMethod := #GET.
	httpHandler := self selectHandler.

]

{ #category : #'client-api' }
ASolarClient >> realTimeGet: ids [ 
	self query ids: ((ids isKindOf: Array) ifTrue:[ ids] ifFalse:[ Array new:ids ]).
	httpMethod := #GET.
	httpHandler := self realTimeGetHandler.

	
]

{ #category : #'private-handlers' }
ASolarClient >> realTimeGetHandler [
	^ #( 'get' )
]

{ #category : #'client-api' }
ASolarClient >> remove: aFieldOrAlistOfIds [
	"removes all the ocurrences "
	|  entity jsonString |
	jsonString := self serializer serialize: aFieldOrAlistOfIds.
	entity := (ZnStringEntity text: jsonString) contentType: ZnMimeType applicationJson.
	httpMethod := #POST.
	httpHandler := self updateHandler.	
	httpEntity := entity.
	 


]

{ #category : #'client-api' }
ASolarClient >> removeByQuery: aQuery [ 
	"removes all the ocurrences "
	self query q:aQuery.
	httpMethod := #GET.
	httpHandler := self updateHandler.

]

{ #category : #'private-httpclient' }
ASolarClient >> resetZnClientPath [
"	|url|
	url := self httpClient request url."
	self httpClient url: ''.
	query:= globalParameters:= fieldParameters :=collections := nil.
	schema := spell := cores:= suggester:= terms :=nil
	
"	url hasQuery ifTrue:[self httpClient request url queryAddAll: url query]"
]

{ #category : #'private factory' }
ASolarClient >> schema [
	^ schema ifNil:[ schema := ASSchema new ] 
]

{ #category : #'client-api' }
ASolarClient >> schema: aSchemaBlock [ 
	aSchemaBlock value: self schema.
	httpMethod := #GET.
	httpHandler := self schema handler.

]

{ #category : #'private-handlers' }
ASolarClient >> schemaHandler [
	^ #('schema')
]

{ #category : #'private-handlers' }
ASolarClient >> selectHandler [
	^ #('select')
]

{ #category : #accessing }
ASolarClient >> serializer [
	^ serializer ifNil:[ serializer := SCSerializer new idField: 'id'] 
]

{ #category : #'private-httpclient' }
ASolarClient >> solrError: aJsonSolrError [
	ASolarException signal: aJsonSolrError
]

{ #category : #'private factory' }
ASolarClient >> spellchecker [
	
	^ spell ifNil:[ spell := ASSpellcheck new ]
]

{ #category : #'client-api' }
ASolarClient >> spellchecker: aBlock [ 

	aBlock value: self spellchecker.
	httpMethod := #GET.
	httpHandler := self spellchecker handler.

]

{ #category : #'private factory' }
ASolarClient >> suggest [

	^ suggester ifNil:[ suggester := ASSuggester new ]
]

{ #category : #'client-api' }
ASolarClient >> suggest: aBlockWithQuery [


	aBlockWithQuery value: self suggest.
	httpMethod := #GET.
	httpHandler := self suggest handler.	
]

{ #category : #'private factory' }
ASolarClient >> terms [

	^ terms ifNil:[ terms := ASTerms new ]
]

{ #category : #'client-api' }
ASolarClient >> terms: aBlock [ 

	aBlock value: self terms.
	httpMethod := #GET.
	httpHandler := self terms handler.

	
]

{ #category : #'private-httpclient' }
ASolarClient >> update:docs [ 
	|  entity jsonString |
	jsonString := self serializer serialize: docs.
	entity := (ZnStringEntity text: jsonString) contentType: ZnMimeType applicationJson.
	httpMethod := #POST.
	httpHandler := self updateJSONHandler.
	httpEntity := entity.
	

]

{ #category : #'private-handlers' }
ASolarClient >> updateCSVHandler [
	^ self version > 4.0 ifTrue:[#( 'update' 'csv')] ifFalse:[ #('update')]
]

{ #category : #'private-handlers' }
ASolarClient >> updateExtractHandler [
	^ #( 'update' 'extract')
]

{ #category : #'private-handlers' }
ASolarClient >> updateHandler [
	^ #('update')
]

{ #category : #'private-handlers' }
ASolarClient >> updateJSONHandler [
	^ self version > 4.0 ifTrue:[#( 'update' 'json')] ifFalse:[ #('update')]
]

{ #category : #versions }
ASolarClient >> version [
	^ 6.4
]
