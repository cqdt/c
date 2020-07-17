<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Top1News.ascx.cs" Inherits="Modules_BDS_Top1News" %>
<%@ Register Src="../Base/Top1News.ascx" TagName="Top1News" TagPrefix="uc1" %>
<%@ Register Src="../Base/BArticles.ascx" TagName="BArticles" TagPrefix="uc2" %>
<%= Top1News1.Title %>
<uc1:Top1News ID="Top1News1" IsParent="true" runat="server" />
<uc2:BArticles ID="BArticles1" Count="3" IsParent="true" runat="server" />
