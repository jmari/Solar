tests
testWildcarddMatching
	|qs|
	qs := ASQueryString from:{ #title->'foo*'}.
	self assert: qs equals: 'title:foo*'. 
	qs := ASQueryString from:{ #title->'foo*bar'}.
	self assert: qs equals: 'title:foo*bar'. 	
	qs := ASQueryString from:'foo bar'~ 4.
	self assert: qs equals: '"foo bar"~4'. 
	qs := ASQueryString from:{ #title->('foo bar'~4)}.
	self assert: qs equals: 'title:"foo bar"~4'. 