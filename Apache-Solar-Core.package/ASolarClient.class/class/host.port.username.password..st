connection open/close
host: host port:port userName: username password: password
	| client |

	client := self basicNew.
	client host: host.
	client port: port.
	client basicAuth: username password: password.
	
	^ client