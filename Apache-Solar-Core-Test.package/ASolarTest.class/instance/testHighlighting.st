tests
testHighlighting
	"hl=true&hl.snippets=5&hl.fl=content&hl.usePhraseHighlighter=true&hl.fragsize=300"
	
	|solr|	
	solr := ASolarClient host: '172.16.208.137' port:8983 username:'admin' password:'admin'.
	solr core:'techproducts'.
	solr query:[ :query|
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
			searchAndCallback:[:r| r inspect]