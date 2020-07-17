<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Search-tns.ascx.cs" Inherits="Modules_Controls_Search_tns" %>
<asp:Panel ID="pnSearchBDS" DefaultButton="btnTimkiem" runat="server">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td></td>
        <td>&nbsp;Nghề nghiệp</td>
        <td>&nbsp;Bằng cấp</td>
        <td>&nbsp;Kinh nghiệm</td>
        <td>&nbsp;Giới tính</td>
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
                    <asp:TextBox ID="txtnghenghiep" Width="100" runat="server" CssClass="texbox4"                  
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
                <asp:TextBox ID="txtbangcap" Width="100" runat="server" CssClass="texbox4"                
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
                <asp:TextBox ID="txtkinhnghiem" Width="100" runat="server" CssClass="texbox4"                
                Height="15px" BorderStyle="None" ></asp:TextBox>
                </td>
            </tr>
        </table>
           
        </td>
        <td width="65" align="left" valign="middle">
        <table border="0" cellpadding="0" cellspacing="0" width="100%">          
            <tr>
                <td width="3">&nbsp;</td>
                <td>                
                    <asp:DropDownList Width="50px" ID="ddlGioitinh" runat="server">
				        <asp:ListItem Text="Nam" Value="nam"></asp:ListItem>
				        <asp:ListItem Text="Nữ" Value="nữ"></asp:ListItem>				   
				    </asp:DropDownList>
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