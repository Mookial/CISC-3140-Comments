<%@ include file="incBasics.jsp"%>

<%
	String commenter= request.getParameter("commenter");
	String title = commenter + "'s Comment Page";
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
	<h2><u><%=commenter%>'s Comments</h2></u>
	<br><ul>
	<%
		String prefix = commenter+"#";
		String[] coms = comments.split("\n");
		for (String com: coms) {
			if (com.startsWith(prefix)) {
				%>
				<div id='textBorder'><li><%=com.substring(prefix.length())%></li></div><br>
				<%
			}
		}
	%>
	</ul>
</section>

<%@ include file="incTail.jsp"%>
