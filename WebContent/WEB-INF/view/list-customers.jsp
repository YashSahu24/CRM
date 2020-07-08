<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List Customers</title>

<link type="text/css"
      rel="stylesheet"
      href="${PageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
    <div id="wrapper">
     <div id="header">
        <h1>CRM-Customer Relationship Management</h1>
     </div>
    </div>
    <div id="container">
     <div id="content">
         <input type="button" value="Add Customer"
          onclick="window.location.href='showFormForAdd'; return false;"
          class="add-button"
         />
        <table>
          <tr>
            <th>FirstName</th>
            <th>LastName</th>
            <th>Email</th>
          </tr>
          <c:forEach var="temp" items="${customers}">
          <c:url name="updateLink" value="/customer/showFormForUpdate">
           <c:param name="customerId" value="${temp.id}"></c:param>
          </c:url>
           <c:url name="deleteLink" value="/customer/delete">
           <c:param name="customerId" value="${temp.id}"></c:param>
          </c:url>
           <tr>
            <td>${temp.firstName}</td>
            <td>${temp.lastName}</td>
            <td>${temp.email}</td>
            <td>
              <a href="${updateLink}">Update</a>
              |
              <a href="${deleteLink}"
							   onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a>
            </td>
           </tr> 
          </c:forEach>
        </table>
     </div>
    </div>
</body>
</html>