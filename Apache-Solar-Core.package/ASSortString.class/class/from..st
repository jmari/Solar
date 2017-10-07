instance creation
from: sortOptions
	|sp| 
	^	(
		((sortOptions isKindOf: Collection ) and:[(sortOptions isKindOf: String ) not] )
			ifTrue:[
				sp := sortOptions collect:[ :each| 
					(each isKindOf: Association)
						ifTrue:[each key , ' ' , each value]
						ifFalse:[ each ]].
				sp asCommaString ] 
			ifFalse:[ sortOptions asString])