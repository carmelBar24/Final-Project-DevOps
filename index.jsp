<%@ page language="java" %>
<html>
<head>
  <title>Echoing HTML Request Parameters</title>
</head>
<body>
  <h3>Choose an author:</h3>
  <form method="get">
    <input type="checkbox" name="author" value="Carmel Bar">shir
    <input type="checkbox" name="author" value="Yarin Magdaci">Yarin
    <input type="checkbox" name="author" value="David Daida">David
    <input type="checkbox" name="author" value="Sher Cohen">Sher
    <input type="checkbox" name="author" value="error">No Author
    <input type="submit" value="Query">
  </form>
 
  <%-- Check if form submitted and handle authors --%>
  <%
    String[] authors = request.getParameterValues("author");
    if (authors != null && authors.length > 0) {
      boolean hasNoAuthor = false;
      for (String author : authors) {
        if (author.equals("error")) {
          hasNoAuthor = true;
          break;
        }
      }
      
      if (hasNoAuthor) {
  %>
        <h3><font color="red">Error: Please select at least one author or choose 'No Author'.</font></h3>
        <a href="<%= request.getRequestURI() %>">BACK</a>
  <%
      } else {
  %>
        <h3>You have selected author(s):</h3>
        <ul>
  <%
        for (String author : authors) {
          %>
          <li><%= author %></li>
          <%
        }
  %>
        </ul>
        <a href="<%= request.getRequestURI() %>">BACK</a>
  <%
      }
    }
  %>
</body>
</html>
