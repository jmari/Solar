accessing
q: aQuery
	self at: 'q' put:((aQuery isKindOf:SCJsonObject )
		ifTrue:[ self serializer serialize:aQuery]
		ifFalse:[ ASQueryString from:aQuery ])