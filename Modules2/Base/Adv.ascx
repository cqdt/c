<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Adv.ascx.cs" Inherits="Modules_Base_Adv" %>


<asp:DataList ID="dlAdv" runat="server" HorizontalAlign="Center" Width="100%" CaptionAlign="Top">
    <ItemTemplate> 
       <% if (Type == "LEFT")
				{ %>
				   <center>
				   <a target="_blank" href="Default.aspx?ctl=Adv&advID=<%# Eval("PK_ADV") %>">
				   <%# CMS.TTV.Web.Utils.CreateLink(Eval("C_IMAGE_FILE_NAME"), 190, 0, 0, "", true)%></a>
				  <br />
				   </center>
       <%}
				 else if (Type == "RIGHT")
				 {%>
				   <center>
				   <a href="Default.aspx?ctl=Adv&advID=<%# Eval("PK_ADV") %>">
				   <%# CMS.TTV.Web.Utils.CreateLink(Eval("C_IMAGE_FILE_NAME"), 198, 0, 0, "pic1", true)%>
				   </a>
				   </center>				    			   
				   
       <%} %>
    </ItemTemplate>
</asp:DataList>