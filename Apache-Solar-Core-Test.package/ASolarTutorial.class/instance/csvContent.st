adding
csvContent
	| rwStream |
	rwStream := ReadWriteStream on:''.
	rwStream 
	nextPutAll:'id,cat_s,pubyear_i,title_t,author_s,series_s,sequence_i,publisher_s';crlf;
	nextPutAll:'book1,fantasy,2010,The Way of Kings,Brandon Sanderson,The Stormlight Archive,1,Tor';crlf;
	nextPutAll:'book2,fantasy,2010,The Way intentionally added to separate these words of Kings,Brandon Sanderson,The Stormlight Archive,1,Tor';crlf;
	nextPutAll:'book3,fantasy,1996,A Game of Thrones,George R.R. Martin,A Song of Ice and Fire,1,Bantam';crlf;
	nextPutAll:'book4,fantasy,1999,A Clash of Kings,George R.R. Martin,A Song of Ice and Fire,2,Bantam';crlf;
	nextPutAll:'book5,fantasy,1985,The Black Company,Glen Cook,The Black Company,1,Tor';crlf;
	nextPutAll:'book6,fantasy,1965,The Black Cauldron,Lloyd Alexander,The Chronicles of Prydain,2,Square Fish'.
	^ rwStream

