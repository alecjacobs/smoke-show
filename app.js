$ = require("jquery");
fs = require("fs");

var data = fs.readFile('bookmarks.html', 'utf8', function (err, data) {
  if (err) throw err;
  return data;
});

debugger

var count = $(data).find("DT").length;

console.log(count);