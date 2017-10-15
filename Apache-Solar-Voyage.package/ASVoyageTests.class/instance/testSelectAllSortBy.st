tests
testSelectAllSortBy
	
	| repo doc objects objects2  |
	
	repo := ASRepository userName:'admin' password:'admin'.

	doc := ASVoyageDomainObject new. 

	1 to:20 do:[: i |
				repo save: ( doc firstName:i ;copy )].
			
	"ordered by the server"
	objects :=repo selectAll: ASVoyageDomainObject sortBy:{#firstName}.
	objects explore.
	"ordered by the pharo"
	objects2 :=repo selectAll: ASVoyageDomainObject sortBy:[:a :b | a firstName > b firstName].
	objects2 explore.



	
