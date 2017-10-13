client-api
commit
	"ask for commit changes"
	self httpClient queryAt:'commit' put:true.
	self update: {}  callback:[ :r|  ] 