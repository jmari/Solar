as yet unclassified
host: aHost port: aPort userName:aUserName password:aPassword
	| repo |
	repo := self new.
	repo solarClient: (ASolarClient  host: aHost port: aPort userName:aUserName password:aPassword).
	^ repo