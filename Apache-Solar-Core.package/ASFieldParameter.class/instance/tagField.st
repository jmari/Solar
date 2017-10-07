query
tagField
	self fieldName ifNil:[self error:'You should specify a field name before'].
	^ 'f.' , self fieldName ,'.'