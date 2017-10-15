tests
testSpellchecking
	"an ASolarClient"
	|solr|	
	solr := ASolarClient host: self defaultHost port:8983 userName:'admin' password:'admin'.
	
	"http://localhost:8983/solr/techproducts/spell?df=text&spellcheck.q=delll+ultra+sharp&spellch
eck=true&spellcheck.collateParam.q.op=AND"
	solr  
		core:'techproducts';
		spellcheck: [:spell|
				spell 
					df: 'text';
					q:'delll+ultra+sharp';
					collateParam:[:query| query qOp:'AND' ]] 
			callback:[:r| r inspect].
		