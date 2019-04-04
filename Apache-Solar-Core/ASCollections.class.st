Class {
	#name : #ASCollections,
	#superclass : #ASCores,
	#category : 'Apache-Solar-Core-Others'
}

{ #category : #'as yet unclassified' }
ASCollections >> async: aString [ 
	self at: 'async' put: aString

]

{ #category : #'as yet unclassified' }
ASCollections >> configName: aString [
	self at:'collection.ConfigName' put: aString
]

{ #category : #accessing }
ASCollections >> createNodeSet: aString [
	self at:#createNodeSet put: aString
]

{ #category : #accessing }
ASCollections >> createNodeSetShuffleOff [
	self at:'createNodeSet.shuffle' put: false
]

{ #category : #accessing }
ASCollections >> createNodeSetShuffleOn [
	self at:'createNodeSet.shuffle' put: true
]

{ #category : #accessing }
ASCollections >> handler [
	^ #('admin' 'collections')
]

{ #category : #accessing }
ASCollections >> maxShardsPerNode: anInteger [
	self at:#maxShardsPerNode put: anInteger
]

{ #category : #'as yet unclassified' }
ASCollections >> numShards: anInteger [
	self at:#numShards put: anInteger
]

{ #category : #accessing }
ASCollections >> propertyAt: aString put: aValue [ 
	self at: 'property', aString put: aValue

]

{ #category : #'as yet unclassified' }
ASCollections >> replicationFactor: anInteger [
	self at:#replicationFactor put: anInteger
]

{ #category : #'as yet unclassified' }
ASCollections >> routerField: aString [
	self at: 'router.Field' put: aString

]

{ #category : #'as yet unclassified' }
ASCollections >> routerName: aString [
	self at: 'router.name' put: aString

]

{ #category : #accessing }
ASCollections >> rule: aString [ 
	self at: 'rule' put: aString

]

{ #category : #'as yet unclassified' }
ASCollections >> shards: aString [
	self at:#shards put: aString
]

{ #category : #'as yet unclassified' }
ASCollections >> snitch: aString [ 
	self at: 'snitch' put: aString

]
