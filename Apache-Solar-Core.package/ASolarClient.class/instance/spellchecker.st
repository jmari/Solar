factory
spellchecker
	
	^ spell ifNil:[ spell := ASSpellcheck new ]