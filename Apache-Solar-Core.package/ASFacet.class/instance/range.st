factory methods
range

	^ range ifNil:[ range := ASRange onAField: self]
	
		