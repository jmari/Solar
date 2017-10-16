instance creation
new 
	| a |
	a := super new.
	a initialize: a size.
	^ a