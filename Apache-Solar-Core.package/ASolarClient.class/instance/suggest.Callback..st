client-api
suggest: aBlock Callback: aCallbackBlock
	self suggester: aBlock.
	^ self suggestAndCallback: aCallbackBlock 