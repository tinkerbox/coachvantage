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
	$("#user_avatar").on("change", function() {
		if (this.files && this.files[0]) {
			var reader = new FileReader();
		
			reader.onload = function (e) {
				$('#avartar')
					.prop('src', e.target.result);
			};
		
			reader.readAsDataURL(this.files[0]);
//			$("#photo_form").submit();
		}
	});
});