<%-- 
    Document   : supplier
    Created on : Apr 5, 2022, 3:08:45 PM
    Author     : 27769
--%>
<%@page import="za.co.bigone.model.User"%>
<%@page import="za.co.bigone.model.Issue"%>
<%@page import="za.co.bigone.model.Supplier"%>
<%@page import="za.co.bigone.model.Assign"%>
<%@page import="java.util.List"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Progma", "no-cache");
    response.setHeader("Expire", "0");
    if (session.getAttribute("user") == null) {
        response.sendRedirect("signin-singup.jsp");
    }
    
    Issue issue = (Issue) request.getAttribute("issue");
    User user = (User) session.getAttribute("user");
    List<Supplier> supplier = (List<Supplier>) request.getAttribute("suppliers");
    String msg = (String) request.getAttribute("msg");

    if (msg == null) {
        msg = "";
    }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Suppliers</title>
        <link rel="stylesheet" href="main.css">
        <link rel="stylesheet" type="text/css" href="css/all.css" />
        <link rel="stylesheet" type="text/css" href="css/all.min.css" />
        <link rel="stylesheet" type="text/css" href="css/fontawesome.min.css" />
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script src="javascript/jquery.js"></script>
    </head>
    <body>
        <section class="body-sel">
            <section id="side-menu">
                <div class="logo">

                    <h2>Issue Tracker</h2>
                </div>
                <div class="iterm-menu">
                    <li><i class="fas fa-chart-pie"></i><a href="supplierDashboard.jsp">Dashboard</a></li>
                    <li><i class="fas fa-bug"></i><a href="issues.jsp">Issues</a></li>
                    <li><i class="fas fa-user"></i><a href="Profile.jsp">Profile</a></li>
                    <li><i class="fas fa-sign-out-alt"></i><a href="http://localhost:8080/Issue_Tracter/RegisterLoginSerlet?action=logout">Sign Out</a></li>
                </div>
            </section>

            <section id="dash-interface">
                <div class="navigation">
                    <div class="top-nav">
                        <div>
                            <i id="menu-btn" class="fas fa-bars"></i>
                        </div>
                        <div class="search">
                            <i class="fas fa-search"></i>
                            <input type="text" placeholder="Search">
                        </div>
                    </div>

                </div>

                <h3 class="i-name">Issue Form</h3>


                <%                    if (issue != null) {
                %>
                <div class="form-div">
                    <div class="form-form">
                        <p><%= msg%></p>
                        <form action="IssueServlet" method="POST" enctype="multipart/form-data">

                            <input type="text" name="typeofissue" value="<%= issue.getTypeofissue()%>" disabled />
                            <input type="text" name="sreet" value="<%= issue.getStreetName()%>" disabled />
                            <input type="text" name="town" value="<%= issue.getTown()%>" disabled />
                            <input type="text" name="zipCode" value="<%= issue.getZipCode()%>" disabled />
                            <textarea rows="8" name="IssueDiscription" value="<%= issue.getIssueDiscription()%>" disabled><%= issue.getIssueDiscription()%></textarea>
                            <input type="file" name="filecover" value="Upload"/>

                            <select name="status" required>
                                <option value="<%= issue.getStatus()%>"><%= issue.getStatus()%> </option>
                                <option value="Open">Open</option>
                                <option value="In Progress">In Progress</option>
                                <option value="Resolved">Resolved</option>
                                <option value="Closed">Closed</option>

                            </select>
                            <br>
                            <button type="submit" class="btn btn-success">Save</button>

                            <input type="hidden" name="action" value="resolve" />
                            <input type="hidden" name="issueId" value="<%= issue.getIssueID()%>" />

                        </form>
                    </div>
                </div>
                <%                    } else {
                %>
                <div class="form-div">
                    <div class="form-form">
                        <form action="IssueServlet" method="POST" enctype="multipart/form-data">
                            <select name="typeofissue" required>
                                <option value="">Select Type Issue</option>
                                <option value="Water">Water</option>
                                <option value="Electricity">Electricity</option>
                                <option value="Road">Road</option>
                                <option value="other">Other</option>
                            </select>
                            <br>
                            <input type="text" name="sreet" placeholder="Enter Street Name" required />
                            <input type="text" name="town" placeholder="Enter Town" required />
                            <input type="text" name="zipCode" placeholder="Enter Zip Code" required />
                            <textarea rows="8" name="IssueDiscription" placeholder="Issue Discription" required></textarea>
                            <input type="file" name="filecover" value="Upload"/>
                            <br>
                            <button type="submit" class="btn btn-success">Save</button>

                            <input type="hidden" name="action" value="createTicket" />
                        </form>
                    </div>
                </div>
                <%
                    }
                %>
            </section>
        </section>

        <script>
            $('#menu-btn').click(function () {
                $('#side-menu').toggleClass("active");
            });
        </script>
    </body>
</html>
