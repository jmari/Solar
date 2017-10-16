client-api
callback: aBlock

	^ httpMethod = #GET
		ifTrue:[self get: httpHandler callback:aBlock]
		ifFalse:[self post:  httpHandler entity: httpEntity  callback: aBlock]