<jsp:include page="/jsp/header.jsp"></jsp:include>

<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/sql'  prefix='sql'%>
						
<div id="content">
	<h1>Insert Customer</h1>

	<%-- This query is made to find out how many customers
           are currently in the database --%>
      <sql:query var='customers'>
         SELECT * FROM CUSTOMERS   
      </sql:query>

      <%-- Perform the database update --%>
      <sql:update var='updateResult'> 
         INSERT INTO CUSTOMERS VALUES (?, ?, ?, ?, ?, ?)
         <sql:param value='${customers.rowCount+1}'/>
         <sql:param value='${param.name}'/>
         <sql:param value='${param.phone}'/>
         <sql:param value='${param.address}'/>
         <sql:param value='${param.city}'/>
         <sql:param value='${param.state}'/>
      </sql:update>

      <%-- Show the result of the update --%>
      <font size='5'>
         <c:out value='${updateResult} Customer was Inserted:'/>
         <c:out value='${param.name}'/>
      </font>

      <%-- After adding a customer, perform another customers 
           query --%>
      <sql:query var='customers'>
         SELECT * FROM CUSTOMERS   
      </sql:query>

      <%-- Access the rowCount property of the query --%>
      <p><c:out value='There are ${customers.rowCount} rows'/>
       in the customer query. Here they are:</p>

      <%-- Create a table with column names and row data --%>
      <div id="tablecontent">
      <p><table border='1'>
         <tr>
            <c:forEach var='columnName' 
                     items='${customers.columnNames}'>
               <th><c:out value='${columnName}'/></th>
            </c:forEach>
           </tr> 

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