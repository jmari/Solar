accessing
uuidProvider
	^ uuidProvider ifNil:[ uuidProvider := SCSmalltalkUUIDProvider new]