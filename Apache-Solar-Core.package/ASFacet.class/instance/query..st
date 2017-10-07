accessing
query: aQuery
	self at: 'query' put:((aQuery isKindOf:SCJsonObject )
		ifTrue:[ SCSerializer serialize:aQuery]
		ifFalse:[ ASQueryString from:aQuery ])