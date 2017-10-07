accessing
qf: aQuery 
	 self at:'qf' put: (
		((aQuery isKindOf: Collection ) and:[(aQuery isKindOf: String ) not])
			ifTrue:[aQuery asPlusString ] 
			ifFalse:[	aQuery])