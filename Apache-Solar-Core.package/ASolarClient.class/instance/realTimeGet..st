client-api
realTimeGet: ids 
	self query ids: ((ids isKindOf: Array) ifTrue:[ ids] ifFalse:[ Array new:ids ]).
	httpMethod := #GET.
	httpHandler := self realTimeGetHandler.

	