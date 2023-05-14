<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<body bgcolor="yellow">
<%
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/form", "root", "hema@0211");
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery("SELECT * FROM tform");

List<List<String>> tableData = new ArrayList<>();
while (rs.next()) {
    List<String> row = new ArrayList<>();
    row.add(rs.getString("roll_number")); 
    for (int i = 2; i <= rs.getMetaData().getColumnCount(); i++) {
        row.add(rs.getString(i));
    }
    tableData.add(row);
}

String[] rowNames ={"ID","date", "name","image","address","phone","email","course","certificate_no","status_code","college","class","batch","issue_date","comment"};

%>
<table align="center" border=1 width=400>

    <tr>
        <th style="background:cyan;">Roll Number</th> 
        <% for (List<String> row : tableData) { %>
            <td><%= row.get(0) %></td>
        <% } %>
    </tr>
    <% for (int i = 0; i < rowNames.length; i++) { %>
        <tr>
            <th style="background:cyan;"><%= rowNames[i] %></th> 
            <% for (List<String> row : tableData) { %>
                <td><%= row.get(i+1) %></td>
            <% } %>
        </tr>
    <% } %>
</table>
</body>