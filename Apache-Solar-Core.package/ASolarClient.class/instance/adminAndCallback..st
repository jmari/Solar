private-client-api
adminAndCallback: aBlock
	"call admin handles for cores and collections"
	^ self hasCollections 
				ifTrue: [ self get: self adminCollectionsHandler  callback:aBlock]
				ifFalse: [ self get: self adminCoresHandler  callback:aBlock]