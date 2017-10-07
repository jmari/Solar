factory
unifiedHl
	 ^ hl ifNil: [
				self at:'hl' put:true.
				hl := ASUnifiedHighlighter new] 