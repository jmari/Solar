private-httpclient
resetZnClientPath
"	|url|
	url := self httpClient request url."
	self httpClient url: ''.
	query:= globalParameters:= fieldParameters :=nil
	
"	url hasQuery ifTrue:[self httpClient request url queryAddAll: url query]"