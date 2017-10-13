accessing
split: aCore  path: aPath targetCore: targetCore
	self at:'action' put:'SPLIT'.
	self coreName:aCore.
	self at:'path' put:aPath.
	self at:'targetCore' put: targetCore 