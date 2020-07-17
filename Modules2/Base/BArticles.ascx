<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BArticles.ascx.cs" Inherits="Modules_Base_BArticles" %>


<asp:DataList ID="dlBArticles" CellPadding="0" CellSpacing="0" Width="100%" runat="server">
    <ItemTemplate>  
     <% if (Type == "HOME")
	            { %>
	            <div class="chamvuong"></div>  
        <a class="a_other_news_home" href="<%# Newwind.VQS.GetURL("tin-tuc", Eval("C_TITLE").ToString(), Eval("PK_ARTICLE").ToString())%>"><%# Eval("C_TITLE")%>
        <%= imgnew %>
        </a>
          
     <%}
       else 
         {%>
        <div class="chamvuong"></div>  
        <a class="a_other_news_" href="<%# Newwind.VQS.GetURL("tin-tuc", Eval("C_TITLE").ToString(), Eval("PK_ARTICLE").ToString())%>"><%# Eval("C_TITLE")%></a>


                   &nbsp;<span style="color:#C89101;font-style:italic"> (<%# Eval("C_ENTRY_DATE", "{0:dd/MM/yyyy}")%>)</span>
                 
        
      <%} %>
    </ItemTemplate>
</asp:DataList>        
        
										