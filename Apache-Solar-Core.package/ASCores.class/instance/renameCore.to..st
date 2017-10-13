operations
renameCore: aCore to:otherCore
	self at:'action' put: 'RENAME'.
	self coreName:aCore.
	self at:'otherCore' put:otherCore