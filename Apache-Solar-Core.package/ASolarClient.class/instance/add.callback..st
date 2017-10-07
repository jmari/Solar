client-api
add: docs callback: aBlock
	| documents |
	documents := ( docs isKindOf: Collection ) ifTrue:[docs] ifFalse:[ Array new:docs].
	^ self update:docs callback: aBlock