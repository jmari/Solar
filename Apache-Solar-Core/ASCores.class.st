Class {
	#name : #ASCores,
	#superclass : #ASParameterCollection,
	#category : 'Apache-Solar-Core-Others'
}

{ #category : #api }
ASCores >> config: fileName [
	self at:'config' put: fileName
]

{ #category : #api }
ASCores >> configSet: aString [
	self at:'configSet' put: aString
]

{ #category : #accessing }
ASCores >> core: aString [
	self at:'core' put: aString
]

{ #category : #operations }
ASCores >> create [
	self at:'action' put: 'CREATE'
]

{ #category : #'as yet unclassified' }
ASCores >> dataDir: aPath [
	self at:'dataDir' put: aPath fullPath  asString
]

{ #category : #accessing }
ASCores >> handler [
	^ #('admin' 'cores')
]

{ #category : #accessing }
ASCores >> indexDir: aPath [
	self at:'indexDir' put: aPath fullPath  asString
]

{ #category : #'as yet unclassified' }
ASCores >> instanceDir: aPath [
	self at:'instanceDir' put: aPath fullPath  asString
]

{ #category : #'as yet unclassified' }
ASCores >> loadOnStartupOff [
	self at:'loadOnStartup' put: false
]

{ #category : #accessing }
ASCores >> mergeIndex [
	self at:'action' put: 'mergeIndex'
]

{ #category : #accessing }
ASCores >> name: aString [
	self at:'name' put: aString
]

{ #category : #accessing }
ASCores >> path: aPath [ 

	self at:'path' put:aPath.

]

{ #category : #operations }
ASCores >> reload [
	self at:'action' put: 'RELOAD'
]

{ #category : #operations }
ASCores >> reload: aCore [
	self coreName: aCore.
	self reload
]

{ #category : #operations }
ASCores >> renameCore: aCore to:otherCore [
	self at:'action' put: 'RENAME'.
	self coreName:aCore.
	self at:'otherCore' put:otherCore
]

{ #category : #operations }
ASCores >> requestStatus [
	self at:'action' put: 'REQUESTRECOVERY'
]

{ #category : #operations }
ASCores >> requestStatus: aCore [
	self core: aCore.
	self at:'action' put: 'REQUESTRECOVERY'
]

{ #category : #api }
ASCores >> schema: fileName [
	self at:'schema' put: fileName
]

{ #category : #accessing }
ASCores >> split [
	self at:'action' put:'SPLIT'.

]

{ #category : #accessing }
ASCores >> split: aCore [ 
	self at:'action' put:'SPLIT'.
	self coreName:aCore.

]

{ #category : #accessing }
ASCores >> split: aCore  path: aPath targetCore: targetCore [
	self at:'action' put:'SPLIT'.
	self coreName:aCore.
	self at:'path' put:aPath.
	self at:'targetCore' put: targetCore 
]

{ #category : #accessing }
ASCores >> status [
	self at:'action' put: 'STATUS'
]

{ #category : #accessing }
ASCores >> status: aCore [
	self coreName:aCore.
	self status
]

{ #category : #operations }
ASCores >> swapCore: aCore with:otherCore [
	self at:'action' put: 'SWAP'.
	self coreName:aCore.
	self at:'otherCore' put:otherCore
]

{ #category : #'as yet unclassified' }
ASCores >> tagField [
	^ self root , ''
]

{ #category : #accessing }
ASCores >> targetCore: targetCore [
	self at:'targetCore' put: targetCore 
]

{ #category : #'as yet unclassified' }
ASCores >> transient [
	self at:'transient' put: true
]

{ #category : #operations }
ASCores >> unload: aCore [
	self at:'action' put: 'UNLOAD'.
	self coreName:aCore.
]

{ #category : #operations }
ASCores >> unloadAndDeleteIndex: aCore [ 
	self unload:aCore.
	self at:'deleteIndex' put: true
	
]
