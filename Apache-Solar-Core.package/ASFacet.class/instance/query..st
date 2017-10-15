accessing
query: aQuery
	self at: 'query' put:((aQuery isKindOf:SCJsonObject )
		ifTrue:[ self serializer serialize:aQuery]
		ifFalse:[ ASQueryString from:aQuery ])