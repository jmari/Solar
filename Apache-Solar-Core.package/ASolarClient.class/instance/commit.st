client-api
commit
	"ask for commit changes"
	self autoCommit.
	self update: {}  callback:[ :r|  ] 