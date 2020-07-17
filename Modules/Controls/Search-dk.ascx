<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Search-dk.ascx.cs" Inherits="Modules_Controls_Search_dk" %>
<asp:Panel ID="pnSearchBDS" DefaultButton="btnTimkiem" runat="server">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td width="35" height="23">  
             
        </td>
        
        <td width="187" background="Images/bg_search1.jpg" style="background-repeat:no-repeat">   
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td width="13">&nbsp;</td>
                <td>
                    <asp:TextBox ID="txtSBD" Width="145" runat="server" CssClass="texbox4"
                onfocus="if(this.value=='Số báo danh...') this.value='';" 
                onblur="if(this.value=='') this.value='Số báo danh...';" value="Số báo danh..."  
                Height="15px" BorderStyle="None" ></asp:TextBox>    
                </td>
            </tr>
        </table>
        </td>
        <td width="187" align="left" valign="middle" background="Images/bg_search1.jpg" style="background-repeat:no-repeat">
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td width="13">&nbsp;</td>
                <td>
                <asp:TextBox ID="txtSearch" Width="145" runat="server" CssClass="texbox4"
                onfocus="if(this.value=='Họ tên...') this.value='';" 
                onblur="if(this.value=='') this.value='Họ tên...';" value="Họ tên..."  
                Height="15px" BorderStyle="None" ></asp:TextBox>
                </td>
            </tr>
        </table>
           
        </td>
        <td align="left" valign="top">
             <asp:ImageButton ID="btnTimkiem" ImageUrl="~/Images/search.jpg" CssClass="image5"  BorderWidth="0" OnClick="btnTimkiem_Click" runat="server" ToolTip="Search" />
        </td>
    </tr>
   
  </table>  
  </asp:Panel> 