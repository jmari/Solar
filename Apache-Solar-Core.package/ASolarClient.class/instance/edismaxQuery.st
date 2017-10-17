private factory
edismaxQuery
	
	^ query ifNil:[ query := ASEDismaxQuery new ]