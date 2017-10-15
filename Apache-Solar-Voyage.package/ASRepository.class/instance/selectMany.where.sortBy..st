persistence
selectMany: aClass where: queryOptions sortBy: sortOptions
	^ self selectMany: aClass where: queryOptions sortBy: sortOptions limit: self maxObjectsInMem offset: nil