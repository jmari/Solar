persistence
selectMany: aClass where: queryOptions sortBy: sortOptions limit: limit
	^ self selectMany: aClass where: queryOptions sortBy: sortOptions limit: limit offset: nil