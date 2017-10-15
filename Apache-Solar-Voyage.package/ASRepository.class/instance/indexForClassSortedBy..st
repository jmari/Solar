private
indexForClassSortedBy: arrayInSortSyntax
	| oc |
	oc := Array with:'#instanceOf'withAll: arrayInSortSyntax.
		
	^ self sortingIndexes 
			at: oc asString 
			ifAbsentPut:[ self collection index 
													name: oc asString;
													fields:  oc;
													new]