<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.helper.* "%>
    <%@page import="com.entities.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>edit</title>
 <%@include file="all_js_css.jsp" %>
</head>
<body>
	 <div class="container">
    	<%@include file="navbar.jsp" %>
    	<h1>Edit Notes</h1>
    	<%
    		int noteId = Integer.parseInt(request.getParameter("notes_id").trim());
    		Session session2 = FactoryProvider.getFactory().openSession();
    		Note note =(Note)session2.get(Note.class,noteId);
    	%>
    	<form action="UpdateNoteServlet" method="post">
    	<input value="<%=note.getId() %>" name="noteId" type="hidden"/>
		<div class="form-group">
			<label for="title">Note Title</label> <input type="text" name="title"
				class="form-control" id="inputText" aria-describedby="emailHelp"
				placeholder="Enter title Here" required value="<%=note.getTitle() %>">
		</div>
		<div class="form-group">
			<label for="content">Write Your Content</label>
			<textarea id="content" placeholder="Enter your content here" name="content"
				class="form-control" required style="height: 300px;" ><%=note.getContent() %>
			</textarea>
		</div>
		
		<div class="container text-center">
			<button type="submit" class="btn btn-success">Save</button>
		</div>
	</form>
    	
    	
    	
    </div>

</body>
</html>