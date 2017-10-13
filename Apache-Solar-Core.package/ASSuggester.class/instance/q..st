accessing
q: aQuery
	self at: 'q' put:((aQuery isKindOf:SCJsonObject )
		ifTrue:[ SCSerializer serialize:aQuery]
		ifFalse:[ ASQueryString from:aQuery ])