Class {
	#name : #ASolarTest,
	#superclass : #TestCase,
	#category : 'Apache-Solar-Core-Test'
}

{ #category : #adding }
ASolarTest >> addRemoteRessources [
	
	| solr  ressource|
	
	"ressource := FileLocator imageDirectory / 'Contents' / 'info.plist'."
	ressource := 'https://www.sample-videos.com/csv/Sample-Spreadsheet-10-rows.csv' asZnUrl.
	solr := ASolarClient host: '172.16.208.134' port:8983 userName:'admin' password:'admin'.
	
	solr 
		core:'techproducts';
		autoCommit;
		addRemoteRessource: ressource format:'csv';
		callback:[:result| result inspect]
]

{ #category : #adding }
ASolarTest >> addTest [
	
	| solr docs |
	docs := OrderedCollection new.
	1 to:10 do:[:each| docs add: { '_id' -> (25 + each).
											'title_t' -> ('Title'  , each asString).
											'description_t' -> ('Text ' , each asString ,'Alice')} asSCJsonObject].

	solr := ASolarClient host: '172.16.208.136' port:8983 userName:'admin' password:'admin'.
	solr 
			core:'techproducts';
			autoCommit;
			add: docs asArray callback:[:result| result inspect]
]

{ #category : #configuration }
ASolarTest >> defaultHost [
	^ '172.16.208.143'
]

{ #category : #'as yet unclassified' }
ASolarTest >> filterTest [
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host: '172.16.208.136' port:8983 userName:'admin' password:'admin'.
	solr core:'techproducts'.
	solr query:[ :query|
				query q: ('title_t'->'Title*'); 
"						q: 'price: 0 TO 400'; "
"						fl: #( #name #inStock #price);"
 						qf: {	'title_t'! 0.2.
								'description_t'!3.3 };
						fq: #popularity -> (10 TO: '*');
						fq: #section -> 0;
						mm:2;
						start:0;
						rows:10];
			callback:[:r| r inspect]
			"	solr query facet:[:f| f field:'cat']."
]

{ #category : #'as yet unclassified' }
ASolarTest >> queryFacetTest [
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host: '172.16.208.136' port:8983 userName:'admin' password:'admin'.
	solr core:'techproducts'.
	
	solr dismaxQuery:[:query|
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
						query: #price->(500 TO:'*')]];
			callback:[:r| r inspect].	

]

{ #category : #'as yet unclassified' }
ASolarTest >> queryTest [
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host: '172.16.208.136' port:8983 userName:'admin' password:'admin'.
	solr core:'techproducts'.
	solr query:[ :query|
				query q: ('title_t'->'Title*'); 
"						q: 'price: 0 TO 400'; "
"						fl: #( #name #inStock #price);"
 						qf: {	'title_t'! 0.2.
								'description_t'!3.3 };
						mm:2;
						start:0;
						rows:10];
			callback:[:r| r inspect]
			"	solr query facet:[:f| f field:'cat']."
]

{ #category : #'as yet unclassified' }
ASolarTest >> queryTest10 [
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host: '172.16.208.136' port:8983 userName:'admin' password:'admin'.
	solr core:'techproducts'.
	
	solr query:[:query|
				query 
					q: { 
							{ 	#field.
								#f->#myField}.
								#Foo.
								#Bar }
			];
			callback:[:r| r inspect].	

]

{ #category : #'as yet unclassified' }
ASolarTest >> queryTest2 [
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host: '172.16.208.136' port:8983 userName:'admin' password:'admin'.
	solr core:'techproducts'.
	solr dismaxQuery:[:query|
				query q: 'video'; 
						fl: #( #name #score)];
			callback:[:r| r inspect]

]

{ #category : #'as yet unclassified' }
ASolarTest >> queryTest6 [
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host: '172.16.208.135' port:8983 userName:'admin' password:'admin'.
	solr core:'techproducts'.
	
	solr dismaxQuery:[:query|
				query 
					q: 'video';
					fl: #('*' 'score')];
			callback:[:r| r inspect].
			
	solr dismaxQuery:[:query|
				query 
					q: 'video';
					qf: {
							#features!20.0.
							#text!0.3	}];
			callback:[:r| r inspect].
			
	solr dismaxQuery:[:query|
				query 
					q: 'video';
					fl: #( #name #score #inStock);
					qt: #instock ];
			callback:[:r| r inspect].
			
	solr dismaxQuery:[:query|
				query 
					q: #('belkin' 'ipod');
					debugQuery ];
			callback:[:r| r inspect]

]

{ #category : #adding }
ASolarTest >> testAddJSON [

	
	| solr docs |
	docs := OrderedCollection new.
	1 to:10 do:[:each| docs add: { 'id' -> (each + 100000).
											'title_t' -> ('Title'  , each asString).
											'description_t' -> ('Text ' , each asString ,'Alice')} asSCJsonObject].

	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.
	solr 
			core:'techproducts';
			autoCommit;
			add: docs asArray;
			callback:[:result| result inspect]
]

{ #category : #adding }
ASolarTest >> testAddPdfFile [
	
	| solr |


	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.
	solr 
			core:'demo';
			autoCommit;
			addFile: 'DB5.pdf' asFileReference;
			callback:[:result| result inspect]
]

{ #category : #tests }
ASolarTest >> testAdminCollections [
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host:self defaultHost  port:8983 userName:'admin' password:'admin'.

	solr collections: [:collections|
				collections
					name: 'smalltalk-collection';
					numShards:2;
					replicationFactor:1;
					create 
					 ];
			callback:[:r| r inspect].	

]

{ #category : #tests }
ASolarTest >> testAdminCore [
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host:self defaultHost  port:8983 userName:'admin' password:'admin'.

	
	solr cores: [:cores|
				cores
					name: 'smalltalk-core';
					configSet:#basic_configs;
					create 
					 ];
			callback:[:r| r inspect].	

]

{ #category : #tests }
ASolarTest >> testBoostQuery [
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.
	solr core:'techproducts'.
	solr edismaxQuery:[:query|
				query 
					q: { 
							{ #boost.
							 	#b->'log(popularity)'}.
							#foo
					 } ];
			callback:[:r| r inspect].
		
	
	solr edismaxQuery:[:query|
				query 
					q: { 
							{ 	#complexphrase.
							 	#inOrder->true}.
							#name -> { 'john'. 'jon'. 'jonathan~' }.
					 } ];
			callback:[:r| r inspect].	

]

{ #category : #tests }
ASolarTest >> testConfigCore [
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host:self defaultHost  port:8983 userName:'admin' password:'admin'.

	"'{
    'add-requesthandler' : {
      'name': '/mypath',
      'class':'solr.DumpRequestHandler',
      'defaults':{ 'x':'y' ,'a':'b', indent':true },
      'useParams':'x'
} }'"
	solr  
		core:'techproducts';
		config: { 'add-requesthandler' -> {
      						'name'-> '/mypath'.
      						'class'->'solr.DumpRequestHandler'.
      						'defaults'-> { 'x'->'y'. 'a'->'b'. 'indent'->true }.
      					 'useParams'->'x'} }  ;
		callback:[:r| r inspect].	

]

{ #category : #tests }
ASolarTest >> testFacetInterval [
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.
	
	solr  
		core:'techproducts';
		query:[:q| q 
						q:'*:*';
						facet:[ :facet|facet interval:'price']];
		f:[:f| 
			f  fieldName:#price;
				facet:[:facet| 
					facet interval:[:interv| 
						interv 	set:'[0,100]';
									set:'(100,200]']]]	;				
		callback:[:r| r inspect].	
			

]

{ #category : #tests }
ASolarTest >> testFacetPivot [
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.

	solr  
		core:'techproducts';
		query:[:query|
			query
				q:'*.*'; 
				facet:[ :facet|
					facet 
						query: { {#tag->#q1} asASLocalParameters.
									'manufacturedate_dt'->'[2006-01-01T00:00:00Z TO NOW]'}; 
						query: { {#tag->#q1} asASLocalParameters.
									#price->(0 TO: 100)}; 
						pivot:[:pivot| pivot <- {{ #query->#q1} asASLocalParameters.
															  'cat,inStock'}]]];
			callback:[:r| r inspect].	

]

{ #category : #tests }
ASolarTest >> testFacetPivotAsString [
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.

	solr  
		core:'techproducts';
		query:[:q|
			q q:'*:*';
			  facet:[ :facet|
					facet 
						query: '{!tag=q1}manufacturedate_dt:[2006-01-01T00:00:00Z TO NOW]'; 
						query: '{!tag=q1}price:[0 TO 100]'; 
						pivot:[:pivot| pivot <-'{!query=q1}cat,inStock']]];
		callback:[:r| r inspect].	


]

{ #category : #tests }
ASolarTest >> testFilter [
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.
		
	solr  
		core:'techproducts';
		query:[ :query|
				query q: ('manu'->'A*'); 
						fl: #( #name #manu #inStock #price);
 						qf: {	'name'! 0.2.
								'price'!3.3 };
						fq: #price -> (0 TO: 600);
						mm:2;
						start:0;
						rows:10];
			callback:[:r| r inspect]
]

{ #category : #tests }
ASolarTest >> testHighlighting [
	"hl=true&hl.snippets=5&hl.fl=content&hl.usePhraseHighlighter=true&hl.fragsize=300"
	
	|solr|	
	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.

	solr  
		core:'techproducts'; 
		query:[ :query|
				query q: ('manu'->'A*'); 
						fl: #( #name #manu #inStock #price);
 						qf: {	'name'! 0.2.
								'price'!3.3 };
						fq: #price -> (0 TO: 600);
						hl:[:hl|
							hl 
								snippets: 5;
								fl:#(#manu);
								usePhraseHighlighter;
								fragSize:300]
						];
			callback:[:r| r inspect]
]

{ #category : #tests }
ASolarTest >> testMoreLikeThis [
	"http://localhost:8983/solr/select?q=apache&mlt=true&mlt.fl=manu,cat&mlt.mindf=1&mlt.mintf=1&fl=id,score"
	|solr|	
	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.
	solr 
		core:'techproducts';
		query:[:query|
				query 
					q: 'apache';
					fl:#(#id score);
					mlt:[:mlt|
						mlt 
							fl:#(#manu #cat);
							mindf:1;
							mintf:1]
						];
		callback:[:r| r inspect].

]

{ #category : #tests }
ASolarTest >> testMultipleQueryExamples [
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.
	solr 
		core:'techproducts';
		edismaxQuery:[:query|
				query 
					q: 'hello';
					pf:'text';
					boost:'popularity' ];
		callback:[:r| r inspect].
			
	solr edismaxQuery:[:query|
				query 
					q: #('ipos' 'OR' 'video')];
			callback:[:r| r inspect].
			
			
	solr edismaxQuery:[:query|
				query 
					q:'video';
					qf: {  'features'!20.0.
							 'text'!0.3};
					sort: {  'div(popularity,price)'-> 'desc'.
								'score' -> 'desc'}];
			callback:[:r| r inspect]

]

{ #category : #tests }
ASolarTest >> testQuery9 [
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host:self defaultHost  port:8983 userName:'admin' password:'admin'.
	
	solr  core:'techproducts';
			edismaxQuery:[:query|
				query 
					q: { 
							{ 	#complexphrase.
							 	#inOrder->true}.
							#name -> '"(john jon jonathan~) peters*"'.
					 	} ];
			callback:[:r| r inspect].	

]

{ #category : #tests }
ASolarTest >> testQueryFaceting [
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.

	
	solr  
		core:'techproducts';
		dismaxQuery:[:query|
			query
				q:'*'; 
				facet:[:f|
					f  field:'manu';
		 				query: #price->('*' TO:100);
						query: #price->(100 TO:200);
						query: #price->(200 TO:300);
						query: #price->(300 TO:400);
						query: #price->(400 TO:500);
						query: #price->(500 TO:'*')]];
		callback:[:r| r inspect].	

]

{ #category : #tests }
ASolarTest >> testRangeFaceting [
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.
	
	"http://localhost:8983/solr/select?q=*:*&rows=0&facet=true&facet.range=price&   facet.range.start=0&facet.range.end=400&facet.range.gap=100"
	
	solr 	  
		core:'techproducts'; 
		dismaxQuery:[:query|
			query
				q:'*'->'*'; 
				rows:8;
				facet:[:f|
					f  range:[:r|
									r 	<-'price';
										start:0;
										end:400;
										gap:100]]];
		callback:[:r| r inspect].	

]

{ #category : #tests }
ASolarTest >> testRerankQuery [
	"  q=greetings&rq={!rerank reRankQuery=$rqq reRankDocs=1000 reRankWeight=3}&rqq=(hi+hello+hey+hiya)"
	|solr|	
	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.
	solr core:'techproducts';
		  query:[:query|
				query 
					q: 'greetings';
					rq: ({	#rerank. 
								#reRankQuery->'$rqq'.
								#reRankDocs->1000.
								#reRankWeight->3} asASLocalParameters);
					at:#rqq put:'(hi+hello+hey+hiya)'
					];
			callback:[:r| r inspect].		
	"we can add 	a new parameter using at: put:"

]

{ #category : #tests }
ASolarTest >> testSchemaAPI [
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host: self defaultHost port:8983 userName:'admin' password:'admin'.

	
	solr 
			core:'techproducts';
			schema:[:s| s current];
			callback:[:r| r inspect];
			schema:[:s| s version];
			callback:[:r| r inspect];	
			schema:[:s| s similarity ];
			callback:[:r| r inspect];	
			schema:[:s| s uniqueKey];
			callback:[:r| r inspect];	
			schema:[:s| s defaultOperatorForQueryParser ];
			callback:[:r| r inspect];	
			schema:[:s| s fields ];
			callback:[:r| r inspect];	
			schema:[:s| s field:'author';
							  includeDynamic ];
			callback:[:r| r inspect];	
			
			modifySchema:{'d-field'->{
       			'name'->'sell-by'.
       			'type'->'tdate'.
       			'stored'->true }};
			callback:	[:r| r inspect]
]

{ #category : #tests }
ASolarTest >> testSpellchecking [
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host: self defaultHost port:8983 userName:'admin' password:'admin'.
	
	"http://localhost:8983/solr/techproducts/spell?df=text&spellcheck.q=delll+ultra+sharp&spellch
eck=true&spellcheck.collateParam.q.op=AND"
	solr  
		core:'techproducts';
		spellchecker: [:spell|
				spell 
					df: 'text';
					q:'delll+ultra+sharp';
					collateParam:[:query| query qOp:'AND' ]];
		callback:[:r| r inspect].
		
]

{ #category : #tests }
ASolarTest >> testSuggestQuery [
	"http://localhost:8983/solr/techproducts/suggest?suggest=true&suggest.build=true&suggest.dictionar
  y=mySuggester&wt=json&suggest.q=elec"
	|solr|	
	solr := ASolarClient host:self defaultHost  port:8983 userName:'admin' password:'admin'.
	
	solr  core:'techproducts';
			suggest:[:suggest|
				suggest 
					build;
					dictionary:'mySuggester';
					q:'elec'];
			callback:[:r| r inspect].	

]

{ #category : #tests }
ASolarTest >> testTerms [
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host:self defaultHost  port:8983 userName:'admin' password:'admin'.

	
	solr 
			core:'techproducts';
			terms: [:terms|
				terms
					fl: 'name'];
			callback:[:r| r inspect].	

]
