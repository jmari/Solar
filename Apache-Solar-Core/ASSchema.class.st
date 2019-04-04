Class {
	#name : #ASSchema,
	#superclass : #ASParameterCollection,
	#instVars : [
		'path',
		'handler'
	],
	#category : 'Apache-Solar-Core-Schemes'
}

{ #category : #accessing }
ASSchema >> copyFields [
	self handler add:'copyfields'
]

{ #category : #accessing }
ASSchema >> current [
	self resetHandler 
]

{ #category : #accessing }
ASSchema >> defaultOperatorForQueryParser [
	self handler addAll: #('solrqueryparser' 'defaultoperator')

]

{ #category : #accessing }
ASSchema >> destinationField: aField [
	self at:'dest.fl' put: aField
]

{ #category : #accessing }
ASSchema >> dynamicField: aField [
	self dynamicFields.
	self handler add:aField
	
]

{ #category : #accessing }
ASSchema >> dynamicFields [
	self handler add:'dynamicfields'
]

{ #category : #accessing }
ASSchema >> field: aField [
	self fields.
	self handler add:aField
	
]

{ #category : #accessing }
ASSchema >> fieldType:aName [
	self fieldTypes.
	self handler add:aName
]

{ #category : #accessing }
ASSchema >> fieldTypes [
	self handler add:'fieldtypes'
]

{ #category : #accessing }
ASSchema >> fields [
	self handler add:'fields'
]

{ #category : #accessing }
ASSchema >> fl:  collectionOfield [
	
	 self at:'fl' put: collectionOfield asCommaString 
]

{ #category : #accessing }
ASSchema >> handler [
	^ handler ifNil:[handler:=OrderedCollection new add:'schema';yourself ]
]

{ #category : #'as yet unclassified' }
ASSchema >> includeDynamic [

	self at:'includeDynamic' put: true
]

{ #category : #accessing }
ASSchema >> name [
	self handler add: 'name'
]

{ #category : #accessing }
ASSchema >> resetHandler [
	^ handler:=OrderedCollection new add:'schema';yourself
]

{ #category : #accessing }
ASSchema >> schemaVersion [

	self handler add:'version'

]

{ #category : #'as yet unclassified' }
ASSchema >> showDefaults [

	self at:'showDefaults' put: true
]

{ #category : #accessing }
ASSchema >> similarity [
	self handler add: 'similarity'

]

{ #category : #accessing }
ASSchema >> sourceField: aField [
	self at:'source.fl' put: aField
]

{ #category : #'as yet unclassified' }
ASSchema >> tagField [
	^ self root , ''
]

{ #category : #accessing }
ASSchema >> uniqueKey [
	self handler add:'uniquekey'
]

{ #category : #accessing }
ASSchema >> version [
	self handler add:'version'
]
