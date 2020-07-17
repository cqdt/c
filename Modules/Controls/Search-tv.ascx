<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Search-tv.ascx.cs" Inherits="Modules_Controls_Search_tv" %>
<asp:Panel ID="pnSearchBDS" DefaultButton="btnTimkiem" runat="server">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td></td>
        <td>&nbsp;Tiêu đề hồ sơ</td>
        <td>&nbsp;Ngành nghề</td>
        <td>&nbsp;Bằng cấp</td>
        <td width="10">&nbsp;</td>
        <td></td>
    </tr>
    <tr>
        <td width="35" height="23">  
             
        </td>        
        <td width="120" background="Images/bg_search1.jpg" style="background-repeat:no-repeat">   
        <table border="0" cellpadding="0" cellspacing="0" width="100%">         
            <tr>
                <td width="13">&nbsp;</td>
                <td>               
                    <asp:TextBox ID="txttieude" Width="100" runat="server" CssClass="texbox4"                  
                    Height="15px" BorderStyle="None" ></asp:TextBox>    
                </td>
            </tr>
        </table>
        </td>
        <td width="120" align="left" valign="middle" background="Images/bg_search1.jpg" style="background-repeat:no-repeat">
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            
            <tr>
                <td width="13">&nbsp;</td>
                <td>                
                <asp:TextBox ID="txtnganhnghe" Width="100" runat="server" CssClass="texbox4"                
                Height="15px" BorderStyle="None" ></asp:TextBox>
                </td>
            </tr>
        </table>
           
        </td>
        <td width="125" align="left" valign="middle" background="Images/bg_search1.jpg" style="background-repeat:no-repeat">
        <table border="0" cellpadding="0" cellspacing="0" width="100%">          
            <tr>
                <td width="13">&nbsp;</td>
                <td>                
                <asp:TextBox ID="txtbangcap" Width="100" runat="server" CssClass="texbox4"                
                Height="15px" BorderStyle="None" ></asp:TextBox>
                </td>
            </tr>
        </table>
           
        </td>
        <td width="10">&nbsp;</td>
        <td align="left" valign="top">
             <asp:ImageButton ID="btnTimkiem" ImageUrl="~/Images/search.jpg" CssClass="image5"  BorderWidth="0" OnClick="btnTimkiem_Click" runat="server" ToolTip="Search" />
        </td>
    </tr>
   
  </table>  
  </asp:Panel> 