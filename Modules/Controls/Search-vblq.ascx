<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Search-vblq.ascx.cs" Inherits="Modules_Controls_Search_vblq" %>
<asp:Panel ID="pnSearchBDS" DefaultButton="btnTimkiemvb" runat="server">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td width="65" height="23">  
             
        </td>       
       
        <td width="187" align="left" valign="middle" background="Images/bg_search1.jpg" style="background-repeat:no-repeat">
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td width="13">&nbsp;</td>
                <td>
                <asp:TextBox ID="txtSearch" Width="145" runat="server" CssClass="texbox4"             
                Height="15px" BorderStyle="None" ></asp:TextBox>
                </td>
            </tr>
        </table>
           
        </td>
        <td align="left" valign="top">
             <asp:ImageButton ID="btnTimkiemvb" ImageUrl="~/Images/search.jpg" CssClass="image5"  BorderWidth="0" OnClick="btnTimkiemvb_Click" runat="server" ToolTip="Search" />
        </td>
    </tr>
    <tr>
        <td colspan="3" style="border-bottom:solid 1px #cccccc" height="15"></td>
    </tr>
   
  </table>  
  </asp:Panel> 