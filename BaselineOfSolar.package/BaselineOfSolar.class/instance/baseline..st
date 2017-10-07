baseline
baseline: spec
	<baseline>
	spec for: #common do: [ 
		self json: spec.
		spec
			package: 'Apache-Solar-Core';
			package: 'Apache-Solar-Core-Test' with: [ spec requires: #('Apache-Solar-Core' ) ].
		self groups: spec
	]
