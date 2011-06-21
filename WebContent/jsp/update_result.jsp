<jsp:include page="/jsp/header.jsp"></jsp:include>

<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'  %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/sql'  prefix='sql'%>
						
<div id="content">
	<h1>Update Result</h1>
	
	<%-- Perform the database update --%>
      <sql:update var='updateResult'> 
         UPDATE CUSTOMERS SET PHONE_NUMBER = ?, 
         STREET_ADDRESS = ?, CITY = ?, STATE = ?
         WHERE NAME = ?
         <sql:param value='${param.phone}'/>
         <sql:param value='${param.address}'/>
         <sql:param value='${param.city}'/>
         <sql:param value='${param.state}'/>
         <sql:param value='${param.name}'/>
      </sql:update>

      <%-- Perform a query against the updated customer --%>
      <sql:query var='customers'>
         SELECT * FROM CUSTOMERS WHERE NAME = ?
         <sql:param value='${param.name}'/>
      </sql:query>

      <%-- Show how many rows were updated --%>
      <p><font size='4'>
         <c:out value='${updateResult} row updated '/>
         <c:out value='for ${param.name}:'/>
      </font>

      <%-- Display updated data with the query performed above--%>
      <c:forEach var='row' items='${customers.rows}'>
         <p><table border='1'>
            <tr><td>Phone:</td>
                <td><c:out value='${row.PHONE_NUMBER}'/></td>
            </tr>

            <tr><td>Address:</td>
                <td><c:out value='${row.STREET_ADDRESS}'/></td>
            </tr>

            <tr><td>City:</td>
                <td><c:out value='${row.CITY}'/></td>
            </tr>

            <tr><td>State:</td>
                <td><c:out value='${row.STATE}'/></td>
            </tr>
         </table>
      </c:forEach>



</div>

<jsp:include page="/jsp/footer.jsp"></jsp:include>