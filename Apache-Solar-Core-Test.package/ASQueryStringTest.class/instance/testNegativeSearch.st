tests
testNegativeSearch
	|qs|
	

	qs := ASQueryString from:'jakarta' NOT. 
	self assert: qs equals: '-jakarta'.

	qs := ASQueryString from: {#field->('*' TO:'*')}  NOT. 
	self assert: qs equals: '-(field:[* TO *])'.
		
	qs := ASQueryString from: (#field->('*' TO:'*'))  NOT. 
	self assert: qs equals: '-field:[* TO *]'.
	
	
	qs := ASQueryString from: (#field NOT)->('*' TO:'*'). 
	self assert: qs equals: '-field:[* TO *]'.