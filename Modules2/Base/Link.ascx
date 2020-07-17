<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Link.ascx.cs" Inherits="Modules_Base_Link" %>
<%@ Register Assembly="RadAjax.Net2" Namespace="Telerik.WebControls" TagPrefix="radA" %>
<asp:GridView id="gvLinks" runat="server" GridLines="None" ShowHeader="false" 
    Width="100%" AutoGenerateColumns="False" AllowPaging="false" 
    HorizontalAlign="Center" CaptionAlign="Top" PageSize="50">
    <Columns>
        <asp:TemplateField ShowHeader="False">
			 <ItemTemplate>	
                 <a target="_blank" href='<%# Eval("C_LINK")%>'><%# CMS.TTV.Web.Utils.CreateLink(Eval("C_IMAGE_FILE_NAME"), 80, 0, 0, "linklogo", true)%></a>
			     <a target="_blank" href='<%# Eval("C_LINK")%>' class="link_01"><%# Eval("C_NAME")%></a>
			    
			 </ItemTemplate>
	    </asp:TemplateField>
    </Columns>
</asp:GridView> 
