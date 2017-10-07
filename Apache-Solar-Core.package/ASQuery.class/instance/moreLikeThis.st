factory
moreLikeThis
	 ^ mlt ifNil:[
				self at:'mlt' put:true.
				mlt := ASMoreLikeThis new] 