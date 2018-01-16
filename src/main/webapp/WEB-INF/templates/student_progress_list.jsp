<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/templates/i18n.jsp" %>
<fmt:setBundle basename="/i18n/student_progress_list" var="bundle" scope="session" />
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><fmt:message bundle="${bundle}" key="title" /></title>
        <link rel="stylesheet" type="text/css" href="/static/css/main.css">
        <style>
            .progresses {
                width: 800px;
                height: 100%;
            }
        </style>
    </head>
    <body>
        <h1><fmt:message bundle="${bundle}" key="title" /></h1>
        <hr>
        <div class="progresses">
            <table>
                <tr class="table-header">
                    <th><fmt:message bundle="${bundle}" key="number" /></th><th><fmt:message bundle="${bundle}" key="student" /></th><th><fmt:message bundle="${bundle}" key="quiz" /></th><th><fmt:message bundle="${bundle}" key="questions" /></th><th><fmt:message bundle="${bundle}" key="correct" /></th>
                </tr>
                <c:forEach var="studentProgress" items="${requestScope.progresses}" varStatus="progressLoop">
                    <tr class="progress-info">
                        <td><c:out value="${progressLoop.index + 1}"/></td><td><a href="${pageContext.request.contextPath}/student/${studentProgress.student.id}"><c:out value="${studentProgress.student.lastName} ${studentProgress.student.firstName} ${studentProgress.student.patronymic}"/></a></td><td><a href="${pageContext.request.contextPath}/result/${studentProgress.student.id}/${studentProgress.quiz.id}"><c:out value="${studentProgress.quiz.name}"/></a></td><td><c:out value="${studentProgress.questionCount}"/></td><td><c:out value="${studentProgress.correctCount}"/></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <hr>
        <div class="navigation-menu">
            <nav>
                <a href="${pageContext.request.contextPath}/"><fmt:message bundle="${bundle}" key="home" /></a>
            </nav>
        </div>
    </body>
</html>
