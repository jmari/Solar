private-httpclient
httpClient
	^ httpClient ifNil:[ httpClient := ZnClient new ]