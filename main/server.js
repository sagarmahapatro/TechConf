var connect = require('connect'),
serveStatic = require('serve-static');

var app = connect();

app.use(serveStatic("broweser-rich-app"));

app.listen(5000);