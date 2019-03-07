<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>




<style>
.jumbotron {
	margin-bottom: 10px;
}
</style>
</head>
<body style="backgroud-color: red;">
	<div class="jumbotron">
		<div class="container text-center">
			<form action="update" method="post">



				<div class="form-group row">
					<label for="colFormLabelLg"
						class="col-sm-3 col-form-label col-form-label-lg"></label>
					<div class="col-sm-4">
						<input type="hidden" class="form-control" id="id"
							name="id">
					</div>
				</div>



				<div class="form-group row">
					<label for="colFormLabelLg"
						class="col-sm-3 col-form-label col-form-label-lg"></label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="name"
							placeholder="Enter the track " name="name">
					</div>
				</div>
				<div class="form-group row">
					<label for="colFormLabelLg"
						class="col-sm-3 col-form-label col-form-label-lg"></label>
					<div class="col-sm-4">
						<textarea class="form-control" id="comment" name="comment"
							placeholder="Enter your comments here" rows="3"></textarea>
					</div>
				</div>

				<div class="col-sm-10">

					<button type="submit" class="btn btn-primary btn-sm">Update</button>
				</div>
			</form>
		</div>
	</div>

	<script>
		document.getElementById("id").value = `${tracks.id}`;
		document.getElementById("name").value = `${tracks.name}`;
		document.getElementById("comment").value = `${tracks.comment}`;
		
		
	</script>
</body>
</html>