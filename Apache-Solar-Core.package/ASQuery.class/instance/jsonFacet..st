accessing
jsonFacet: jsonFacetCollection
	"facet passes has a JSON object (smalltalk format)"
	|  jsonString |
	jsonString := self serializer serialize: jsonFacetCollection asSCJsonObject.
	self at:'json.facet' put:jsonString