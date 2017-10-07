factory methods
pivot
	
	^ pivot	ifNil: [ pivot := ASPivot onAField: self ]
	
		