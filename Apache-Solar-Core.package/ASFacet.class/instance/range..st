factory methods
range: aRangeBlock
	(aRangeBlock isKindOf: BlockClosure )
			ifTrue:[ 	aRangeBlock value: self range ]
			ifFalse: [ self at:'range' put: aRangeBlock]