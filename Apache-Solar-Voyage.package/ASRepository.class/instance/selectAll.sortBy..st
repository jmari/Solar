persistence
selectAll: aClass sortBy: sortOptions
	^ self selectMany: aClass where: nil sortBy: sortOptions limit: self maxObjectsInMem offset: nil