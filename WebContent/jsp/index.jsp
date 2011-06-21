<jsp:include page="/jsp/header.jsp"></jsp:include>
		
		<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
		<%@ taglib uri='http://java.sun.com/jsp/jstl/sql'  prefix='sql'%>
								
		<div id="content">
				
			<div id="stylized" class="myform">
				<form id="form" name="form" method="post" action="query_database">
					<h1>Customer Table</h1>
					<p>Please choose your customer table action:</p>
					<div id="radioblock">
							<input type="radio" name="action" value="query" />Query<br />
							<input type="radio" name="action" value="add" />Insert<br />
							<input type="radio" name="action" value="update" />Update<br />
							<input type="radio" name="action" value="delete" />Delete<br />
					</div>
					<button type="submit">Submit</button>
				</form>
			</div>
			
			<div class="spacer"></div>
		
		</div>

<jsp:include page="/jsp/footer.jsp"></jsp:include>