<%@page import="java.sql.*,java.io.*"%>
<body bgcolor="yellow">
<%
	String roll_number,dt,name,image,address,phone,email,course,certificate_no,status_code,college,cls,batch,issue_date,comment;
	roll_number=request.getParameter("roll_number");
	dt=request.getParameter("dt");
	name=request.getParameter("name");
	image=request.getParameter("image");
	address=request.getParameter("address");
	phone=request.getParameter("phone");
	email=request.getParameter("email");
	course=request.getParameter("course");
	certificate_no=request.getParameter("certificate_no");
	status_code=request.getParameter("status_code");
	college=request.getParameter("college");
	cls=request.getParameter("cls");
	batch=request.getParameter("batch");
	issue_date=request.getParameter("issue_date");
	comment=request.getParameter("comment");
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/form","root","hema@0211");
		Statement stmt=conn.createStatement();
		int i=stmt.executeUpdate("update tform set roll_number='"+roll_number+"',dt='"+dt+"',name='"+name+"',image='"+image+"',address='"+address+"',phone='"+phone+"',email='"+email+"',course='"+course+"',certificate_no='"+certificate_no+"',status_code='"+status_code+"',college='"+college+"',cls='"+cls+"',batch='"+batch+"',issue_date='"+issue_date+"',comment='"+comment+"' where roll_number='"+roll_number+"';");
		out.println("Data Updated Successfully");
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