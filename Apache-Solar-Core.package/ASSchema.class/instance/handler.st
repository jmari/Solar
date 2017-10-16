accessing
handler
	^ handler ifNil:[handler:=OrderedCollection new add:'schema';yourself ]