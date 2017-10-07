as yet unclassified
fragmenter: aString
	"Specifies a text snippet generator for highlighted text. The standard fragmenter is gap, which creates fixed-sized fragments with gaps for multi-valued fields. Another option is regex, which tries to create fragments that resemble a specified regular expression."
	self at:'fragmenter' put: aString