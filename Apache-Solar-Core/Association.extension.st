Extension { #name : #Association }

{ #category : #'*Apache-Solar-Core' }
Association >> NOT [
	^ '-',(ASQueryString  from:self) 
]
