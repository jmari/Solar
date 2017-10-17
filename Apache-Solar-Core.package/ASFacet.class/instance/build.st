building
build
	self hasRange ifTrue:[ self addAll: self range].
	self hasPivot ifTrue:[ self addAll: self pivot].
	self hasInterval ifTrue:[ self addAll: interval].
	self hasOverRequest ifTrue:[ self addAll: self overRequest]