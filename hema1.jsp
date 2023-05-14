<%@page import="java.sql.*,java.io.*"%>
<%
	String roll_number=request.getParameter("roll_number");
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/form","root","hema@0211");
		Statement stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery("select * from tform where roll_number='"+roll_number+"'");
		while(rs.next())
		{
%>
		<BODY bgcolor="yellow">
		<MARQUEE bgcolor="Yellow"><STRONG><span style="color:red" >WELCOME TO GREENFOTECH</span></STRONG></MARQUEE>
		<PRE><H2><B>Application/Admission Form                                      GREENFOTECH</H2></PRE>
		<FORM METHOD="POST" ACTION="http://localhost:8080/hema.jsp">
<TABLE BORDER="1" cellspacing="0" bgcolor="white">
	<TR>
		<TD> roll_number </TD>
		<TD><INPUT TYPE="TEXT" SIZE="43" NAME="roll_number" VALUE="<%=rs.getString("roll_number")%>"></TD>
		<TD>Date</TD>
		<TD><INPUT TYPE="DATE" SIZE="20" NAME="dt" VALUE="<%=rs.getString("dt")%>"></TD>
		<TD STYLE="WIDTH:150">NO.</TD>
	</TR>

	<TR>
		<TD>Name</TD>
		<TD><INPUT TYPE="TEXT" SIZE="43" NAME="name" VALUE="<%=rs.getString("name")%>"></TD>
		<TD rowspan="2" colspan="2"><INPUT TYPE=FILE name="image" VALUE="<%=rs.getString("image")%>"></TD>
	</TR>
	
	<TR>
		<TD>Address <BR></TD>
		<TD><INPUT TYPE="TEXT" SIZE="43" NAME="address" VALUE="<%=rs.getString("address")%>"></TD>
		
	</TR>

	<TR>
		<TD> Phone </TD>
		<TD><INPUT TYPE="TEXT"  STYLE="HEIGHT:40" SIZE="43" NAME="phone" VALUE="<%=rs.getString("phone")%>"></TD>
		<TD>College:<BR>Class:<BR></TD>
		<TD><select	 name="college" style="width:180px;" VALUE="<%=rs.getString("college")%>">
			<OPTION>----Select----</OPTION>
			<OPTION >GECA</OPTION>
			<OPTION >Deogiri</OPTION>
			<OPTION >GPA</OPTION>
			<OPTION >MIT</OPTION>
			<OPTION >NIT</OPTION>
		</select><BR>
		<INPUT TYPE="TEXT" SIZE="22" NAME="cls" VALUE="<%=rs.getString("cls")%>"></TD>
		
	</TR>
	<TR>
		<TD>Email</TD>
		<TD colspan="3"><INPUT TYPE="TEXT" SIZE="82" NAME="email" VALUE="<%=rs.getString("email")%>"></TD>
		
	</TR>
	<TR>
		<TD> Course </TD>
		<TD><select	 name="course" style="width:320px;" VALUE="<%=rs.getString("course")%>">
			<OPTION>----Select----</OPTION>
			<OPTION >Java full stack</OPTION>
			<OPTION >Python</OPTION>
			<OPTION >C</OPTION>
			<OPTION >PHP</OPTION>
			<OPTION >SQL</OPTION>
			<OPTION >CSS</OPTION>
		</select></TD>
		<TD>Batch:</TD>
		<TD><INPUT TYPE="TEXT" SIZE="22" NAME="batch" VALUE="<%=rs.getString("batch")%>"></TD>
	</TR>
	<TR>
		<TD> Certificate No. </TD>
		<TD><INPUT TYPE="TEXT" SIZE="43" NAME="certificate_no" VALUE="<%=rs.getString("certificate_no")%>"></TD>
		<TD>Issue Date:</TD>
		<TD><INPUT TYPE="DATE" SIZE="23" NAME="issue_date" VALUE="<%=rs.getString("issue_date")%>"></TD>
	</TR>
	<TR>
		<TD> Status Code </TD>
		<TD colspan="3"><INPUT TYPE="TEXT" SIZE="82" NAME="status_code" VALUE="<%=rs.getString("status_code")%>"></TD>
	</TR>
	<TR>
		<TD>comment <BR></TD>
		<TD colspan="3"><INPUT TYPE="TEXT" STYLE="HEIGHT:60" SIZE="82" NAME="comment" VALUE="<%=rs.getString("comment")%>"></TD>
		
	</TR>
	<TR>
		<TD colspan="4"><INPUT TYPE="SUBMIT" VALUE="Update" >&nbsp;<INPUT TYPE="RESET" VALUE="reset" ></TD>
	</FORM>
</BODY>
</HTML>
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