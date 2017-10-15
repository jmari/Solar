enumerating
keysAndValuesDo: aBlock
	self do:[:each|
			aBlock value: each key value:each value ]