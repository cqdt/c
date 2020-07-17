<%@ Control Language="C#" AutoEventWireup="true" Inherits="CMS.TTV.Admin.Log" %>


<center>
   
   <table width="100%">
     <tr class="GridHeader">
        <td>
              Các lỗi được ghi lại 
              
        </td>
     </tr>
     <tr>
       <td class="GridItem">
            Năm : <asp:DropDownList ID="ddlY" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlY_SelectedIndexChanged">
            </asp:DropDownList>
            Tháng : <asp:DropDownList ID="ddlM" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlM_SelectedIndexChanged">
            </asp:DropDownList>
       </td>
     </tr>
     <tr class="GridAlterItem">
        <td>
               <textarea style="width: 551px; height: 442px"><%= Error %></textarea>
        </td>
     </tr>
     <tr class="GridItem">
        <td>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        </td>
     </tr>
   </table>
   
</center>


