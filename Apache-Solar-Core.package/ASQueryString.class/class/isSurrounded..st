private
isSurrounded: anObject
	^ (anObject size>1 and:[
			anObject first=$" 
			or:[ anObject first=$[
			or:[ anObject first=${
					]]])