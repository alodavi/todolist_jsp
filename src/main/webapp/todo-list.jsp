
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page import="java.util.*" %>

<html>
<body>


<!-- Step 1: Create HTML form-->
<form action="todo-list.jsp">
	Add new Item: <input type="text" name="theItem"/>
	<input type="submit" value="Submit"/>
	<input type="submit" value="Clear List" name="clear"/>
</form>

<!-- Step 2: add new item to todo list-->
<% 
	// get the TODO items from the session
	List<String> items = (List <String>) session.getAttribute("myToDoList");
	
	//if the todo items doesn't exist than create a new one
	if (items==null){
		items = new ArrayList<String>();
		session.setAttribute("myToDoList", items);
	}
	
	//see if there is a form data to add
	String theItem = request.getParameter("theItem");
	if (theItem != null){
		items.add(theItem);
	}
	
	if (request.getParameter("clear") != null){
		session.invalidate();
		response.sendRedirect(request.getContextPath() + "/todo-list.jsp");
	}
	
%>
<!-- Step 3: -->
<hr>
<b>ToDo List items: </b><br><br>

<ol>
<%
	for (String temp : items){
		out.println("<li>"+temp+"</li>");
	}
%>
</ol>

</body>
</html>