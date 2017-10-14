client-api
addFile: aFileHandler id: anId callback: aBlock
	| url oc |
	"Adds a files and puts its file path as ID"
	oc := OrderedCollection new.
	
	url := oc 
					addAll:self path ;
					add:self core;
					addAll: self updateExtractHandler;
					yourself.
	
	anId 
		ifNil:[ self httpClient queryAt:'literal.id' put: aFileHandler fullName  asString]
		ifNotNil:[ self httpClient queryAt:'literal.id' put: anId].
						
	^ self post: url file: aFileHandler callback: aBlock