client-api
collections: aBlock
	"call admin handles for cores and collections"
	aBlock value: self collections. 
	httpMethod := #GET.
	httpHandler := self cores handler.	

	