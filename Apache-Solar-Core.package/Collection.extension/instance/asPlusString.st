*Apache-Solar-Core
asPlusString
	"Return collection printed as 'a, b and c' "

	^String streamContents: [:s | self asStringOn: s delimiter: ' + ']
		