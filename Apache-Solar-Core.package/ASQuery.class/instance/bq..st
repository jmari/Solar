accessing
bq:  anObject
		 self at:'bq'  put: ((anObject isKindOf: String )ifTrue:[anObject] ifFalse:[anObject asSCJsonObject])