Class {
	#name : #ASGlobalParameter,
	#superclass : #ASParameterCollection,
	#category : 'Apache-Solar-Core-Fields'
}

{ #category : #csv }
ASGlobalParameter >> autoCommit [

	self at:'commit' put: true
]

{ #category : #building }
ASGlobalParameter >> build [
]

{ #category : #csv }
ASGlobalParameter >> commitWithin: timeInMilliseconds [
	self at:'commitWithin' put: timeInMilliseconds
]

{ #category : #csv }
ASGlobalParameter >> debug [

	self at:'debug' put: 'query'
]

{ #category : #'intex-transforming' }
ASGlobalParameter >> df: defaultQueryField [
	 self at:'df' put: defaultQueryField 
]

{ #category : #'intex-transforming' }
ASGlobalParameter >> echo [
	self at:'echo' put: true
]

{ #category : #csv }
ASGlobalParameter >> encapsulator: aChar [

	self at:'encapsulator' put: aChar asString
]

{ #category : #csv }
ASGlobalParameter >> escape: aChar [

	self at:'escape' put: aChar asString
]

{ #category : #query }
ASGlobalParameter >> field: arrayOfFields [
	self at:'field' put: arrayOfFields 
]

{ #category : #csv }
ASGlobalParameter >> fieldNames: listOfFields [
	self at: 'fieldnames' put: listOfFields
]

{ #category : #accessing }
ASGlobalParameter >> header [
	 self at:'header' put: true 
]

{ #category : #csv }
ASGlobalParameter >> header: aBoolean [
	self at: 'header' put: aBoolean
]

{ #category : #query }
ASGlobalParameter >> ids: arrayOfIds [
	self at:'ids' put: arrayOfIds
]

{ #category : #csv }
ASGlobalParameter >> keepEmpty [

	self at:'keepEmpty' put: true
]

{ #category : #query }
ASGlobalParameter >> limit: limit [
	self at:'limit' put: limit
]

{ #category : #accessing }
ASGlobalParameter >> literal: aValue [
	self at:'literal.' , self fieldName put:aValue
]

{ #category : #query }
ASGlobalParameter >> map: aString [
	"Map one value to another. Format is value:replacement (which can be empty.)
	g,f  map=left:right   f.subject.map=histor y:bunk"
	self at:'map' put: aString
]

{ #category : #'intex-transforming' }
ASGlobalParameter >> mapUniqueKeyOnly [
		self at: 'mapUniqueKeyOnly' put:true
]

{ #category : #query }
ASGlobalParameter >> offset: offset [
	self at:'offset' put: offset
]

{ #category : #csv }
ASGlobalParameter >> overwrite [
	self at:'overwrite' put:true
]

{ #category : #csv }
ASGlobalParameter >> rowid: fieldName [
	self at:'rowid' put: fieldName
]

{ #category : #csv }
ASGlobalParameter >> rowidOffset: anInteger [
	self at:'rowidOffset' put: anInteger
]

{ #category : #accessing }
ASGlobalParameter >> separator: aString [
	 self at:'separator' put: aString 
]

{ #category : #csv }
ASGlobalParameter >> skip: anArrayOfFields [

	self at:'skip' put: anArrayOfFields asCommaString
]

{ #category : #csv }
ASGlobalParameter >> skipLines: anInteger [

	self at:'skipLines' put: anInteger
]

{ #category : #query }
ASGlobalParameter >> sort: sortOptions [
	self at:'sort' put: sortOptions
]

{ #category : #'intex-transforming' }
ASGlobalParameter >> sourceField: sourceField [
	 self at:'srcField' put: sourceField 
]

{ #category : #'intex-transforming' }
ASGlobalParameter >> split: path [
	"split=/|/foo|/foo/bar "
	self at:'split' put: path
]

{ #category : #query }
ASGlobalParameter >> tagField [
	^''
]

{ #category : #growing }
ASGlobalParameter >> trim [
	 self at:'trim' put: true 
]
