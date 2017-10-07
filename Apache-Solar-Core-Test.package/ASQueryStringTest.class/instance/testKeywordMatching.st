tests
testKeywordMatching
	|qs|
	qs := ASQueryString from:{ #title->#foo}.
	self assert: qs equals: 'title:foo'. 
	qs := ASQueryString from:{ #title->'foo bar'}.
	self assert: qs equals: 'title:"foo bar"'. 	
	qs := ASQueryString from:{ #title-> 'foo bar'. 
										#AND.
										#body->'quick fox'} .
	self assert: qs equals: 'title:"foo bar" AND body:"quick fox"'. 	
	qs := ASQueryString from:{ 
										{	#title-> 'foo bar'. 
											#AND.
											#body->'quick fox'} .
											#OR.
											#title->#fox}.
	self assert: qs equals: '(title:"foo bar" AND body:"quick fox") OR title:fox'. 	