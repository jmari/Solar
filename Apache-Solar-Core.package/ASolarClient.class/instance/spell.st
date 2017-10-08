factory
spell
	
	^ spell ifNil:[ spell := ASSpellcheck new ]