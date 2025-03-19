<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<script>
	  window.history.forward();
	  function preventBack(){
		  window.history.forward();
	  }
	  setTimeout("preventBack()",0);
	  window.onload=function(){null};
	
	</script>
<%


if (session != null) {
	session.invalidate();
}
response.setHeader("Cache-control","no-cache,no-store,must-revalidate");
response.setHeader("Pragma","no-cache");
response.setHeader("Expires", "0");
response.sendRedirect("index.jsp");

%>