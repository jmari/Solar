building
build
	self hasFacet ifTrue: [  self addAll: self facet build]