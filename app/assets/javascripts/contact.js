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

	$("#contact_info_img").on('click', function() {
		$("#contact_info_avatar").click();
	});

	$("#contact_info_avatar").on('change', function(input) {
		evt = input.target;
		if (evt.files && evt.files[0]) {
			var reader = new FileReader();

			reader.onload = function (e) {
				$('#contact_info_img')
					.attr('src', e.target.result);
			};

			reader.readAsDataURL(evt.files[0]);
		}
		$("#contact_avatar_form").submit();
	});

	$("#notes_list").on('click', '.new_note_a_class', function() {
		$("#notes_list li a").removeClass("active");
		$(this).addClass("active");

		var item_action_path = $(this).attr("href");
		item_action_path = item_action_path.replace("/edit", "");
		$("#contact_note_form").attr("action", item_action_path);
		$("#contact_note_form").attr("method", "put");

		$("#delete_note_btn").attr("href", item_action_path);
		$("#delete_note_btn").attr("data-method", "delete");
	});

	$("#contact_note_form").submit(function() {
    var current_path = $("#contact_note_form").attr("action");
		var new_or_update = (current_path.charAt(current_path.length - 1) != 's');

    $.ajax({
     	type: new_or_update ? "put" : "post",
      url: $(this).attr("action"),
      data: $(this).serialize(),
      success: function() {
        if (new_or_update) {
					var last_slash = current_path.lastIndexOf("/");
					current_path = current_path.substr(0, last_slash);
				}

				$("#contact_note_form").attr("action", current_path);
				$("#contact_note_form").attr("method", "post");

				$("#delete_note_btn").attr("href", "#");
				$("#delete_note_btn").attr("data-method", "");

				window.location.reload();
      }
    })

  });

	$("#notes_list").on("ajax:success", '.new_note_a_class', function(e, data, status, xhr) {
		$("#note_caption").val(data.caption);
		$("#note_content").val(data.content);
		$("#new_note_caption").css("display", "inline-block");
	});

	$("#add_new_contact_note").on("ajax:success", function(e, data, status, xhr) {
		$("#note_caption").focus();

		new_note = $("#notes_list").append("<li><a href='/contacts/" + 
			data.contact_id + "/notes/" + 
			data.id + "/edit' data-remote='true' class='new_note_a_class'>" + data.caption + "</a></li>");
		new_note.find('li').last().find('a').first().click();
	});
});

function changeClientType(client_type) {
	$("#contact_contact_type").val(client_type);
	$("#current_client_type").submit();
}