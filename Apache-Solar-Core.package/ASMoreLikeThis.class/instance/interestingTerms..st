accessing
interestingTerms:  aString
	"Controls how the MoreLikeThis component presents the interesting terms (the top TF/IDF terms) for the query. Supports three settings. The setting list lists the terms. The setting none lists no terms. The setting details lists the terms along with the boost value used for each term. Unless mlt.boost=true, all terms will have boost=1.0."
	 self at:'interestingTerms' put: aString