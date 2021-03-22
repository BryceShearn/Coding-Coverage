<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registration</title>
</head>
<body>
    <div align="center">
        <form:form action="createComment.do" method="post" modelAttribute="userForm">
            <table border="0">
                <tr>
                    <td colspan="2" align="center"><h2>create a comment</h2></td>
                </tr>
                <tr>
                    <td>Title:</td>
                    <td><form:input path="title" /></td>
                </tr>
                <tr>
                    <td>Body:</td>
                    <td><form:input path="userCommentBody" /></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="Register" /></td>
                </tr>
            </table>
        </form:form>
    </div>
</body>
</html>