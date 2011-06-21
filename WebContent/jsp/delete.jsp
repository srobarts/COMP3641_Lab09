<jsp:include page="/jsp/header.jsp"></jsp:include>

						
<div id="content">
	<h1>Delete</h1>

	<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'  %>
 	<%@ taglib uri='http://java.sun.com/jsp/jstl/sql'  prefix='sql'%>

      <%-- This query is used to populate the customers option--%>
      <sql:query var='customers'>
         SELECT * FROM CUSTOMERS   
      </sql:query>

      <form action='./delete_customer.jsp'>
         Select a Customer to Delete:
         <select name='customer'>
            <c:forEach var='row' items='${customers.rows}'>
               <option value="<c:out value='${row.NAME}'/>">
                  <c:out value='${row.NAME}'/>
               </option>
            </c:forEach>
         </select>
         <p><input type='submit' 
                  value='Delete Selected Customer'>
      </form>

</div>

<jsp:include page="/jsp/footer.jsp"></jsp:include>