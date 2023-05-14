<html>
<%@ page import="java.sql.*,java.io.*" %>
<%!
	Connection conn;
	Statement stmt;
	ResultSet rs;
	String roll_number,dt,name,image,address,phone,email,course,certificate_no,status_code,college,cls,batch,issue_date,comment;
%>
<BODY bgcolor="yellow">
<TABLE align="center" border=1 width=400>
<TR style="background:cyan;">
	<TH>roll_number</TH>
	<TH>date</TH>
	<TH>name</TH>
	<TH>image</TH>
	<TH>address</TH>
	<TH>phone</TH>
	<TH>email</TH>
	<TH>course</TH>
	<TH>certificate_no</TH>
	<TH>status_code</TH>
	<TH>college</TH>
	<TH>class</TH>
	<TH>batch</TH>
	<TH>issue_date</TH>
	<TH>comment</TH>
</TR>
<%
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/form","root","hema@0211");
		stmt=conn.createStatement();
		roll_number=request.getParameter("roll_number");
		rs=stmt.executeQuery("select * from tform where roll_number='"+roll_number+"';");
		while(rs.next())
		{
			roll_number=rs.getString("roll_number");
			dt=rs.getString("dt");
			name=rs.getString("name");
			image=rs.getString("image");
			address=rs.getString("address");
			phone=rs.getString("phone");
			email=rs.getString("email");
			course=rs.getString("course");
			certificate_no=rs.getString("certificate_no");
			status_code=rs.getString("status_code");
			college=rs.getString("college");
			cls=rs.getString("cls");
			batch=rs.getString("batch");
			issue_date=rs.getString("issue_date");
			comment=rs.getString("comment");
			
%>
<TR>
	<TD><%=roll_number%></TD>
	<TD><%=dt%></TD>
	<TD><%=name%></TD>
	<TD><%=image%></TD>
	<TD><%=address%></TD>
	<TD><%=phone%></TD>
	<TD><%=email%></TD>
	<TD><%=course%></TD>
	<TD><%=certificate_no%></TD>
	<TD><%=status_code%></TD>
	<TD><%=college%></TD>
	<TD><%=cls%></TD>
	<TD><%=batch%></TD>
	<TD><%=issue_date%></TD>
	<TD><%=comment%></TD>
</TR>
<%
		}
		conn.close();
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
</TABLE>
</BODY>
</HTML>