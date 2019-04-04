Class {
	#name : #ASBoostOperator,
	#superclass : #String,
	#category : 'Apache-Solar-Core-SpecialTypes'
}

{ #category : #'instance creation' }
ASBoostOperator class >> new: anInteger [
	^ self fromString: '^' , anInteger asString
]
