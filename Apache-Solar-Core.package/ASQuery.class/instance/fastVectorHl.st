factory
fastVectorHl
	 ^ hl ifNil: [
				self at:'hl' put:true.
				hl := ASFastVectorHighlighter new] 