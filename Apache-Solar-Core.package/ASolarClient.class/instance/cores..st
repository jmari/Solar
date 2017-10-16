client-api
cores: aBlock 
	"call admin handles for cores and collections"
	aBlock value: self cores. 
	httpMethod := #GET.
	httpHandler := self cores handler .	

	