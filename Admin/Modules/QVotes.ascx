<%@ Control Language="C#" AutoEventWireup="true" CodeFile="QVotes.ascx.cs" Inherits="Admin_Modules_QVotes" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %> 


<center>
     <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
</center>

<table border="0" width="100%">
  <tr>
     <td style="text-align:right">
       Ngôn ngữ : <asp:DropDownList ID="ddlLang" DataSourceID="LangDataSource" DataTextField="C_TITLE" DataValueField="PK_LANG" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlLang_SelectedIndexChanged" ></asp:DropDownList>
     </td>
  </tr>
</table>

<asp:GridView ID="gvQVotes"  Width="100%" runat="server" DataKeyNames="PK_QVOTE" AutoGenerateColumns="False" DataSourceID="QVotesDataSource" AllowPaging="True" PageSize="20" AllowSorting="false" OnPreRender="gvQVotes_PreRender">
    <Columns>
        <asp:TemplateField>
           <ItemTemplate>
             <input name="chkQVotes" class="checkbox" type="checkbox" value="<%# Eval("PK_QVOTE") %>" />
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField>
           <ItemTemplate>
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Sửa" >
           <ItemTemplate>
              <a href="Default.aspx?ctl=QVote&fID=<%# Eval("PK_QVOTE") %>&Page=<%= gvQVotes.PageIndex %>&LangID=<%= ddlLang.SelectedValue %>"><img src="Images/Edit.png" border="0" alt="" /></a>
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="T&#234;n câu hỏi">
           <ItemTemplate>
              <a class="Link" href="Default.aspx?ctl=AVotes&pID=<%# Eval("PK_QVOTE") %>"><%# Eval("C_NAME")%></a>
           </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Thứ tự">
           <ItemTemplate>
              <%# Eval("C_ORDER") %>
           </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Tổng số lần chọn">
           <ItemTemplate>
              <%# Eval("C_HITS")%>
           </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Ngày tạo" SortExpression="C_ENTRY_DATE">
           <ItemTemplate>
              <%# Eval("C_ENTRY_DATE", "{0:dd/MM/yyyy}")%>
           </ItemTemplate>
           <ItemStyle Width="70px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Ngày bắt đầu" SortExpression="C_BEGIN_DATE">
           <ItemTemplate>
              <%# Eval("C_BEGIN_DATE","{0:dd/MM/yyyy  HH:mm}")%>
           </ItemTemplate>
           <ItemStyle Width="70px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Ngày kết thúc" SortExpression="C_END_DATE">
           <ItemTemplate>
              <%# Eval("C_END_DATE", "{0:dd/MM/yyyy  HH:mm}")%>
           </ItemTemplate>
           <ItemStyle Width="70px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Trạng th&#225;i">
           <ItemTemplate>
              <CMS:Status ID="Status1" ActiveText="Hiển thị" InActiveText="Chưa hiển thị" Value='<%# Eval("C_STATUS") %>' runat="server"></CMS:Status>
           </ItemTemplate>
           <ItemStyle Width="70px" />
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<CMS:CheckAll ID="chkMain" CssClass="Link" FieldName="chkQVotes" runat="server" />


<center>
   <asp:Button ID="btnInsert" runat="server" Text="Thêm mới" OnClick="btnInsert_Click"  />
   &nbsp;&nbsp;
   <asp:Button ID="btnDelete" runat="server" Text="Xóa bỏ"  OnClientClick="return confirm('Bạn chắc là mình muốn xóa chứ !');" OnClick="btnDelete_Click" />
   &nbsp;&nbsp;
   <asp:Button ID="btnSetStatus" runat="server" Text="Hiển thị câu hỏi" OnClick="btnSetStatus_Click"  />
   &nbsp;&nbsp;
   <asp:Button ID="btnUnSetStatus" runat="server" Text="Bỏ hiển thị câu hỏi" OnClick="btnUnSetStatus_Click"  />
</center>

<br />

<asp:SqlDataSource ID="QVotesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT T_QVOTE.*,(SELECT SUM(C_HITS) FROM T_AVOTE WHERE FK_QVOTE=T_QVOTE.PK_QVOTE) AS C_HITS FROM T_QVOTE WHERE FK_LANG=@FK_LANG ORDER BY C_ORDER DESC">
   <SelectParameters>
       <asp:ControlParameter Name="FK_LANG" ControlID="ddlLang" DefaultValue="0" Type="Int32" />
   </SelectParameters>
</asp:SqlDataSource>


<asp:SqlDataSource ID="LangDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT PK_LANG,C_TITLE FROM T_LANG"   
    >
</asp:SqlDataSource>