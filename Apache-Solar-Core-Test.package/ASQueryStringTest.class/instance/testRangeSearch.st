tests
testRangeSearch
	|qs|
	qs := ASQueryString from:{ #title-> (1000 TO: 2000).}.
	self assert: qs equals: 'title:[1000 TO 2000]'
	

	