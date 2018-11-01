var btnChooseFile = document.getElementById("link_source");
		btnChooseFile.onclick = function() {
			$(".choose-file").hide();
			$(".upload-link").show();
		}

		var btnChooseFile = document.getElementById("com_source");
		btnChooseFile.onclick = function() {
			$(".choose-file").show();
			$(".upload-link").hide();
		}

		//upload
		$("#uploadFile").click(
				function() {
					blob = $("#file")[0].files[0];
					avatarBlob = $("#fileAvatar")[0].files[0];
					imgDescriptionBlob = $("#fileImage")[0].files[0];
					var formData = new FormData();
					formData.append('file', blob);
					formData.append('avatar', avatarBlob);
					formData.append('imgDescription', imgDescriptionBlob);

					formData.append('name', $("#name-sourceCode").val());
					/* formData.append('kindId', $("#kind_id").val()); */
					/* formData.append('categoryId', $("#category_id").val()); */
					formData.append('kindId', $("#kind_id").find(':selected')
							.attr('data-id'));
					formData.append('categoryId', $("#category_id").find(
							':selected').attr('data-id'));
					formData.append('description', $("#description").val());
					formData.append('point', $("#point").val());
					formData.append('linkDemo', $("#link-demo").val());
					formData.append('linkSource', $("#link-sourceCode").val());
					console.log("click submit");
					$.ajax({
						url : "/uploadFile",
						type : 'POST',
						data : formData,
						contentType : false,
						processData : false,
						success : function(data) {
							console.log(data);
							alert("success");
						}
					});
				});