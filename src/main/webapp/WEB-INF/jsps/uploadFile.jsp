<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
	integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Upload source code</title>
</head>
<body>
	<div class="container">
		<div class="content">
			<h1 style="text-align: center; font-weight: bold;">UPLOAD SOURCE
				CODE</h1>
			<p style="font-style: italic;">- You must complete the rules
				below to upload source code. The administrator will then censor the
				source code before public. - Source code does not contain viruses,
				not violate the original Right, people can download and use source
				code.</p>

			<!-- <form id="my-form" class="w3-container w3-card-4 w3-light-grey"
				enctype="multipart/form-data" method="POST"> -->
				<div class="name-sourceCode">
					<div>
						<strong>1. Enter the source code name of up to 120
							characters(<span style="color: #F00;">Obligatory</span>)
						</strong>
					</div>
				</div>
				<div class="name-input" style="margin-top: 5px;">
					<p>
						<input class="w3-input w3-border" id="name-sourceCode"
							placeholder="enter the source code name of up to 120 characters"
							name="name-source" type="text"
							style="border-radius: 10px !important;">
					</p>
					<p>
				</div>
				<div class="w3-panel w3-border-bottom w3-border-green"></div>
				<div class="category-source">
					<div>
						<strong>2. Select kind and category of source code(<span
							style="color: #F00;">Obligatory</span>)
						</strong>
					</div>
				</div>
				<div class="row" style="padding: 5px 130px;">
					<div class="col-sm-6">
						<select class="w3-select w3-border select-up-source border-input"
							name="kind_id" id="kind_id"
							style="border-radius: 10px !important;">
							<option value="" disabled="" selected="">Select kind of
								source code</option>
							<option value="1">App mobile</option>
							<option value="2">Game</option>
							<option value="3">Website</option>
						</select>
					</div>
					<div class="col-sm-6" style="border-radius: 10px !important;">
						<select class="w3-select w3-border select-up-source border-input"
							name="category_id" id="category_id"
							style="border-radius: 10px !important;">
							<option value="" disabled="" selected="">Select category
								of source code</option>
							<option value="1">Java</option>
							<option value="2">Javascript</option>
							<option value="3">C#</option>
						</select>
					</div>
				</div>
				<div class="w3-panel w3-border-bottom w3-border-green"></div>
				<div class="div_ckeditor">
					<div>
						<div>
							<strong>3. Enter the source code description and
								installation instructions(<span style="color: #F00;">Obligatory</span>)
							</strong>
						</div>
					</div>

				</div>
				<div class="name-input" style="margin-top: 5px;">
					<p>
						<input class="w3-input w3-border" id="description"
							name="description" type="text"
							style="border-radius: 10px !important;">
					</p>
				</div>
				<div class="w3-panel w3-border-bottom w3-border-green"></div>
				<div class="name-sourceCode">
					<div>
						<strong>4. Input point (1 point = 1.000VND) source code
							(If free, enter 0 or leave empty) </strong>
					</div>
				</div>
				<div class="name-input" style="margin-top: 5px;">
					<p>
						<input class="w3-input w3-border" id="point" name="point"
							type="text" style="border-radius: 10px !important;">
					</p>
					<p>
				</div>
				<div class="w3-panel w3-border-bottom w3-border-green"></div>
				<div class="name-sourceCode">
					<div>
						<strong>5. Link demo source code starts https: // or
							http: // (if not empty).</strong>
					</div>
				</div>
				<div class="name-input" style="margin-top: 5px;">
					<p>
						<input class="w3-input w3-border" id="link-demo" name="link-demo"
							type="text" style="border-radius: 10px !important;">
					</p>
					<p>
				</div>
				<div class="w3-panel w3-border-bottom w3-border-green"></div>
				<div class="form-group">
					<label><strong>6. Upload source code compressed
							with .zip or .rar file (<span style="color: #F00;">Obligatory</span>)
					</strong></label> <br>
					<div class="col-sm-12">
						<div>
							<input class="w3-radio url_source" type="radio" name="url_source"
								id="com_source" value="0" checked="checked"> <label
								for="com_source"><strong>Up source code from PC</strong></label>
							<input class="w3-radio url_source" type="radio" name="url_source"
								id="link_source" value="1"> <label for="link_source"><strong>Up
									link source code</strong></label>
						</div>
						<div class="choose-file">
							<div class="row" style="margin: 5px 5px;">
								<div class="col-sm-2">
									<span class="btn btn-default btn-file border-input"> <span
										class="fileupload-new" style="float: left;"><i
											class="fa fa-file-code-o w3-xlarge"></i> Click choose file</span> <input
										type="file" name="file" id="file" accept=".zip, .rar"><span
										id="error-file-source-code"
										style="color: #F00; font-weight: bold"></span>
									</span>
								</div>
								<div class="col-sm-9"></div>
							</div>
						</div>
						<div class="upload-link">
							<div class="name-input" style="margin-top: 5px;">
								<p>
									<input class="w3-input w3-border" id="link-sourceCode"
										placeholder="Link contains source code that starts with http:// or https://"
										name="first" type="text"
										style="border-radius: 10px !important;">
								</p>
								<p></p>
							</div>
						</div>
					</div>
				</div>
				<div class="w3-panel w3-border-bottom w3-border-green"></div>
				<div>
					<label><strong>7. Upload avatar format .jpeg,
							.jpg, .png (<span style="color: #F00;">Obligatory and size
								&lt; 2M</span>)
					</strong></label>
					<div class="w3-container" id="img-avatar"></div>
					<input type="file" name="fileAvatar" id="fileAvatar"
						accept=".jpeg, .jpg, .png">
				</div>
				<div class="w3-panel w3-border-bottom w3-border-green"></div>
				<div>
					<label><strong>8. Upload iamges description width
							format .jpeg, .jpg, .png (<span style="color: #F00;">Required
								at least 1 image, up to 15 images and size &lt; 2M</span>)
					</strong></label>
					<div class="w3-container" id="img-description"></div>
					<input type="file" name="fileImage[]" id="fileImage"
						accept=".jpeg, .jpg, .png" multiple="multiple">
				</div>
				<div class="w3-panel w3-border-bottom w3-border-green"></div>
				<p style="text-align: center;">
					<a id="uploadFile" class="w3-button w3-green w3-round"><i
						class="fas fa-cloud-upload-alt w3-xlarge"> UPLOAD</i></a>
				</p>
				<!-- <input type="submit" id="submitButton"  name="submitButton" value="Submit">
			</form> -->
		</div>
	</div>
	<style>
.container {
	width: 100%;
	margin: 0 auto;
	float: left;
}

.content {
	width: 80%;
	margin: 0 auto;
}

.upload-link {
	display: none;
}
</style>
	<script>
	var btnChooseFile = document.getElementById("link_source");
	btnChooseFile.onclick = function(){
		 $(".choose-file").hide();
		 $(".upload-link").show();
	}
	
	var btnChooseFile = document.getElementById("com_source");
	btnChooseFile.onclick = function(){
		 $(".choose-file").show();
		 $(".upload-link").hide();
	}
	
	//upload
	$("#uploadFile").click(function() {
		blob = $("#file")[0].files[0];
		avatarBlob = $("#fileAvatar")[0].files[0];
		imgDescriptionBlob = $("#fileImage")[0].files[0];
		var formData = new FormData();
		formData.append('file', blob);
		formData.append('avatar', avatarBlob);
		formData.append('imgDescription', imgDescriptionBlob);
		
		formData.append('name', $("#name-sourceCode").val());
		/* formData.append('kindId', $("#kind_id").val());
		formData.append('categoryId', $("#category_id").val()); */
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
</script>
</body>
</html>