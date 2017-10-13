tests
testConfigCore
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host:self defaultHost  port:8983 username:'admin' password:'admin'.
	solr core:'techproducts'.
	
	"'{
    'add-requesthandler' : {
      'name': '/mypath',
      'class':'solr.DumpRequestHandler',
      'defaults':{ 'x':'y' ,'a':'b', indent':true },
      'useParams':'x'
} }'"
	solr 	config: { 
							'add-requesthandler' -> {
      										'name'-> '/mypath'.
      										'class'->'solr.DumpRequestHandler'.
      										'defaults'-> { 'x'->'y'. 'a'->'b'. 'indent'->true } asSCJsonObject.
      										'useParams'->'x'} asSCJsonObject } asSCJsonObject 
			callback:[:r| r inspect].	
