client-api
add: docs callback: aBlock
	"Adds a collection of objects (will be serialized as JSON and callback"
	| documents |
	documents := ( docs isKindOf: Collection ) ifTrue:[docs] ifFalse:[ Array new:docs].
	^ self update:docs callback: aBlock