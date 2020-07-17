<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewImg.aspx.cs" Inherits="ViewImg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>View Images</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <center>
       <a href="#" onclick="JavaScript:window.close()">
           <img src="Image.ashx?x=0&y=0&bit=2&key=<%= img %>"  alt="" style="border:0" />
        </a>
     </center>
    </div>
    </form>
</body>
</html>
