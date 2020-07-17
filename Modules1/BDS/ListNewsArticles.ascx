<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ListNewsArticles.ascx.cs" Inherits="Modules_BDS_ListNewsArticles" %>
<%@ Register Src="Top11NewsArticle.ascx" TagName="Top1NewsArtiles" TagPrefix="uc1" %>
<%--
<asp:DataList ID="dlListNewsHome" RepeatColumns="1" runat="server" HorizontalAlign="Center" Width="100%" CaptionAlign="Top">
    <ItemTemplate> --%> 
        
        
        <uc1:Top1NewsArtiles ID="Top1NewsArtiles1" MenuID='357' runat="server" />
        <br />
        <uc1:Top1NewsArtiles ID="Top1NewsArtiles2" MenuID='358' runat="server" />
          <br />
        <uc1:Top1NewsArtiles ID="Top1NewsArtiles3" MenuID='382' runat="server" />
         <br />
        <uc1:Top1NewsArtiles ID="Top1NewsArtiles7" MenuID='465' runat="server" />
          <br />
        <uc1:Top1NewsArtiles ID="Top1NewsArtiles4" MenuID='401' runat="server" />
        <br />
        <uc1:Top1NewsArtiles ID="Top1NewsArtiles6" MenuID='386' runat="server" />        
        <br />
        <uc1:Top1NewsArtiles ID="Top1NewsArtiles5" MenuID='360' runat="server" />
        
    <%--</ItemTemplate>
    <ItemStyle Width="100%" VerticalAlign="Top" />
</asp:DataList>
--%>