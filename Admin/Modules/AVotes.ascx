<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AVotes.ascx.cs" Inherits="Admin_Modules_AVotes" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %> 


<center>
     <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
</center>

<asp:GridView ID="gvAVotes"  Width="100%" runat="server" DataKeyNames="PK_AVOTE" AutoGenerateColumns="False" DataSourceID="AVotesDataSource" AllowPaging="True" PageSize="20" AllowSorting="false" OnPreRender="gvAVotes_PreRender">
    <Columns>
        <asp:TemplateField>
           <ItemTemplate>
             <input name="chkAVotes" class="checkbox" type="checkbox" value="<%# Eval("PK_AVOTE") %>" />
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
              <a href="Default.aspx?ctl=AVote&fID=<%# Eval("PK_AVOTE") %>&Page=<%= gvAVotes.PageIndex %>&pID=<%= ParentID %>"><img src="Images/Edit.png" border="0" alt="" /></a>
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="T&#234;n câu trả lời">
           <ItemTemplate>
              <a class="Link" href="Default.aspx?ctl=AVote&fID=<%# Eval("PK_AVOTE") %>&Page=<%= gvAVotes.PageIndex %>&pID=<%= ParentID %>"><%# Eval("C_NAME")%></a>
           </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Thứ tự">
           <ItemTemplate>
              <%# Eval("C_ORDER") %>
           </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Số lần chọn">
           <ItemTemplate>
              <%# Eval("C_HITS")%>
           </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Trạng th&#225;i">
           <ItemTemplate>
              <CMS:Status ID="Status1" ActiveText="Hiển thị" InActiveText="Chưa hiển thị" Value='<%# Eval("C_STATUS") %>' runat="server"></CMS:Status>
           </ItemTemplate>
           <ItemStyle Width="70px" />
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<CMS:CheckAll ID="chkMain" CssClass="Link" FieldName="chkAVotes" runat="server" />


<center>
   <asp:Button ID="btnInsert" runat="server" Text="Thêm mới" OnClick="btnInsert_Click"  />
   &nbsp;&nbsp;
   <asp:Button ID="btnDelete" runat="server" Text="Xóa bỏ"  OnClientClick="return confirm('Bạn chắc là mình muốn xóa chứ !');" OnClick="btnDelete_Click" />
   &nbsp;&nbsp;
   <asp:Button ID="btnSetStatus" runat="server" Text="Hiển thị câu trả lời" OnClick="btnSetStatus_Click"  />
   &nbsp;&nbsp;
   <asp:Button ID="btnUnSetStatus" runat="server" Text="Bỏ hiển thị câu trả lời" OnClick="btnUnSetStatus_Click"  />
</center>

<br />

<asp:SqlDataSource ID="AVotesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT * FROM T_AVOTE WHERE FK_QVOTE=@FK_QVOTE ORDER BY C_ORDER DESC">
   <SelectParameters>
       <asp:QueryStringParameter Name="FK_QVOTE" QueryStringField="pID" Type="int32" DefaultValue="-1" />
   </SelectParameters>
</asp:SqlDataSource>
