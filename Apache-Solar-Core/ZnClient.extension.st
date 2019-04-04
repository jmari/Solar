Extension { #name : #ZnClient }

{ #category : #'*Apache-Solar-Core' }
ZnClient >> queryAddWithDuplicatesAll: keyedCollection [
	"Add all key -> value elements of keyedCollection 
	as an HTTP query parameters to the current request."

	keyedCollection keysAndValuesDo: [ :key :value |
		self queryAt: key add: value ]
]
