Class {
	#name : #ASVoyageDomainObject2,
	#superclass : #Object,
	#instVars : [
		'firstName',
		'address'
	],
	#category : 'Apache-Solar-Voyage-Tests'
}

{ #category : #'as yet unclassified' }
ASVoyageDomainObject2 class >> isVoyageRoot [ 
	^ true
]

{ #category : #accessing }
ASVoyageDomainObject2 >> address [
	^ address
]

{ #category : #accessing }
ASVoyageDomainObject2 >> address: anObject [
	address := anObject
]

{ #category : #accessing }
ASVoyageDomainObject2 >> firstName [
	^ firstName
]

{ #category : #accessing }
ASVoyageDomainObject2 >> firstName: anObject [
	firstName := anObject
]
