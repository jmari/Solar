accessing
hl
	 ^ hl ifNil:[
		self at:'hl' put:true.
		hl := ASHighlighting new]