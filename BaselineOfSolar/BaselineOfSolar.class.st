Class {
	#name : #BaselineOfSolar,
	#superclass : #BaselineOf,
	#category : 'BaselineOfSolar'
}

{ #category : #baseline }
BaselineOfSolar >> baseline: spec [
	<baseline>
	spec for: #common do: [ 
		self json.
		self voyage: spec.
		spec
			package: 'Apache-Solar-Core';
			package: 'Apache-Solar-Voyage' with: [ spec requires: #('Apache-Solar-Core' 'Voyage-Model-Core') ];
			package: 'Apache-Solar-Core-Test' with: [ spec requires: #('Apache-Solar-Core' ) ].
		self groups: spec
	]

]

{ #category : #protocol }
BaselineOfSolar >> groups: spec [
	spec 
		group: 'default' with: #('Apache-Solar-Core');
		group: 'all' with: #(default 'Apache-Solar-Core-Test');
		group: 'voyage' with: #(default 'Apache-Solar-Voyage')

]

{ #category : #script }
BaselineOfSolar >> json [
	Metacello new 
		baseline: 'SCouchDB';
		repository: 'github://jmari/SCouchDB/repository';
		load:'json'
]

{ #category : #script }
BaselineOfSolar >> json: spec [
	spec 
		baseline: 'SCouchDB' with: [ spec repository: 'https://github.com/jmari/SCouchDB/repository' ];
		load: 'json'
]

{ #category : #script }
BaselineOfSolar >> voyage: spec [
	spec 
		baseline: 'Voyage' with: [ spec repository: 'github://pharo-nosql/voyage/mc' ];
		import: 'Voyage'
]
