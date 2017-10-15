baseline
baseline: spec
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
