accessing
interval

	^ interval ifNil:[ interval := ASInterval onAField: self]
	
		