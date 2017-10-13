# Solar
an Apache Solr client API for Smalltalk. This work is in progress but you can perform queries, faceting, highlighting and spellchecking queries, admin cores and collections.

### install Solar
```Smalltalk
Metacello new 
	baseline: 'Solar';
	repository: 'github://jmari/Solar';
	load:'all'
```

Some examples:

### Solar query example
```Smalltalk
	|solr|	
	solr := ASolarClient host: '172.16.208.136' port:8983 username:'admin' password:'admin'.
	solr core:'techproducts'.
	
	solr edismaxQuery:[:query|
				query 
					q: { 
							{ 	#complexphrase.
							 	#inOrder->true}.
							#name -> '"(john jon jonathan~) peters*"'.
					 	} ]
			callback:[:r| r inspect].
    
```
### Solar faceting query
```Smalltalk
	|solr|	
	solr := ASolarClient host: '172.16.208.136' port:8983 username:'admin' password:'admin'.
	solr core:'techproducts'.
	
	solr dismaxQuery:[:query|
			query
				q:'*'; 
				facet:[:f|
					f  field:'manu';
		 				query: #price->('*' TO:100);
						query: #price->(100 TO:200);
						query: #price->(200 TO:300);
						query: #price->(300 TO:400);
						query: #price->(400 TO:500);
						query: #price->(500 TO:'*')]]
			callback:[:r| r inspect].	
    
```
More examples in the test package
