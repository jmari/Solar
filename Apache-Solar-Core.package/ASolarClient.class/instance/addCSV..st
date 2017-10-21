adding
addCSV: stream
	"stream is a csv rows stream"
	| type length entity |

	type := ZnMimeType main:'text' sub:'csv' .
	stream binary.
	length := stream size.	
	entity := (ZnStringEntity text: stream contents) contentType: type.

	httpMethod := #POST.
	httpHandler := self updateCSVHandler.	
	httpEntity := entity.