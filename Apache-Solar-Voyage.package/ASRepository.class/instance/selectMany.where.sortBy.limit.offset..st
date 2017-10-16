persistence
selectMany: aClass where: queryOptions sortBy: sortOptions limit: limit offset: offset
	^ self solarClient 
				core:self collection;
				query:[:query|
							query 
								q: '#instanceOf'-> aClass name.
								queryOptions ifNotNil:[query q:queryOptions].
								sortOptions ifNotNil:[query sort: sortOptions].
								limit ifNotNil:[query rows: limit].
								offset ifNotNil:[query start: offset]];
			callback:[:r| r ].	
				
			