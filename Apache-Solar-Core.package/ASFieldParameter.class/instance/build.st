building
build
	self hasFacet ifTrue: [  self addAll: self facet build].
	self hasHl ifTrue: [  self addAll: self hl ]