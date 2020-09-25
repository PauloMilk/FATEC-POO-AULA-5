<%-- 
    Document   : index
    Created on : Sep 23, 2020, 12:05:18 AM
    Author     : pauloleitecosta
--%>
    
<%@page import="java.util.ArrayList"%>
<%@page import="models.Contact"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<Contact> contacts = (ArrayList) application.getAttribute("contacs");
    if(contacts == null) {
        contacts = new ArrayList();
        contacts.add(new Contact("Paulo", "13996205206", "pauloleitecosta14@gmail.com"));
        application.setAttribute("contacs", contacts);
    }
    
    if(request.getParameter("add") != null ) {
         String name = request.getParameter("name");
         String telephone = request.getParameter("telephone");
         String email = request.getParameter("email");
         contacts.add(new Contact(name, telephone, email));
         response.sendRedirect(request.getRequestURI());
    }
    
    if(request.getParameter("remove") != null) {
        int i = Integer.parseInt(request.getParameter("remove"));
        contacts.remove(i-1);
        response.sendRedirect(request.getRequestURI());
    }

%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
            
        <title>List of contacts</title>
    </head>
    <body>
        <header>
            <%@include file="parts/header.jsp" %>
        </header>
        <div class="container mt-4">
            <div class="card">
                <div class="card-header">
                    List of Contacts
                </div>
                <div class="card-body">
                    <form class="mb-5 pb-3" method="post">
                        <div class="form-row">
                            <div class="form-group col-md-4">
                                <label for="inputName">Name</label>
                                <input type="text" class="form-control" id="inputName" placeholder="Name" name="name">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="ineputTelephone">Telephone</label>
                                <input type="text" class="form-control" id="inputTelephone" placeholder="Telephone" name="telephone">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="inputEmail">Email</label>
                                <input type="email" class="form-control" id="inputEmail" placeholder="Email" name="email">
                            </div>
                        </div>
                        <input type="hidden" name="add" value="true">
                        <button type="submit" class="btn btn-success float-right btn-lg">Save</button>
                    </form>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Name</th>
                                <th scope="col">Telephone</th>
                                <th scope="col">E-mail</th>
                                <th scope="col">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% 
                                int count = 1;
                                for (Contact contact : contacts) {
                                    
                             
                            %>
                            <tr>
                                <th scope="row"><%=count%></th>
                                <td><%=contact.getName()%></td>
                                <td><%=contact.getTelephone()%></td>
                                <td><%=contact.getEmail()%></td>
                                <td>
                                    
                                    <form >
                                        <button type="submit" class="btn btn-danger">Remove</button>
                                        <input type="hidden" name="remove" value="<%= count %>" />
                                    </form>
                                </td>
                            </tr>
                              <%
                                        count++;
                                        }%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>