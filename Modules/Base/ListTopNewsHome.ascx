<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ListTopNewsHome.ascx.cs" Inherits="Modules_Base_ListTopNewsHome" %>
 <%@ Register Assembly="RadAjax.Net2" Namespace="Telerik.WebControls" TagPrefix="radA" %>
 <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td width="20px">&nbsp;</td>
        <td valign="top" align="left">
            <asp:GridView id="gvLinks" runat="server" GridLines="None" ShowHeader="false" 
                Width="100%" AutoGenerateColumns="False" AllowPaging="true" 
                HorizontalAlign="Center" CaptionAlign="Top" PageSize="9" 
                OnPageIndexChanging="gvLinks_PageIndexChanging">
                <Columns>
                     <asp:TemplateField ShowHeader="False">
			             <ItemTemplate>	
                              <table width="100%" border="0" cellspacing="0" cellpadding="0"> 
                                  <tr>                 
	                                <td align="left">
	                                 <% if (Type == "")
	                                    { %>	
	                                    - <a class="BArticle" href='Default.aspx?ctl=<%= Module_Detail %>&aID=<%# Eval("PK_ARTICLE")%>'><%# Eval("C_TITLE")%></a>                        
	                                    <%}
                                   else if (Type == "THONGBAO")
                                     {%> 
                                    <img src="Images/ico.jpg" width="4" height="4" /> <a class="BArticle" href='Default.aspx?ctl=<%= Module_Detail %>&aID=<%# Eval("PK_ARTICLE")%>'><%# Eval("C_TITLE")%></a>  
                                    <%# TTV.Utils.GetNew(Eval("C_ENTRY_DATE").ToString())%>                      
                                      <%} %>                                
                                    
                                   </td>
                                  </tr>                     
                            </table>
                     </ItemTemplate>
	                </asp:TemplateField>
                </Columns>
            </asp:GridView> 
        </td>
    </tr>
 </table>
 
<radA:RadAjaxManager ID="radaLinks" runat="server">
  <AjaxSettings>
      <rada:AjaxSetting AjaxControlID="gvLinks">
          <UpdatedControls>
             <rada:AjaxUpdatedControl ControlID="gvLinks" LoadingPanelID="LoadingPanel1"></rada:AjaxUpdatedControl>
          </UpdatedControls>
      </rada:AjaxSetting>
   </AjaxSettings>        
</radA:RadAjaxManager>

<rada:AjaxLoadingPanel style="width:320px;padding-top:20px;" runat="Server" id="LoadingPanel1"  InitialDelayTime="0">
   <asp:Image ID="Image1" ImageUrl="~/RadControls/AJAX/Skins/Default/loading3.gif" AlternateText="Loading" BorderWidth="0px" Runat="server"></asp:Image>
</rada:AjaxLoadingPanel>