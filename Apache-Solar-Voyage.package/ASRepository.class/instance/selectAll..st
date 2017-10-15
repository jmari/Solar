persistence
selectAll: aClass
	^ self selectMany: aClass where: nil sortBy: nil limit: self maxObjectsInMem offset: nil

						  