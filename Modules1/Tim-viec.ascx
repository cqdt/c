<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Tim-viec.ascx.cs" Inherits="Modules_Tim_viec" %>
<%@ Register Src="Base/Tim-viec.ascx" TagName="Timviec" TagPrefix="uc2" %>
<%@ Register Src="Base/Tim-viecs.ascx" TagName="Timviecs" TagPrefix="uc1" %>
<%@ Register Src="Controls/Search-tv.ascx" TagName="Timkiem" TagPrefix="uc3" %>
<%@ Register Src="Base/Article.ascx" TagName="Article" TagPrefix="uc4" %>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td height="300" align="center" valign="top" background="Images/Index2_52.jpg" style="background-repeat:no-repeat">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left" height="42" class="title_box" background="Images/Index2_21.png"> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td>Hồ sơ ứng viên</td>
                        </tr>
                         <tr>
                            <td height="10">&nbsp;</td>
                        </tr>
                    </table>
                                                           
                </td>
              </tr>
              <tr>
                <td height="40" align="center" background="Images/Index2_24.png" style="background-repeat:repeat-y">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td></td>
                                 <td  align="center" width="130">                                     
                                    <input id="Button3" type="button" value="Tìm kiếm lao động" onclick="showtd1(2);" />                             
                                </td>
                                <td width="5"></td>
                                <td  align="center" width="130">                                     
                                  <input id="Button1" type="button" value="Đăng ký tìm việc làm" onclick="showtd1(1);" />                             
                               </td>
                                <td></td>
                            </tr>
                        </table>
                    
                </td>
              </tr>
              <tr>
                <td align="center" background="Images/Index2_24.png" style="background-repeat:repeat-y" valign="top">
                  <uc1:Timviecs ID="Timviecs1" runat="server" />
                </td>
              </tr>
              <tr>
                <td height="10" background="Images/Index2_24.png" style="background-repeat:repeat-y">
                
                </td>
              </tr>
              
              <tr>
                <td height="10" background="Images/Index2_24.png" style="background-repeat:repeat-y"> 
                
                </td>
              </tr>
              <tr>
                <td id="td1" align="center" background="Images/Index2_24.png" style="background-repeat:repeat-y;display:none" valign="top">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="40"></td>
                            <td>
                                <uc4:Article ID="Article1" ArticleID="358" AutoLang="true" runat="server" />  
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" height="15">
                            
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                            <uc2:Timviec id="Timviec1" runat="server" />
                            </td>
                        </tr>
                    </table>                  
                    
                  
                </td>
              </tr>
              
             
              <tr>
                <td id="td2" align="center" background="Images/Index2_24.png" style="background-repeat:repeat-y;display:none" valign="top">                
                     <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="40"></td>
                            <td>
                                 <uc4:Article ID="Huongdan1" ArticleID="357" AutoLang="true" runat="server" /> 
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" height="15">
                            
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                            <uc3:Timkiem ID="Timkiemlaodong1" runat="server" />
                            </td>
                        </tr>
                    </table>                         
                                                        
                    
                </td>
              </tr>
              
              
              <tr>
                <td height="21" background="Images/Index2_31.png">&nbsp;</td>
              </tr>
            </table>
        </td>
    </tr>
</table>
<script language="javascript" type="text/javascript">                                             
                                            

    function showtd1(i)
            {           
                str="td"+i;                                               
                if(document.getElementById(str).style.display == "none")
                {
                    document.getElementById(str).style.display = "";                    
                    return;
                }
                
                if(document.getElementById(str).style.display == "")
                {
                    document.getElementById(str).style.display = "none";
                    return;
                }
            }          
                                       

</script>           