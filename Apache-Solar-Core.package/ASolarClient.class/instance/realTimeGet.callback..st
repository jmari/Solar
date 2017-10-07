client-api
realTimeGet: ids callback: aBlock
	self query ids: ((ids isKindOf: Array) ifTrue:[ ids] ifFalse:[ Array new:ids ]).
	^ self get: self realTimeGetHandler  callback: aBlock
	