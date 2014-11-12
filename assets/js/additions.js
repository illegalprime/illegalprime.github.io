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
var menu;
var social;
var container;

$(document).ready(function() {
	menu = $("#following_menu_container");
	social = $("#following_social_container");
	container = $("#following_menu");

	$("#menu_btn").click(function() {
		if (container.queue("fx").length == 0) {
			if (toggled) {
				menu.fadeOut(150);
				social.fadeOut(150);
				container.animate({
						width: 60,
						height: 60
					}, 200);
			}
			else {
				container.animate({
					width: "100%",
					height: "325"
				}, 200, function() {
					menu.fadeIn(150);
					social.fadeIn(150);
				});
			}
			toggled = !toggled;
		}
	});
});
