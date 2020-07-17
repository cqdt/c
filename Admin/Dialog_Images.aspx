<%@ Page Language="C#" AutoEventWireup="true" Inherits="CMS.TTV.Admin.Article_Image" %>
<%@ Register Assembly="RadUpload.Net2" Namespace="Telerik.WebControls" TagPrefix="radU" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %> 


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Chọn nhiều ảnh</title>
		<link rel="stylesheet" type="text/css" href="../RadControls/Editor/Skins/Office2007/Dialogs.css">
		<link href="Styles/Styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
  <form id="form1" name="form1" runat="server">
    <div>   
        <center>  
         <asp:Button ID="btnSave" OnClientClick="CloseAndRebind();" runat="server" Text="Chọn" />
         <asp:Button ID="btnCloce" OnClientClick="CancelEdit();" runat="server" Text="Đóng" />
				 <br />
				 <br />
			 </center>
    </div>
    <div class="DivClass" >
		  <script language="javascript" src="../RadControls/Editor/Scripts/<%= Telerik.WebControls.RadEditor.Version.MajorMinorBuildAsUrl %>/RadWindow.js"></script>
      <script type="text/javascript">
					function GetDialogArguments()
					{
						if (window.radWindow) 
						{
							return window.radWindow.Argument;
						}
						else
						{
							return null;
						}
					}

					var isRadWindow = true;
					var radWindow = GetEditorRadWindowManager().GetCurrentRadWindow(window);
					if (radWindow)
					{ 
						if (window.dialogArguments) 
						{ 
							radWindow.Window = window;
						} 
						radWindow.OnLoad(); 
					}

					function submitLink(returnValue)
					{	
						  CloseDlg(returnValue);
					}
					
					function CloseAndRebind()
					{	
					    var	returnValue = '';
					    var url = '';
					    var Path = '../uploads/' + document.forms[0].ddlDir.value + '/';
					    
							for (i = 0; i < document.forms[0].elements.length; i++)
							 {
		             if(document.forms[0].elements[i].name == 'chkImages')
		             {
									 if(document.forms[0].elements[i].checked)
									 {
											 url = document.forms[0].elements[i].value;
											 returnValue += '<DIV><TABLE><TR><TD><A onclick=\'javascript:window.open("'+ Path + url + '","mywindow","width=400,height=400,resizable=no")\' href="'+ Path + url + '" target=mywindow><IMG src="' + Path + url + '" border=0></A></TD></TR><TR><TD align=middle><FONT face=arial color=blue size=2>' + url + '</FONT></TD></TR></TBODY></TABLE></DIV>'	;
									 }
		             }
	             }
						  CloseDlg(returnValue);
					}
					
	        function CancelEdit()
	        {
	            CloseDlg(null);
	        }
      </script>
    
				<center>
					 Thư mục :
					 <asp:DropDownList ID="ddlDir" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDir_SelectedIndexChanged">
					 </asp:DropDownList>
        </center>
      
        <center>
          <radU:RadUpload ID="raduImage" runat="server" AllowedFileExtensions=".jpg,.gif,.jepg,.png" Skin="Office2007" TargetFolder="~/uploads/News/" Width="380px" />
        </center>
        
        <center>
         <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" /> 
         <br />  
        
         <asp:GridView id="gvProImage" runat="server" PageSize="100" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="gvProImage_PageIndexChanging"  >
            <Columns>
                <asp:TemplateField HeaderText="Chọn">
                  <ItemTemplate>
                      <input name="chkImages" class="checkbox" type="checkbox" value="<%# Eval("FileName") %>" />
                  </ItemTemplate>
                  <ItemStyle Width="30px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ảnh">
								   <ItemTemplate>
											 <a href="../ViewImg.aspx?img=<%# CMS.CryptoString.Encrypt(Eval("FileNameFull").ToString()) %>" target="_blank"><%# CMS.TTV.Web.Utils.CreateLink(Eval("FileNameFull"),50,50,0,"",false) %></a>
									 </ItemTemplate>
								</asp:TemplateField>
                <asp:BoundField DataField="FileName" SortExpression="FileName" HeaderText="T&#234;n file"></asp:BoundField>
                <asp:BoundField DataField="FileSize" SortExpression="FileSize" HeaderText="Dung lượng" DataFormatString="{0:#,##0.00} KB" HtmlEncode="False"></asp:BoundField>
                <asp:BoundField HtmlEncode="False" DataFormatString="{0:dd/MM/yyyy}" DataField="FileDate" SortExpression="FileDate" HeaderText="Ng&#224;y"></asp:BoundField>
            </Columns>
         </asp:GridView>
        <CMS:CheckAll ID="chkMain" CssClass="Link" FieldName="chkImages" runat="server" />
        </center>
    </div>   
    </form>
</body>
</html>
