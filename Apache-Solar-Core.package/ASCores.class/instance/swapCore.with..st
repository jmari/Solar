operations
swapCore: aCore with:otherCore
	self at:'action' put: 'SWAP'.
	self coreName:aCore.
	self at:'otherCore' put:otherCore