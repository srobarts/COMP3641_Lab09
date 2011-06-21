<jsp:include page="/jsp/header.jsp"></jsp:include>

<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/sql'  prefix='sql'%>
						
<div id="content">
	<h1>Select</h1>
	
	<%-- This query is used to populate the customers option--%>
      <sql:query var='customers'>
         SELECT * FROM CUSTOMERS   
      </sql:query>
	
	<form action='./select_output.jsp'>
         Select a Customer to Query:
         <select name='customer'>
         	<option value="101">-- All --</option>
            <c:forEach var='row' items='${customers.rows}'>
               <option value="<c:out value='${row.name}'/>">
                  <c:out value='${row.name}'/>
               </option>
            </c:forEach>
         </select>

         <p><input type='submit' 
                  value='Select Customer'/>
      </form>

</div>

<jsp:include page="/jsp/footer.jsp"></jsp:include>