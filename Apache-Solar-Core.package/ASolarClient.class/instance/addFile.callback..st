client-api
addFile: aFileHandler callback: aBlock
	| url oc|
	oc := OrderedCollection new.
	
	url := oc 
					addAll:self path ;
					add:self core;
					addAll: self updateExtractHandler;
					yourself.
					
	^ self post: url file: aFileHandler callback: aBlock