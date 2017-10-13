client-api
collections: aBlock callback: aCallbackBlock
	"call admin handles for cores and collections"
	self collections: aBlock.
	^self adminAndCallback: aCallbackBlock 
	