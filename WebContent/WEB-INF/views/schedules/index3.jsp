<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <h2>面談予定 一覧</h2>

        <h3>確認開始</h3>
        <c:forEach var="schedule" items="${schedules}" varStatus="status">
            <c:out value="${schedule.project_title}" />
        </c:forEach>
        <h3>確認終了</h3>

        <table id="schedule_list">
            <tbody>
                <tr>
                    <th class="schedule_employee_name">氏名</th>
                    <th class="schedule_project_title">案件名</th>
                    <th class="schedule_action">操作</th>
                </tr>
                <c:forEach var="schedule" items="${schedules}" varStatus="status">
                    <tr class="row${status.count % 2}">
                        <td class="schedule_employee_name"><c:out value="${schedule.employee.employee_name}" /></td>
                        <td class="schedule_project_title"><c:out value="${schedule.project_title}" /></td>
                        <td class="schedule_action"><a href="<c:url value='/schedules/show?id=${shcedule.id}' />">詳細を見る</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div id="paginattion">
            (全 ${schedules_count} 件)<br />
            <c:forEach var="i" begin="1" end="${((schedules_count - 1) / 15) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/schedules/index?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
        <p><a href="<c:url value='/schedules/new' />">新規予定の登録</a></p>

    </c:param>
</c:import>