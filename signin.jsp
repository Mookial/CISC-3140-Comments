<!DOCTYPE html>
<%@ include file="incBasics.jsp"%>

<html>
<%
	String title = "Sign-in Page";
%>
<%
	System.err.println("Index: Session ID = " + session.getId());
%>

<%@ include file="incHead.jsp"%>
<header>
	<h1>Comments, Comments, Comments ...</h1>
<ul>
	<li><a href="index.jsp">Home</a></li>
	<li><a href="signin.jsp">Sign-in</a></li>
	<li>Logged in as: <%= username %></li>
</ul>
</header>

<section>
	<h2>SIGN IN</h2>
	<form method='POST' action='index.jsp'>
		Username: <input type='text' name='username'/><br>
		Password: <input type='text' name='password'/><br>
		<input type='submit' value='Login'/>			
	</form>
	
</section>
<br><%@ include file="incTail.jsp"%>
