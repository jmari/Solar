Class {
	#name : #ASQueryStringTest,
	#superclass : #TestCase,
	#category : 'Apache-Solar-Core-Test'
}

{ #category : #tests }
ASQueryStringTest >> testBoostsSearch [
	|qs|
	qs := ASQueryString from:{	{ #title-> (1000 TO: 2000)}!1.5. 
										{ #title-> (0 TO: 20)}!2.5.}.
	self assert: qs equals: '(title:[1000 TO 2000])^1.5 (title:[0 TO 20])^2.5'.

	qs := ASQueryString from:{	{ #title-> (1000 TO: 2000)}!=1.5. 
										{ #title-> (0 TO: 20)}!=2.5.}.
	self assert: qs equals: '(title:[1000 TO 2000])^=1.5 (title:[0 TO 20])^=2.5'.
	
	
		qs := ASQueryString from:{	{ #title-> ('*' TO: 2000)}!=1.5. 
										{ #title-> (0 TO: '*')}!=2.5.}.
	self assert: qs equals: '(title:[* TO 2000])^=1.5 (title:[0 TO *])^=2.5'.
	
		
	qs := ASQueryString from:'jakarta apache'! 4.
	self assert: qs equals: '"jakarta apache"^4'.
	
	qs := ASQueryString from:'jakarta'! 4.
	self assert: qs equals: 'jakarta^4'.
	
	
	qs := ASQueryString from:'jakarta apache'!= 4.
	self assert: qs equals: '"jakarta apache"^=4'.
	
	qs := ASQueryString from:{{#description -> #blue. 
										#OR. 
										#color->#blue}!=1.0. 
										#text->#shoes}.
	self assert: qs equals: '(description:blue OR color:blue)^=1.0 text:shoes'.
	

	qs := ASQueryString from:'jakarta' NOT. 
	self assert: qs equals: '-jakarta'.

	qs := ASQueryString from: {#field->('*' TO:'*')}  NOT. 
	self assert: qs equals: '-(field:[* TO *])'.
		
	qs := ASQueryString from: (#field->('*' TO:'*'))  NOT. 
	self assert: qs equals: '-field:[* TO *]'.
	
	
	qs := ASQueryString from: (#field NOT)->('*' TO:'*'). 
	self assert: qs equals: '-field:[* TO *]'.
]

{ #category : #tests }
ASQueryStringTest >> testKeywordMatching [
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
]

{ #category : #tests }
ASQueryStringTest >> testNegativeSearch [
	|qs|
	

	qs := ASQueryString from:'jakarta' NOT. 
	self assert: qs equals: '-jakarta'.

	qs := ASQueryString from: {#field->('*' TO:'*')}  NOT. 
	self assert: qs equals: '-(field:[* TO *])'.
		
	qs := ASQueryString from: (#field->('*' TO:'*'))  NOT. 
	self assert: qs equals: '-field:[* TO *]'.
	
	
	qs := ASQueryString from: (#field NOT)->('*' TO:'*'). 
	self assert: qs equals: '-field:[* TO *]'.
]

{ #category : #tests }
ASQueryStringTest >> testRangeSearch [
	|qs|
	qs := ASQueryString from:{ #title-> (1000 TO: 2000).}.
	self assert: qs equals: 'title:[1000 TO 2000]'
	

	
]

{ #category : #tests }
ASQueryStringTest >> testWildcarddMatching [
	|qs|
	qs := ASQueryString from:{ #title->'foo*'}.
	self assert: qs equals: 'title:foo*'. 
	qs := ASQueryString from:{ #title->'foo*bar'}.
	self assert: qs equals: 'title:foo*bar'. 	
	qs := ASQueryString from:'foo bar'~ 4.
	self assert: qs equals: '"foo bar"~4'. 
	qs := ASQueryString from:{ #title->('foo bar'~4)}.
	self assert: qs equals: 'title:"foo bar"~4'. 
]
