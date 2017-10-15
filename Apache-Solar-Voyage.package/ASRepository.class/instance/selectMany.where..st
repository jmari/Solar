persistence
selectMany: aClass where: queryOptions
	^ self selectMany: aClass where: queryOptions sortBy: nil limit: self maxObjectsInMem offset: nil