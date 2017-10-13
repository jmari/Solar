client-api
cores: aBlock callback: aCallbackBlock
	"call admin handles for cores and collections"
	self cores: aBlock.
	^ self adminAndCallback: aCallbackBlock 
	