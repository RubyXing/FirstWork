<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>请求转发查看</title>
</head>
<body>

${myBean}

<c:forEach items="${myList}" var="clist">
    ${clist}
</c:forEach>
</body>
</html>
