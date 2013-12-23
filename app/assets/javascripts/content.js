$(function(){
	$(window).resize(function() {
		if ($("#sidebar").css("display") == "none") {
			$("#content_div").removeClass("show_navbar");
		}
		else {
			$("#content_div").addClass("show_navbar");
		}
	});
	$(window).bind('load',function(){
		if ($("#sidebar").css("display") == "none") {
			$("#content_div").removeClass("show_navbar");
		}
		else {
			$("#content_div").addClass("show_navbar");
		}
	});
	$("#collapse_btn").on("click", function() {
		if ($("#sidebar").hasClass("in")) {
			$("#content_div").removeClass("show_navbar");
		}
		else {
			$("#content_div").addClass("show_navbar");
		}
	});
});