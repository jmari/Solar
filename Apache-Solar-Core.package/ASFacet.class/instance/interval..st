accessing
interval: anIntervalBlock
		(anIntervalBlock isKindOf: BlockClosure )
			ifTrue:[ 	anIntervalBlock value: self interval ]
			ifFalse: [ self at:'interval' put: anIntervalBlock]