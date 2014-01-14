$(document).ready(function() {
	$("#contact_img").on('click', function() {
		$("#contact_avatar").click();
	});

	$("#contact_avatar").on('change', function(input) {
		evt = input.target;
		if (evt.files && evt.files[0]) {
			var reader = new FileReader();

			reader.onload = function (e) {
				$('#contact_img')
					.attr('src', e.target.result);
			};

			reader.readAsDataURL(evt.files[0]);
		}
	});

	$("#notes_list li a").click(function() {
		$("#notes_list li a").removeClass("active");
		$(this).addClass("active");
	});

	$("#notes_list li a").on("ajax:success", function(e, data, status, xhr) {
		$("#note_caption").val(data.caption);
		$("#note_content").val(data.content);
	});

	$("#add_new_contact_note").on("ajax:success", function(e, data, status, xhr) {
		$("#note_caption").val(data.caption);
		$("#note_content").val(data.content);
		$("#new_note_caption").css("display", "inline-block");
		$("#note_caption").focus();
	});
});