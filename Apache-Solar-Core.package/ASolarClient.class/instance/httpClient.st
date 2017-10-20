private-httpclient
httpClient
	^ httpClient ifNil:[ httpClient := ZnClient new 	autoResetEntityMethods: #(HEAD DELETE GET);yourself ]