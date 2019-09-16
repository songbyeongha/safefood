<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<footer>
        <div class="container">
            <div class="row text-center text-xs-center text-sm-left text-md-left">
                <div class="col-xs-12 col-sm-4 col-md-4"></div>
                <div class="col-xs-12 col-sm-4 col-md-4">
                    <h3>Find Us</h3>
                    <hr>
                    <ul class="list-unstyled quick-links">
                    	<c:url value="/static/images/gps.jpg" var="gps"/>
                    	<c:url value="/static/images/call.png" var="call"/>
                    	<c:url value="/static/images/email.png" var="email"/>
                        <li><img src="${gps }" alt="" width="25" height="25" />safefood </li>
                        <li><img src="${call }" alt="" width="25" height="25" />1544-1234</li>
                        <li><img src="${email }" alt="" width="25" height="25" /><a href="#">admin@safefood.com</a></li>
                    </ul>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-2 text-center text-white">
                    <p class="h6">&copy; Copyright by safefood All right Reversed.</p>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>