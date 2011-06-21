<jsp:include page="/jsp/header.jsp"></jsp:include>
						
<div id="content">
	<h1>Delete</h1>

	<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'  %>
 	<%@ taglib uri='http://java.sun.com/jsp/jstl/sql'  prefix='sql'%>
 
 	
 	<%-- Perform the database delete --%>
      <sql:update var='updateResult'> 
         DELETE FROM CUSTOMERS WHERE NAME = ?
         <sql:param value='${param.customer}'/>
      </sql:update>

      <%-- Show how many rows were deleted --%>
      <font size='5'>
         <c:out value='${updateResult} Customer was Deleted:'/>
         <c:out value='${param.customer}'/>
      </font>

      <%-- Make a query of all customers in the database --%>
      <sql:query var='customers'>
         SELECT * FROM CUSTOMERS   
      </sql:query>

      <%-- Access the rowsCount property of the query --%>
      <p><c:out value='There are ${customers.rowCount} rows'/>
       in the customer query. Here they are:

      <%-- Create a table with column metadata and row data --%>
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