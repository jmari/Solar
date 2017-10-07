factory
originalHl
	 ^ hl ifNil: [
				self at:'hl' put:true.
				hl := ASOriginalHighlighter new] 