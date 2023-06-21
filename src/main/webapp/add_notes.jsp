
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<form action="SaveNoteServlet" method="post">
		<div class="form-group">
			<label for="title">Note Title</label> <input type="text" name="title"
				class="form-control" id="inputText" aria-describedby="emailHelp"
				placeholder="Enter title Here" required>
		</div>
		<div class="form-group">
			<label for="content">Write Your Content</label>
			<textarea id="content" placeholder="Enter your content here" name="content"
				class="form-control" required style="height: 300px;" >
			</textarea>
		</div>
		
		<div class="container text-center">
			<button type="submit" class="btn btn-primary">Submit</button>
		</div>
	</form>
</body>
</html>