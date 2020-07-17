<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ListNewsHome.ascx.cs" Inherits="Modules_BDS_ListNewsHome" %>
<%@ Register Src="Top1News.ascx" TagName="Top1News" TagPrefix="uc1" %>

<asp:DataList ID="dlListNewsHome" RepeatColumns="2" runat="server" HorizontalAlign="Center" Width="100%" CaptionAlign="Top" RepeatDirection="Horizontal">
    <ItemTemplate>  
        <uc1:Top1News ID="Top1News1" MenuID='<%# Eval("PK_MENU") %>' runat="server" />
    </ItemTemplate>
    <ItemStyle Width="50%" VerticalAlign="Top" />
</asp:DataList>
