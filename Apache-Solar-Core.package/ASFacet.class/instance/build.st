building
build
	self hasRange ifTrue:[ self addAll: range].
	self hasPivot ifTrue:[ self addAll: pivot].
	self hasInterval ifTrue:[ self addAll: interval]