Class {
	#name : #ASolarTutorial,
	#superclass : #TestCase,
	#category : 'Apache-Solar-Core-Test'
}

{ #category : #adding }
ASolarTutorial >> csvContent [
	| rwStream |
	rwStream := ReadWriteStream on:''.
	rwStream 
	nextPutAll:'id,cat_s,pubyear_i,title_t,author_s,series_s,sequence_i,publisher_s';crlf;
	nextPutAll:'book1,fantasy,2010,The Way of Kings,Brandon Sanderson,The Stormlight Archive,1,Tor';crlf;
	nextPutAll:'book2,fantasy,2010,The Way intentionally added to separate these words of Kings,Brandon Sanderson,The Stormlight Archive,1,Tor';crlf;
	nextPutAll:'book3,fantasy,1996,A Game of Thrones,George R.R. Martin,A Song of Ice and Fire,1,Bantam';crlf;
	nextPutAll:'book4,fantasy,1999,A Clash of Kings,George R.R. Martin,A Song of Ice and Fire,2,Bantam';crlf;
	nextPutAll:'book5,fantasy,1985,The Black Company,Glen Cook,The Black Company,1,Tor';crlf;
	nextPutAll:'book6,fantasy,1965,The Black Cauldron,Lloyd Alexander,The Chronicles of Prydain,2,Square Fish'.
	^ rwStream


]

{ #category : #adding }
ASolarTutorial >> defaultCore [
	^ 'new_core'
]

{ #category : #adding }
ASolarTutorial >> defaultHost [
	^ '172.16.208.143'
]

{ #category : #tests }
ASolarTutorial >> test0AdminCore [
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host:self defaultHost  port:8983 userName:'admin' password:'admin'.

	
	solr cores: [:cores|
				cores
					name: self defaultCore;
					configSet:#basic_configs;
					create 
					 ];
			callback:[:r| r inspect].	

]

{ #category : #tests }
ASolarTutorial >> test1AddJSON [

	
	| solr doc |
	doc:={'id' -> 'book0'.
   			'author_s'-> 'Brandon Sanderson'.
    		'title_t' -> 'The Way of Kings' }.

	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.
	
	solr 
			core:self defaultCore;
			autoCommit;
			add: doc;
			callback:[:result| result inspect].
		
	solr 
			core:self defaultCore;
			query:[:q| q q: 'id:book0'];
			callback:[:result| result inspect].
			
]

{ #category : #tests }
ASolarTutorial >> test23QueryPaging [

	
	| solr |


	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.

		
	solr 
			core:self defaultCore;
			query:[:query| 
						query 
							q: #id->'book*';
							sort: {#pubyear_i-> 'desc'};
							fl: #(#title_t #pubyear_i)];
			callback:[:result| result inspect].
			
]

{ #category : #tests }
ASolarTutorial >> test2QueryJSON [

	
	| solr |


	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.

		
	solr 
			core:self defaultCore;
			query:[:q| q q: 'id'->'book1'];
			callback:[:result| result inspect].
			
]

{ #category : #tests }
ASolarTutorial >> test3AddCSV [

	
	| solr rows |
	rows:= self csvContent.

	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.
	
	solr 
			core:self defaultCore;
			addCSV: rows;
			autoCommit;
			header;
			overwrite;
			callback:[:result| result inspect]
]

{ #category : #tests }
ASolarTutorial >> test3Z1QuerySorting [

	
	| solr |


	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.

		
	solr 
			core:self defaultCore;
			query:[:query| 
						query 
							q: #id->'book*';
							sort: {#pubyear_i-> 'desc'};
							fl: #(#title_t #pubyear_i)];
			callback:[:result| result inspect].
			
]

{ #category : #tests }
ASolarTutorial >> test3Z2QueryPaging [

	
	| solr |


	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.

		
	solr 
			core:self defaultCore;
			query:[:query| 
						query 
							q: #id->'book*';
							sort: {#pubyear_i-> 'desc'};
							fl: #(#title_t #pubyear_i);
							start:3;
							rows:2];
			callback:[:result| result inspect].
			
]

{ #category : #tests }
ASolarTutorial >> test3Z3QueryCursorPaging [

	
	| solr cursorMark|


	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.

		
	solr 
			core:self defaultCore;
			query:[:query| 
						query 
							q: #id->'book*';
							sort: {#pubyear_i-> #desc.
									#id->#asc};
							fl: #(#title_t #pubyear_i);
							rows:5;
							cursorMark:'*'];
			callback:[:result| result inspect.cursorMark := result nextCursorMark].
			
	solr 
			core:self defaultCore;
			query:[:query| 
						query 
							q: #id->'book*';
							sort: {#pubyear_i-> #desc.
									#id->#asc};
							fl: #(#title_t #pubyear_i);
							rows:5;
							cursorMark:cursorMark];
			callback:[:result| result inspect].
]

{ #category : #tests }
ASolarTutorial >> test4QueryDemo [

	| solr |

	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.
		
	solr 
			core:self defaultCore;
			debug;
			query:[:query| 
						query 
							q: 'title_t'->'black';
							fl: #(#author_s #title_t)];
			callback:[:result| result inspect]
			
]

{ #category : #tests }
ASolarTutorial >> test5ProximityQuery [

	| solr |

	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.
		
	solr 
			core:self defaultCore;
			query:[:query| 
						query 
							q: #title_t-> ('Way Kings'~1);
							fl: #(#author_s #title_t)];
			callback:[:result| result inspect];
			query:[:query| 
						query 
							q: #title_t-> ('Way Kings'~7);
							fl: #(#author_s #title_t)];
			callback:[:result| result inspect]
			
]

{ #category : #tests }
ASolarTutorial >> test6BooleanQuery [

	| solr |

	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.
		
	solr 
			core:self defaultCore;
			query:[:query| 
						query 
							q: #title_t-> {'Way'PLUS. 'added'} ;
							fl: #(#author_s #title_t)];
			callback:[:result| result inspect];
			query:[:query| 
						query 
							q: #title_t-> {'Way'PLUS. 'Kings'PLUS. 'added'MINUS} ;
							fl: #(#author_s #title_t)];
			callback:[:result| result inspect].
			
]

{ #category : #tests }
ASolarTutorial >> test7BoostedQuery [

	| solr |

	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.
	"boost operator ^ is ! in smalltalk"	
	solr 
			core:self defaultCore;
			query:[:query| 
						query 
							q:#title_t->{'Black'!10.
											#OR.
											'Company'!5 } ;
							fl: #(#author_s #title_t)];
			callback:[:result| result inspect].
]

{ #category : #tests }
ASolarTutorial >> test8RangeQuery [

	| solr |

	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.
	"boost operator ^ is ! in smalltalk"	
	solr 
			core:self defaultCore;
			query:[:query| 
						query 
							q:{
								#pubyear_i->('1965'!=1).
								#title_t -> ('Kings'!=1)};
							fl: #(#author_s #title_t #pubyear_i)];
			callback:[:result| result inspect].
]

{ #category : #tests }
ASolarTutorial >> test9FilterQuery [
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.
		
	solr  
		core:self defaultCore;
		query:[ :query|
				query q: #title_t->'*'; 
						fq: #pubyear_i->(1960 TO:1995)];
			callback:[:r| r inspect]
]

{ #category : #tests }
ASolarTutorial >> testA1RTGet [
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.
		
	solr  
		core: self defaultCore;
		realTimeGet: #(#book1 #book2);
		callback:[:r| r inspect]
]

{ #category : #tests }
ASolarTutorial >> testA2JSONFaceting [

	
	| solr |


	solr := ASolarClient host: self defaultHost  port:8983 userName:'admin' password:'admin'.

		
	solr 
			core:self defaultCore;
			query:[:q| q 
				q: ('*'->'*');
				jsonFacet: { #top_authors -> { #terms -> { #field -> #author_s. #limit -> 5 } } }];
			debug;
			callback:[:result| result inspect].
			
]
