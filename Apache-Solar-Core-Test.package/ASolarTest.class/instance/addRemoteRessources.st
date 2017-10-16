adding
addRemoteRessources
	
	| solr  ressource|
	
	"ressource := FileLocator imageDirectory / 'Contents' / 'info.plist'."
	ressource := 'https://www.sample-videos.com/csv/Sample-Spreadsheet-10-rows.csv' asZnUrl.
	solr := ASolarClient host: '172.16.208.134' port:8983 userName:'admin' password:'admin'.
	
	solr 
		core:'techproducts';
		autoCommit;
		addRemoteRessource: ressource format:'csv';
		callback:[:result| result inspect]