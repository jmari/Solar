client-api
spellcheck: aBlock callback: aCallbackBlock
	self spellchecker: aBlock.
	^ self searchSpellingAndCallback: aCallbackBlock 
