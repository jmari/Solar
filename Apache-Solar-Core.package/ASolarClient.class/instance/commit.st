client-api
commit
	"ask for commit changes"
	self autoCommit.
	self update: {}.
	self callback:[ :r|  ] 