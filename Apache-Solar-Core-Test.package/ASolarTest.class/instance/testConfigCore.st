tests
testConfigCore
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
