private factory
dismaxQuery
	
	^ query ifNil:[ query := ASDismaxQuery new ]