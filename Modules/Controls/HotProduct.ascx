<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HotProduct.ascx.cs" Inherits="Modules_Controls_HotProduct" %>
<center>
 <table width="100%" border="0" cellspacing="0" cellpadding="0">
 <tr>
    <td>
  <asp:DataList ID="dlProducts" CellPadding="0" CellSpacing="0" Width="100%" runat="server" HorizontalAlign="Left" CaptionAlign="Top" RepeatDirection="Horizontal">
      <ItemTemplate>                
          
          
        <table border="0" cellpadding="0" cellspacing="0" width="150px">
        <tr>		
          <td valign="top" width="100%">
            <table style="border-collapse: collapse;" border="0" cellpadding="0" cellspacing="0" width="100%">
					      <tr>
						      <td align="center" height="130">
							      <a href="Default.aspx?ctl=Product&pID=<%# Eval("FK_MENU") %>&aID=<%# Eval("PK_PRODUCT") %>">
							      <%# CMS.TTV.Web.Utils.CreateLink(Eval("C_IMAGE_FILE_NAME"), 88, 0, 0, "", false)%></a>
						      </td>
					      </tr>
					      <tr>
						      <td >	
							      <div style="height: 30px; text-align: center; padding-left: 3px; padding-right: 3px;">
                                            <a class="tieu_de_tin" href="Default.aspx?ctl=Product&pID=<%# Eval("FK_MENU") %>&aID=<%# Eval("PK_PRODUCT") %>"><%# Eval("C_TITLE") %></a>
							        <%# TTV.Utils.GetVip(Eval("C_HOT"))%>
							      </div>
						      </td>
					      </tr>
					    <%--  <tr>
						      <td style="font-weight: bold; font-family: Tahoma; font-size: 12px; color: rgb(255, 51, 0); padding-bottom: 3px;">
								      <div align="center"><%# Eval("C_PRICE","{0:#,##0}") %>&nbsp;&nbsp;<%# Eval("C_UNIT") %></div>
						      </td>
					      </tr>		--%>			     
				      </table>
			    </td>
			  </tr>
			</table>	
          
          
      </ItemTemplate>
  </asp:DataList>
  
   </td> 
 </table>
</center>

