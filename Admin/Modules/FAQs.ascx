<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FAQs.ascx.cs" Inherits="Admin_Modules_FAQs" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %> 


<center>
     <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
</center>

<table border="0" width="100%">
  <tr>
   <td>
         Kiểu : 
         <asp:DropDownList ID="ddlType" AutoPostBack="true" runat="server">
         
				    <asp:ListItem Text="Hỏi đáp" Value="FAQ"></asp:ListItem>
				    
				 </asp:DropDownList>
     </td>
     <td style="text-align:right">
       Ngôn ngữ : <asp:DropDownList ID="ddlLang" DataSourceID="LangDataSource" DataTextField="C_TITLE" DataValueField="PK_LANG" runat="server" AutoPostBack="true" ></asp:DropDownList>
     </td>
  </tr>
</table>  

<asp:GridView ID="gvFAQs"  Width="100%" runat="server" DataKeyNames="PK_FAQ" AutoGenerateColumns="False" DataSourceID="FAQsDataSource" AllowPaging="True" PageSize="20" AllowSorting="false" OnPreRender="gvFAQs_PreRender">
    <Columns>
        <asp:TemplateField>
           <ItemTemplate>
             <input name="chkFAQs" class="checkbox" type="checkbox" value="<%# Eval("PK_FAQ") %>" />
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
              <a href="Default.aspx?ctl=FAQ&fID=<%# Eval("PK_FAQ") %>&Page=<%= gvFAQs.PageIndex %>&LangID=<%= ddlLang.SelectedValue %>&type=<%= ddlType.SelectedValue %>"><img src="Images/Edit.png" border="0" alt="" /></a>
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="T&#234;n câu hỏi">
           <ItemTemplate>
              <a class="Link" href="Default.aspx?ctl=FAQ&fID=<%# Eval("PK_FAQ") %>&Page=<%= gvFAQs.PageIndex %>&LangID=<%= ddlLang.SelectedValue %>&type=<%= ddlType.SelectedValue %>"><%# Eval("C_TITLE")%></a>
           </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Lĩnh vực">
           <ItemTemplate>
              <%# Eval("C_NAME")%>
           </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Người gửi">
           <ItemTemplate>
              <%# Eval("C_SENDER_NAME")%>
           </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Email người gửi">
           <ItemTemplate>
              <%# Eval("C_SENDER_EMAIL")%>
           </ItemTemplate>
            <ItemStyle Width="70px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Ngày gửi">
           <ItemTemplate>
              <%# Eval("C_SENDER_DATE","{0:dd/MM/yyyy}")%>
           </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Thứ tự">
           <ItemTemplate>
              <%# Eval("C_ORDER") %>
           </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Trạng th&#225;i">
           <ItemTemplate>
              <CMS:Status ID="Status1" ActiveText="Đã duyệt" InActiveText="Chờ duyệt" Value='<%# Eval("C_STATUS") %>' runat="server"></CMS:Status>
           </ItemTemplate>
           <ItemStyle Width="150px" />
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<CMS:CheckAll ID="chkMain" CssClass="Link" FieldName="chkFAQs" runat="server" />


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

<asp:SqlDataSource ID="FAQsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT t.*,T_MENU.C_NAME as C_NAME FROM T_FAQ as t,T_MENU WHERE t.FK_LANG=@FK_LANG and T_MENU.PK_MENU=t.FK_MENU AND t.C_TYPE=@C_TYPE ORDER BY t.C_ORDER DESC">
   <SelectParameters>
       <asp:ControlParameter Name="FK_LANG" ControlID="ddlLang" DefaultValue="0" Type="Int32" />
        <asp:ControlParameter Name="C_TYPE" ControlID="ddlType" DefaultValue="" Type="String" />
   </SelectParameters>
</asp:SqlDataSource>


<asp:SqlDataSource ID="LangDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT PK_LANG,C_TITLE FROM T_LANG"   
    >
</asp:SqlDataSource>