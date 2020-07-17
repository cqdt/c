<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SiteMap.ascx.cs" Inherits="Modules_SiteMap" %>
<%@ Register Src="Base/SiteMap.ascx" TagName="SiteMap" TagPrefix="uc1" %>

<table width="100%" cellpadding="0" cellspacing="0">
     <tr>
       <td class="id17">
		    <table width="100%" border="0" cellspacing="0" cellpadding="0">
		      <tr>
			    <td class="id18">
			       <img src="Images/arrow1.jpg" align="middle">
			    </td>
			    <td class="id19">
			         <%= CMS.Lang.GetKey("Top.ascx", "SiteMap")%>				
			    </td>
		      </tr>
		    </table>	
		    <br />								
		</td>
     </tr>
     <tr>
        <td>
            <uc1:SiteMap ID="SiteMap1" runat="server" />
        </td>
    </tr>
</table>
<br />
<br />


