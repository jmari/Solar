Class {
	#name : #ASVoyageDomainObject,
	#superclass : #Object,
	#instVars : [
		'firstName',
		'address'
	],
	#category : 'Apache-Solar-Voyage-Tests'
}

{ #category : #'as yet unclassified' }
ASVoyageDomainObject class >> isVoyageRoot [ 
	^ true
]

{ #category : #accessing }
ASVoyageDomainObject >> address [
	^ address
]

{ #category : #accessing }
ASVoyageDomainObject >> address: anObject [
	address := anObject
]

{ #category : #accessing }
ASVoyageDomainObject >> firstName [
	^ firstName
]

{ #category : #accessing }
ASVoyageDomainObject >> firstName: anObject [
	firstName := anObject
]
