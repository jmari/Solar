building
build
	self hasQuery ifTrue:[self httpClient queryAddWithDuplicatesAll:  self query build].
	self hasGlobalParameters ifTrue:[ self httpClient queryAddWithDuplicatesAll: self  g build].
	self hasFieldParameters ifTrue:[ self httpClient queryAddWithDuplicatesAll: self  f build  ].
	self hasSpellchecker ifTrue:[self httpClient queryAddWithDuplicatesAll:  self spellchecker build].
	self hasCoresOrCollections ifTrue:[self httpClient queryAddWithDuplicatesAll:  self cores ].
	self hasSuggester ifTrue:[self httpClient queryAddWithDuplicatesAll:  self suggester ].
	self hasTerms ifTrue:[self httpClient queryAddWithDuplicatesAll:  self terms ].
	self hasSchema ifTrue:[self httpClient queryAddWithDuplicatesAll:  self schema ].