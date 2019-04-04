Class {
	#name : #ASFacetTest,
	#superclass : #TestCase,
	#category : 'Apache-Solar-Core-Test'
}

{ #category : #tests }
ASFacetTest >> testFacetInABlock [

	|query|

	query:= ASQuery new.

	query facet:[:f|
	
		f 	query: #price->('*' TO:100);
			query: #price->(100 TO:200);
			query: #price->(200 TO:300);
			query: #price->(300 TO:400);
			query: #price->(400 TO:500);
			query: #price->(500 TO:'*')].


	self assert: (query facet at:1) equals:('facet.query'->'price:[* TO 100]').
	self assert: (query facet at:2) equals:('facet.query'->'price:[100 TO 200]').	
	self assert: (query facet at:3) equals:('facet.query'->'price:[200 TO 300]').	
	self assert: (query facet at:4) equals:('facet.query'->'price:[300 TO 400]').	
	self assert: (query facet at:5) equals:('facet.query'->'price:[400 TO 500]').	
	self assert: (query facet at:6) equals:('facet.query'->'price:[500 TO *]').	
	"&facet=true
   &facet.query=price:[* TO 100]
   &facet.query=price:[100 TO 200]
   &facet.query=[price:200 TO 300]
   &facet.query=price:[300 TO 400]
   &facet.query=[price:400 TO 500]
   &facet.query=price:[500 TO *]"
]

{ #category : #tests }
ASFacetTest >> testQueryWithFacetInABlock [

	|query|

	query:= ASQuery new.

	query
		q:'camera'; 
		facet:[:f|
		f  field:'manu';
			field:'camera_type';
		 	query: #price->('*' TO:100);
			query: #price->(100 TO:200);
			query: #price->(200 TO:300);
			query: #price->(300 TO:400);
			query: #price->(400 TO:500);
			query: #price->(500 TO:'*')].
	query build.
	self assert: (query at:1) equals:('q'->'camera').
	self assert: (query at:2) equals:('facet'->true).	
	self assert: (query at:3) equals: ('facet.field'->'manu').
	self assert: (query at:4) equals: ('facet.field'->'camera_type').
	self assert: (query at:5) equals:('facet.query'->'price:[* TO 100]').
	self assert: (query at:6) equals:('facet.query'->'price:[100 TO 200]').	
	self assert: (query at:7) equals:('facet.query'->'price:[200 TO 300]').	
	self assert: (query at:8) equals:('facet.query'->'price:[300 TO 400]').	
	self assert: (query at:9) equals:('facet.query'->'price:[400 TO 500]').	
	self assert: (query at:10) equals:('facet.query'->'price:[500 TO *]').	

]
