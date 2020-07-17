<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Gallerys.ascx.cs" Inherits="Modules_Gallerys" %>
<%@ Register Src="Base/Gallerys.ascx" TagName="Gallerys" TagPrefix="uc1" %>
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
                                Nibelc &nbsp;<span style="font-size: 10px; font-weight: normal; text-decoration: none; color:#005500;">&gt;&gt;</span>&nbsp;    Hình ảnh hoạt động               
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
                   <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                       <tr>
                        <td align="center">            
                             <uc1:Gallerys ID="Gallerys1" MenuID="208" runat="server" />
                        </td>
                       </tr>              
                       <tr>
                        <td height="15"></td>
                       </tr>         
                    </table>
                </td>
              </tr>
              
            </table>

        </td>
    </tr>
</table>
