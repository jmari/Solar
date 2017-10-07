as yet unclassified
ps3:  aQuery
	"String format 'fieldOne^2.3 fieldTwo fieldThree^0.4'
	 or an array of associations {fieldOne->2.3. fieldTwo->1.0. fieldThree->0.4}"
	 self at:'qs3'  put:  (ASQueryString from: aQuery)