as yet unclassified
queryTest
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host: '172.16.208.136' port:8983 username:'admin' password:'admin'.
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