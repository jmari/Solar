persistence
selectOne: aClass where: queryOptions	
	^ self selectMany: aClass where: queryOptions sortBy: nil limit: 1 offset: nil
