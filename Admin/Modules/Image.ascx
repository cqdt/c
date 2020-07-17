<%@ Control Language="C#" AutoEventWireup="true" Inherits="CMS.TTV.Admin.Image" %>
<%@ Register Assembly="RadUpload.Net2" Namespace="Telerik.WebControls" TagPrefix="radU" %>

<center>
Thư mục :
<asp:DropDownList ID="ddlDir" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDir_SelectedIndexChanged">
</asp:DropDownList>
<br />
<radU:RadUpload ID="raduImage" runat="server" AllowedFileExtensions=".jpg,.gif,.jepg,.png" Skin="Office2007" TargetFolder="~/uploads/News/" Width="380px" />
<br />
<asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" /> 
</center>