$(function(){
	$("select").fancyfields({
  	onSelectChange: function (input, text, val){
  		if (input.attr("id") == "user_setting_attributes_color_scheme") {
      	$("body").attr("class", "").addClass(val);
  		}
    }
	});
})

$(document).ready(function() {
	$("#avatar_img").on('click', function() {
		$("#user_avatar").click();
	});
	
	$("#user_avatar").on("change", function(input) {
		evt = input.target;
		if (evt.files && evt.files[0]) {
			var reader = new FileReader();

			reader.onload = function (e) {
				$('#avatar_img')
					.attr('src', e.target.result)
					.width(auto).height(100);
			};

			reader.readAsDataURL(evt.files[0]);
		}
	});
});