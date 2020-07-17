<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Tu-nghiep-sinhs.ascx.cs" Inherits="Modules_Tu_nghiep_sinhs" %>
<%@ Register Src="Controls/Search-tns.ascx" TagName="SearchTNS" TagPrefix="uc2" %>
<%@ Register Src="Base/Tu-nghiep-sinhs.ascx" TagName="Tunghiepsinhs" TagPrefix="uc1" %>


<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td height="300" align="center" valign="top" background="Images/Index2_52.jpg" style="background-repeat:no-repeat">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left" height="42" class="title_box" background="Images/Index2_21.png"> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td>Danh sách tu nghiệp sinh hoàn thành hợp đồng về nước</td>
                        </tr>
                         <tr>
                            <td height="10">&nbsp;</td>
                        </tr>
                    </table>
                                                           
                </td>
              </tr>
              <tr>
                <td align="center" background="Images/Index2_24.png" style="background-repeat:repeat-y" valign="top">
                    <uc1:Tunghiepsinhs ID="Tunghiepsinhs1" runat="server" />
                </td>
              </tr>
               <tr>
                <td height="10" background="Images/Index2_24.png" style="background-repeat:repeat-y">
                
                </td>
              </tr>
              <tr>
                <td height="10" background="Images/Index2_24.png" style="background-repeat:repeat-y">
                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td></td>
                                <td  align="center" width="120" style="border:solid 1px #3c3c3c"><b>
                                <a style="color:#025E5D" href="#a" onclick="showtd2(1);">
                                    Tìm kiếm thông tin
                                    </a></b></td>
                                <td></td>
                            </tr>
                        </table>
                </td>
              </tr>
            
            <tr>
                <td height="18" background="Images/Index2_24.png" style="background-repeat:repeat-y"> 
                
                </td>
              </tr>
              <tr>
                <td id="td1" align="center" background="Images/Index2_24.png" style="background-repeat:repeat-y;display:none" valign="top">
                    <uc2:SearchTNS ID="timTNS1" runat="server" />
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
                                            

    function showtd2(i)
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
