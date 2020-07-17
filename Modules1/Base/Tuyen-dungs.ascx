<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Tuyen-dungs.ascx.cs" Inherits="Modules_Base_Tuyen_dungs" %>
 <asp:GridView id="gvArticles" runat="server" GridLines="None" ShowHeader="false" Width="100%"
		AutoGenerateColumns="False" AllowPaging="true" HorizontalAlign="Center" CaptionAlign="Top" PageSize="10">
		<Columns>
				<asp:TemplateField ShowHeader="False">
					 <ItemTemplate>		
					        <table width="100%" border="0" cellspacing="0" cellpadding="0">
					            <tr>
					                <td width="20"></td>
					                <td width="10" align="left">
					                <img src="Images/arrow.gif" width="7" height="8" />
					                </td>
					                <td>
					                   <a class="tintuyendung" href="Default.aspx?ctl=Tin-tuyen-dung&tID=<%# Eval("PK_TUYEN_DUNG")%>"><%# Eval("C_TITLE")%>		</a>			                
					                </td>
					            </tr>
					            <tr>
					            <td width="20"></td>
					            <td width="7"></td>
					                <td class="tencongty"><%# Eval("C_TEN_CONG_TY")%></td>
					            </tr>
					        </table>					
					 </ItemTemplate>
				</asp:TemplateField>
		</Columns>
</asp:GridView> 