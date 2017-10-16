client-api
terms: aBlock 
	"call terms handles"
	aBlock value: self terms.
	httpMethod := #GET.
	httpHandler := self terms handler.

	