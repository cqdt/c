<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FAQ.ascx.cs" Inherits="Modules_Base_FAQ" %>
<%@ Register Assembly="RadAjax.Net2" Namespace="Telerik.WebControls" TagPrefix="radA" %>

<script language="javascript" type="text/javascript">                                             
                                            

    function showComment(i)
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
  
<asp:GridView id="gvFAQ" runat="server" width="100%" ShowHeader="false" GridLines="None"  
    AutoGenerateColumns="False" AllowPaging="True" HorizontalAlign="Center" OnPageIndexChanging="gvFAQ_PageIndexChanging" PageSize="15" >
    <PagerSettings FirstPageText="First" LastPageText="Last" 
        Mode="NumericFirstLast" NextPageText="Next" PageButtonCount="3" 
        PreviousPageText="Previous" />
    <Columns>
        <asp:TemplateField ShowHeader="False">
           <ItemTemplate>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" style="border-bottom:Dotted 1px #cccccc">
                    <tr>
                        <td height="5"></td>
                    </tr>
                    <tr>
                        <td valign="top" align ="left">
                        <b> Câu hỏi :</b> 
                            <a style="color:#000;text-align:justify;width:612px;float:left;" href="#a" onclick="showComment(<%# Eval("PK_FAQ")%>);">
                                <%# Eval("C_TITLE")%>
                            </a>
                       
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a style="color:#000;text-align:justify;width:612px;float:left;" href="#a" onclick="showComment(<%# Eval("PK_FAQ")%>);">
                             <b style="color:#004a89">   Câu trả lời »</b>
                            </a>
                        </td>
                    </tr>
                     <tr>
                        <td style="display:none" id="td<%# Eval("PK_FAQ")%>" valign="top" align="left">
                            <%# Eval("C_CONTENT")%>
                        </td>
                    </tr>
                    <tr>
                        <td height="5"></td>
                    </tr>
                </table>     
                                                 
            
           </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    	<PagerStyle CssClass="Gird_Page" />
</asp:GridView> 
<radA:RadAjaxManager ID="radaLinks" runat="server">
  <AjaxSettings>
      <rada:AjaxSetting AjaxControlID="gvFAQ">
          <UpdatedControls>
             <rada:AjaxUpdatedControl ControlID="gvFAQ" LoadingPanelID="LoadingPanel1"></rada:AjaxUpdatedControl>
          </UpdatedControls>
      </rada:AjaxSetting>
   </AjaxSettings>        
</radA:RadAjaxManager>

<rada:AjaxLoadingPanel style="width:320px;padding-top:20px;" runat="Server" id="LoadingPanel1"  InitialDelayTime="0">
   <asp:Image ID="Image1" ImageUrl="~/RadControls/AJAX/Skins/Default/loading3.gif" AlternateText="Loading" BorderWidth="0px" Runat="server"></asp:Image>
</rada:AjaxLoadingPanel>
