factory methods
pivot: aPivotBlock
		(aPivotBlock isKindOf: BlockClosure )
			ifTrue:[ 	aPivotBlock value: self pivot ]
			ifFalse: [ self at:'pivot' put: aPivotBlock]