client-api
terms: aBlock callback: aCallbackBlock
	"call terms handles"
	self terms: aBlock.
	^ self termsAndCallback: aCallbackBlock 
	