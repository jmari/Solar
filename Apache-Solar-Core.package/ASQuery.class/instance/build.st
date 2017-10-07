building
build
	self  hasGroup ifTrue:[ self addAll: self group].
	self  hasFacet  ifTrue:[ self addAll: self facet build].
	self  hasHl ifTrue:[ self addAll: self hl].
	self  hasMlt ifTrue:[ self addAll: self moreLikeThis ].
	