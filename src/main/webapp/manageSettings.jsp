<%@ page import="timeSheet.UtilWeb" %>
<%@ page import="timeSheet.database.DBType" %>
<%@ page import="timeSheet.database.manager.SettingsManager" %>
<%@ page import="timeSheet.util.LoginType" %>
<%@ page import="timeSheet.util.PropertyName" %>
<%--
  User: John Lawrence
  Date: 1/3/11
  Time: 3:07 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    SettingsManager manager = new SettingsManager();
    if (request == null) {
        out.println("We are dead!");
    } else {
        manager.saveParameters(request.getParameterMap());
    }
%>
<html>
<head>
    <% UtilWeb.checkSession(session, out, false); %>
    <title>PaySystem - Manage System Settings</title>
    <style type="text/css">
        @import url('display.css');
    </style>
</head>
<body>
<% out.println(UtilWeb.getMenu(request));%>
<h1><%=UtilWeb.getCompanyName()%> Pay System</h1>
<h2>System Settings Management</h2>
<div class="login">
    <form action="manageSettings.jsp" method="post">
        <h4>Company Settings</h4>
        <br />
        <label for="companyName">Company Name:</label>
        <input class="field" type="text" id="companyName" name="<%=PropertyName.COMPANY_NAME.getName()%>" value="<%=manager.getCompanyName()%>">
        <br/>
        <h4>Login Settings</h4>
        <br/>
        <label for="loginType">Database Type:</label>
        <select id="loginType" name="<%=PropertyName.LOGIN_TYPE.getName()%>" class="field">
            <% out.println(LoginType.getSelection()); %>
        </select>
        <br/>
        <label for="ldapServer">LDAP Server:</label>
        <input class="field" type="text" id="ldapServer" name="<%=PropertyName.LDAP_SERVER.getName()%>" value="<%=manager.getLDAPServer()%>">
        <br/>
        <label for="ldapDomain">LDAP Domain:</label>
        <input class="field" type="text" id="ldapDomain" name="<%=PropertyName.LDAP_DOMAIN.getName()%>" value="<%=manager.getLDAPDomain()%>">
        <br/>
        <h4>Database Settings</h4>
        <br />
        <label for="dbType">Database Type:</label>
        <select id="dbType" name="<%=PropertyName.DB_TYPE.getName()%>" class="field">
            <% out.println(DBType.getSelection()); %>
        </select>
        <br />
        <label for="dbLocation">Database Location:</label>
        <input class="field" type="text" id="dbLocation" name="<%=PropertyName.DB_LOCATION.getName()%>" value="<%=manager.getDBLocation()%>">
        <br />
        <label for="dbUserName">Database User Name:</label>
        <input class="field" type="text" id="dbUserName" name="<%=PropertyName.DB_USER_NAME.getName()%>" value="<%=manager.getDBUserName()%>">
        <br />
        <label for="dbPassword">Database Password:</label>
        <input class="field" type="password" id="dbPassword" name="<%=PropertyName.DB_PASSWORD.getName()%>" value="<%=manager.getDBPassword()%>">
        <br />
        <input type="submit" value="Save" class="submit">
    </form>
</div>
<% out.println(UtilWeb.getFooter());%>
</body>
</html>