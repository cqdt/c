<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Chi-tiet-lich-cong-tac-tuan.ascx.cs" Inherits="Modules_Chi_tiet_lich_cong_tac_tuan" %>

 <table width="98%" border="0" cellspacing="0" cellpadding="0">
    <tr>
	 <td  valign="top" align="left" height="35" width="569" background="images/Trang_chu_24.gif" style="background-repeat:no-repeat;font-weight:bold;padding-left:40px;padding-top:8px">
		 <%= title%>
	 </td>
    </tr>	
    <tr>
        <td>
        <asp:DataList ID="dlTop1News" runat="server" Width="98%" CaptionAlign="Top">
          <ItemTemplate>  
          
           <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <%# Eval("C_CONTENT")%>
                </td>
            </tr>
           </table>  
           </ItemTemplate>
        </asp:DataList>
        
         </td>
    </tr>
 </table>