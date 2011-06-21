<jsp:include page="/jsp/header.jsp"></jsp:include>

<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/sql'  prefix='sql'%>
						
<div id="content">
	<h1>Select Output</h1>
	
	<c:out value="${request.getAttribute}"/>  

	<%-- Run a SELECT query --%>
		<c:choose>
		<c:when test="${param.customer == 101}">
			<sql:query var='customers'>
         		SELECT * FROM CUSTOMERS
      		</sql:query>
      	</c:when>
      	<c:otherwise>
      		<sql:query var='customers'>
         		SELECT * FROM CUSTOMERS WHERE NAME = ?
         		<sql:param value='${param.customer}'/>
      		</sql:query>
      	</c:otherwise>
      	</c:choose>
      	
		
      
      
    <%-- Create a table with column names and row data --%>
    <div id="tablecontent">
      <table border='1'>
         <tr>
            <c:forEach var='columnName' items='${customers.columnNames}'>
               <th><c:out value='${columnName}'/></th>
            </c:forEach>
         </tr>


	  <%-- Read and display the query results --%>
	  	<c:set var="count" value="1"/>
         <c:forEach var='row' items='${customers.rowsByIndex}'>
         <c:choose>
         	<c:when test="${count % 2 == 0}">
            	<tr bgcolor="#C3F3C3">
         	</c:when>
         <c:otherwise>
         	<tr>
         </c:otherwise>
         </c:choose>
               <c:forEach var='rowData' items='${row}'>
                     <td><c:out value='${rowData}'/></td>
               </c:forEach>
            </tr>
         <c:set var="count" value="${count + 1}" />
         </c:forEach>
	</table>
	</div>

</div>

<jsp:include page="/jsp/footer.jsp"></jsp:include>