http
basicAuth: username password: password
	self httpClient 
		username: username password: password;
		headerAt: 'accept' put: 'application/json; charset=utf-8';
		host:self host;
		port: self port