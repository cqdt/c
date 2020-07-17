<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FeedBack.ascx.cs" Inherits="Modules_FeedBack" %>
<%@ Register Src="Base/FeedBack.ascx" TagName="FeedBack" TagPrefix="uc1" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td width="10"></td>
        <td>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" style="border:solid 1px #FFA401">
              <tr>  
                <td>
                <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="88" align="left">
                                <img src="Images/kgs3.jpg" width="88" height="24">
                            </td>                                   
                            <td height="24" background="Images/bg_kgs3.jpg" style="background-repeat:repeat-x" class="title">                 
                              <%= CMS.Lang.GetKey("Home.ascx", "Trang_chu")%>  &nbsp;<span style="font-size: 10px; font-weight: normal; text-decoration: none; color:#005500;">&gt;&gt;</span>&nbsp;   <%= CMS.Lang.GetKey("Home.ascx", "lien_he")%>            
                            </td>           
                          
                        </tr>
                  </table> 
                 
                </td>
              </tr>
               <tr>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td >
                   <table >
                       <tr>
                        <td style="padding-left:30px">            
                            <uc1:FeedBack ID="FeedBack2" runat="server" />
                        </td>
                       </tr>                       
                    </table>
                </td>
              </tr>
              
            </table>

        </td>
    </tr>
</table>


