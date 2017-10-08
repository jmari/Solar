factory methods
interval

	^ interval ifNil:[ interval := ASInterval onAField: self]
	
		