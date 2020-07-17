<%@ Page Language="C#" AutoEventWireup="true" Inherits="CMS.TTV.Admin.Admin_Text_File" %>
<%@ Register Assembly="RadUpload.Net2" Namespace="Telerik.WebControls" TagPrefix="radU" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Text</title>
    <link href="../Admin/Styles/Styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
       <script type="text/javascript">
	        function CloseAndRebind(Image)
	        {
		        window.opener.refreshPage(Image);
		        window.close();
	        }
    	
	        function CancelEdit()
	        {
	            window.close();
	        }
        </script>
    <form id="form1" runat="server">
    <div>
    
       <center>
            <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
       </center>

       <center>
         Thư mục :
         <asp:DropDownList ID="ddlDir" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDir_SelectedIndexChanged">
         </asp:DropDownList>
        </center>
      
        <center>
        
         <radU:RadUpload ID="raduText" runat="server" AllowedFileExtensions=".jpg,.gif,.jepg,.png,.pdf,.txt,.doc,.xls,.swf" Skin="Office2007" MaxFileSize="10240000" TargetFolder="~/uploads/News/" Width="380px" />
        </center>
        <center>
         <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" /> 
         <br />  
         <br />
         <asp:GridView id="gvText" runat="server"  AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="gvText_PageIndexChanging"  >
            <Columns>
                <asp:TemplateField HeaderText="Chọn">
                      <ItemTemplate>
                          <a href="javascript:CloseAndRebind('<%# Eval("FileNameFull") %>')">Chọn</a>
                      </ItemTemplate>
                      <ItemStyle Width="30px" />
                </asp:TemplateField>
                <asp:BoundField DataField="FileName" SortExpression="FileName" HeaderText="T&#234;n file"></asp:BoundField>
                <asp:BoundField DataField="FileSize" SortExpression="FileSize" HeaderText="Dung lượng" DataFormatString="{0:#,##0.00} KB" HtmlEncode="False"></asp:BoundField>
                <asp:BoundField HtmlEncode="False" DataFormatString="{0:dd/MM/yyyy}" DataField="FileDate" SortExpression="FileDate" HeaderText="Ng&#224;y"></asp:BoundField>
            </Columns>
         </asp:GridView>
         <br />
         <asp:Button ID="btnCloce" OnClientClick="CancelEdit();return false;" runat="server" Text="Đóng" />
        </center>
    </div>
    </form>
</body>
</html>
