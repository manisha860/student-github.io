<%@page import="java.sql.*,javax.swing.*,java.awt.*"%>
<body bgcolor="yellow">
<% 
	String roll_number;
	roll_number=request.getParameter("roll_number");
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/form","root","hema@0211");
		Statement stmt=conn.createStatement();
		int i=stmt.executeUpdate("delete from tform where roll_number='"+roll_number+"';");
		out.println("Data Deleted Successfully");
	}
	catch(ClassNotFoundException e)
	{
		out.println(e);
	}
	catch(SQLException e)
	{
		out.println(e);
	}
%>
</body>