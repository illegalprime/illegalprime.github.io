// Place for Javascript that will be put on the <head>
// of every document.
/*
function highlight(x) {
	x.innerHTML = "Hello!";
}

function normal(x) {
	x.innerHTML = "OK";
}*/

var toggled = false;

$(document).ready(function() {
	$("#menu_btn").click(function() {
		if (toggled) {
			$("#following_menu_container").css("display", "none");
			$("#following_social_container").css("display", "none");
			$("#following_menu").toggleClass("collapsed", true);
		}
		else {
			$("#following_menu_container").css("display", "inherit");
			$("#following_social_container").css("display", "inherit");
			$("#following_menu").toggleClass("collapsed", false);
		}
		toggled = !toggled;
		// console.log("Clicked");
	});
});
