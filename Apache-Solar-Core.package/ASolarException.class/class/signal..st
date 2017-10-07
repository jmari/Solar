signalling
signal: aJsonSolrError
	|inst|
	inst := self new.
	inst messageText: ((aJsonSolrError at:'error') at:'msg').
	inst solrError:aJsonSolrError.
	inst signal