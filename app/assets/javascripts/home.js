$(function(){
	$("select").fancyfields({
  	onSelectChange: function (input, text, val){
  		if (input.attr("id") == "user_setting_attributes_color_scheme") {
      	$("body").attr("class", "").addClass(val);
  		}
    }
	});
})