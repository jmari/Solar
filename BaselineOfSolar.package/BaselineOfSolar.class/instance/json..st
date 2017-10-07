script
json: spec
	spec 
		baseline: 'json' with: [ spec repository: 'https://github.com/jmari/SCouchDB' ];
		import: 'json'