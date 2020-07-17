<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Lich-cong-tac-tuan.ascx.cs" Inherits="Modules_Lich_cong_tac_tuan" %>
 <center>
 <table width="96%" border="0" cellspacing="0" cellpadding="0">
    <tr>
	 <td  valign="top" align="left" height="35" width="569" background="images/Trang_chu_24.gif" style="background-repeat:no-repeat;font-weight:bold;padding-left:40px;padding-top:8px">
		Xem lịch công tác tuần
	 </td>
    </tr>	
    <tr>
        <td>
            <asp:GridView id="gvLichs" runat="server" GridLines="None" ShowHeader="true" Width="99%"
		            AutoGenerateColumns="False" AllowPaging="True" HorizontalAlign="Center" OnPageIndexChanging="gvLichs_PageIndexChanging" CaptionAlign="Top" PageSize="4">
		            <Columns>
				            <asp:TemplateField HeaderText="Lịch" HeaderStyle-CssClass="GridHeader">
					             <ItemTemplate>					
							            <table class="tableStyleWithBgColor" border="1" bordercolor="#449ccc" cellpadding="2" cellspacing="0" width="100%">								
								            <tr>
									             <td valign="middle" align="left">
     									           <a href="Default.aspx?ctl=Chi-tiet-lich-cong-tac-tuan&lID=<%# Eval("PK_LICH") %>"> <%# Eval("C_NAME")%></a>
									             </td>									            
								             </tr>										
							            </table>							
					             </ItemTemplate>
				            </asp:TemplateField>
				            <asp:TemplateField HeaderText="Từ ngày" HeaderStyle-CssClass="GridHeader">
					             <ItemTemplate>					
							            <table class="tableStyleWithBgColor" border="1" bordercolor="#449ccc" cellpadding="2" cellspacing="0" width="100%">								
								            <tr>
									             <td valign="middle" align="center">
     									            <%# Eval("C_BEGIN","{0:dd/MM/yyyy}")%>
									             </td>									            
								             </tr>										
							            </table>							
					             </ItemTemplate>
				            </asp:TemplateField>
				             <asp:TemplateField HeaderText="Đến ngày" HeaderStyle-CssClass="GridHeader">
					             <ItemTemplate>					
							            <table class="tableStyleWithBgColor" border="1" bordercolor="#449ccc" cellpadding="2" cellspacing="0" width="100%">								
								            <tr>
									             <td valign="middle" align="center">
     									            <%# Eval("C_END", "{0:dd/MM/yyyy}")%>
									             </td>									            
								             </tr>										
							            </table>							
					             </ItemTemplate>
				            </asp:TemplateField>
				             
		            </Columns>
            </asp:GridView>
        </td>
    </tr>
 </table>
  
</center>
              