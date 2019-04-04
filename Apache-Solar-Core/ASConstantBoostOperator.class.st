Class {
	#name : #ASConstantBoostOperator,
	#superclass : #String,
	#category : 'Apache-Solar-Core-SpecialTypes'
}

{ #category : #'as yet unclassified' }
ASConstantBoostOperator class >> new: anInteger [
	^ self fromString: '^=' , anInteger asString
]
