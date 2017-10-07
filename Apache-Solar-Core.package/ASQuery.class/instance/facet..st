accessing
facet: aBlockWithFacetParameter
	
	(aBlockWithFacetParameter isKindOf: BlockClosure )
		ifTrue:[ 	aBlockWithFacetParameter value: self facet ]
		ifFalse: [ self at:'facet' put: aBlockWithFacetParameter]