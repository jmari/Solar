operations
unloadAndDeleteIndex: aCore 
	self unload:aCore.
	self at:'deleteIndex' put: true
	