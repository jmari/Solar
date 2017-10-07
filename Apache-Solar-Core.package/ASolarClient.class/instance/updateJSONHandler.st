private-handlers
updateJSONHandler
	^ self version > 4.0 ifTrue:[#( 'update' 'json')] ifFalse:[ #('update')]