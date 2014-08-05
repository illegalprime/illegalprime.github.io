var article  = document.getElementById("article");
var chapters = article.getElementsByTagName("h1");

var contents = document.createElement("table");
contents.innerHTML = "<th>Table of Contents</th>";

for (var i = 0, len = chapters.length; i < len; i++) {
	var ID = "Chapter_" + i;
	chapters[i].id = ID;
	contents.innerHTML += "<tr><td><a class='scroll' data-speed='1000' href='#" + ID + "'>" + chapters[i].innerHTML + "</a></td></tr>";
}

article.insertBefore(contents, chapters[0]);