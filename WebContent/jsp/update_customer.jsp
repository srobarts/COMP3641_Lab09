<jsp:include page="/jsp/header.jsp"></jsp:include>

<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'  %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/sql'  prefix='sql'%>
						
<div id="content">
	<h1>Update Result</h1>
	
	<%-- Perform a query against the selected customer --%>
      <sql:query var='customers'> 
         SELECT * FROM CUSTOMERS WHERE NAME = ?
         <sql:param value='${param.customer}'/>
      </sql:query>

      <%-- Set a variable for the row as a shorthand to be
           used below --%>
      <c:set var='row' value='${customers.rows[0]}'/>

      <%-- Populate a form with the query performed above --%>
      <form action='update_result.jsp'>
         <table>
            <tr><td>Name:</td>
                <td><c:out value='${row.NAME}'/></td></tr>

            <tr><td>Phone:</td>
                <td><input type='text' 
                     value='<c:out value="${row.PHONE_NUMBER}"/>' 
                      name='phone'/></td></tr>

            <tr><td>Address:</td>
                <td><input type='text' 
                    value='<c:out value="${row.STREET_ADDRESS}"/>'
                     name='address'
                     size='35'/></td></tr>

            <tr><td>City:</td>
                <td><input type='text' 
                          value='<c:out value="${row.CITY}"/>'
                          name='city'/></td></tr>

            <tr><td>State:</td>
                <td><input type='text' 
                          value='<c:out value="${row.STATE}"/>'
                          name='state'/></td></tr>
         </table>
         <p>
         <input type='submit' 
               value="Update <c:out value='${row.NAME}'/>">

         <input type='hidden' name='name'
               value='<c:out value="${row.NAME}"/>'/> 
      </form>
	
	
	
	</div>

<jsp:include page="/jsp/footer.jsp"></jsp:include>