query
map: aString
	"Map one value to another. Format is value:replacement (which can be empty.)
	g,f  map=left:right   f.subject.map=histor y:bunk"
	self at:'map' put: aString