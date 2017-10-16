client-api
add: docs
	"Adds a collection of objects (will be serialized as JSON and callback"
	| documents |
	documents := ( docs isKindOf: Collection ) ifTrue:[docs] ifFalse:[ Array with:docs].
	self update: documents. 
