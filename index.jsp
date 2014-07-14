<%@ include file="incBasics.jsp"%>
<%
	String title = "Comments (08)";
%>
<%
	// GET THE CURRENT COMMENTERS AND COMMENTS
	// race condition?
	if (commenters==null || comments==null) {
		comments   = f2s(datafile);
		application.setAttribute("comments",comments);
		commenters = getCommenters(comments);
		application.setAttribute("commenters",commenters);
	}
%>
<%
	// SET THE USERNAME AND IF THIS IS A "SIGN-IN" DEAL WITH IT
	username = request.getParameter("username");
	if (username==null || username.length()==0) {
		username = (String) session.getAttribute("username");
		if (username==null) username="Anonymous";
	}
	session.setAttribute("username",username);
%>
<%
	// IF THIS IS AN "ADD COMMENT" DEAL WITH IT
	String newcomment = request.getParameter("newcomment");
	if (newcomment!=null && newcomment.length()>0) {
		commenters.add(username);
		comments += username+"#"+newcomment+"\n";
		application.setAttribute("comments",comments);
		application.setAttribute("commenters",commenters);
		s2f(datafile,comments);
	}
%>
<%@ include file="incHead.jsp"%>
<header>
<h1>Comments, Comments, Comments ...</h1>
<ul>
	<li><a href="http://vc13.vc.panix.com:22021/">Home</li>
	<li><a href="signin.jsp">Sign-in</a></li>
	<li>Logged in as: <%= username %></li>
</ul>
</header>
<section>
	<h3>Add A Comment</h3>
	<form method="POST" action="index.jsp">
		Enter comment here: <input type='text' name='newcomment'><br>
		<input type='submit' value='Submit'/>
	</form>
		
</section>
<section>
	<br><h3>Commenters:</h3>
	<ul>
	<%
		// Get the list of commenters and display each commenter
		for (String commenter: commenters) {
			%>
			<li><a href="comments.jsp?commenter=<%=commenter%>"><%=commenter%></a></li>
			<%
		}
	%>
	</ul>
</section>
<%@ include file="incTail.jsp"%>
