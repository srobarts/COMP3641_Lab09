<jsp:include page="/jsp/header.jsp"></jsp:include>

<%@ page errorPage="/WEB-INF/jsp/errorPage.jsp" %>
						
<div id="content">
	<h1>Insert</h1>

	<form action='./insert_customer.jsp'>
         Add a Customer to the Database:<p>
         <table>
            <tr><td>Name:</td>
                <td><input type='text' name='name'/></td></tr>
            <tr><td>Phone Number:</td>
                <td><input type='text' name='phone'/></td></tr>
            <tr><td>Street Address:</td>
                <td><input type='text' name='address'/></td></tr>
            <tr><td>City:</td>
                <td><input type='text' name='city'/></td></tr>
            <tr><td>State:</td>
                <td><input type='text' name='state'/></td></tr>
         </table>
         <p><input type='submit' 
                  value='Add Customer to Database'/>
      </form>

</div>

<jsp:include page="/jsp/footer.jsp"></jsp:include>