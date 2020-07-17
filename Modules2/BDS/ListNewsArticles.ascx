<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ListNewsArticles.ascx.cs" Inherits="Modules_BDS_ListNewsArticles" %>
<%@ Register Src="Top11NewsArticle.ascx" TagName="Top1NewsArtiles" TagPrefix="uc1" %>

<asp:DataList ID="dlListNewsHome" RepeatColumns="1" runat="server" HorizontalAlign="Center" Width="100%" CaptionAlign="Top">
    <ItemTemplate>  
        <uc1:Top1NewsArtiles ID="Top1NewsArtiles1" MenuID='<%# Eval("PK_MENU") %>' runat="server" />
    </ItemTemplate>
    <ItemStyle Width="100%" VerticalAlign="Top" />
</asp:DataList>
