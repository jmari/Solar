factory
group
	 ^ group ifNil: [
				self at:'group' put:true.
				group := ASGroup new] 