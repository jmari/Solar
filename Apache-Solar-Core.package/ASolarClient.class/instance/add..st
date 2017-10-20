client-api
add: docs
	"Adds a collection of objects (will be serialized as JSON and callback"
	| documents d|
	d := docs asSCJsonObject.
	documents := (( d isKindOf: Collection ) and:[(d isKindOf:Dictionary) not])
		ifTrue:[docs] ifFalse:[ Array with:d].
		self update: documents. 
