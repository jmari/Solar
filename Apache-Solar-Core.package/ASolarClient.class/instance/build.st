building
build
	self hasQuery ifTrue:[self httpClient queryAddWithDuplicatesAll:  self query build].
	self hasGlobalParameters ifTrue:[ self httpClient queryAddWithDuplicatesAll: self  g build].
	self hasFieldParameters ifTrue:[ self httpClient queryAddWithDuplicatesAll: self  f build  ].
	self hasSpell ifTrue:[self httpClient queryAddWithDuplicatesAll:  self spell build].