<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Services.ascx.cs" Inherits="Admin_Modules_Services" %>
<%@ Register Assembly="CMS" Namespace="CMS.Web.Controls" TagPrefix="CMS" %>
<center>
     <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
</center>

<table border="0" width="100%">
  <tr>
     <td style="text-align:left">     
        Tiêu đề: 
        <asp:TextBox ID="txtTitle" runat="server" Width="90px"></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="Tìm kiếm" />
     </td>     
  </tr>
</table>

<asp:GridView ID="gvServices"  Width="100%" runat="server" DataKeyNames="PK_SERVICE" AutoGenerateColumns="False" DataSourceID="ServicesDataSource" AllowPaging="True" PageSize="15" AllowSorting="false">
    <Columns>
        <asp:TemplateField>
           <ItemTemplate>
             <input name="chkServices" class="checkbox" type="checkbox" value="<%# Eval("PK_SERVICE") %>" />
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>
           
                
        <asp:TemplateField HeaderText="Sửa" >
           <ItemTemplate>
              <a href="Default.aspx?ctl=Service&sID=<%# Eval("PK_SERVICE") %>&Page=<%= gvServices.PageIndex %>"><img src="Images/Edit.png" border="0" alt="" /></a>
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>
        
        <asp:TemplateField HeaderText="Tên dịch vụ">
           <ItemTemplate>
              <a class="Link" href="Default.aspx?ctl=Service&sID=<%# Eval("PK_SERVICE") %>&Page=<%= gvServices.PageIndex %>"><%# Eval("C_SERVICE_NAME")%></a>
           </ItemTemplate>
        </asp:TemplateField>
                       
        
         <asp:TemplateField HeaderText="Thời gian">
           <ItemTemplate>
             <%# Eval("C_TIME") %>
           </ItemTemplate>
        </asp:TemplateField>
        
         <asp:TemplateField HeaderText="Giá" SortExpression="C_PRICE" >
           <ItemTemplate>
              <asp:TextBox ID="txtPrice" Text='<%# Eval("C_PRICE")%>' Width="50px" runat="server"></asp:TextBox>              
              <asp:RangeValidator ID="rvPrice" runat="server" ControlToValidate="txtPrice" ErrorMessage="Giá phải là chữ số >=0" ValidationGroup="vProductsG1" MaximumValue="9999999999" MinimumValue="0" SetFocusOnError="True" Type="Double" Display="Dynamic">*</asp:RangeValidator>
              <%# Eval("C_UNIT")%>
           </ItemTemplate>
           <ItemStyle Width="100px" />
        </asp:TemplateField>
       
         <asp:TemplateField HeaderText="Quốc tịch" SortExpression="C_COUNTRY" >
           <ItemTemplate>
              <CMS:Status ID="Status1" ActiveText="Việt Nam" InActiveText="Nước ngoài" Value='<%# Eval("C_COUNTRY") %>' runat="server"></CMS:Status>
           </ItemTemplate>
           <ItemStyle Width="80px" />
        </asp:TemplateField>
        
    </Columns>
</asp:GridView>
<CMS:CheckAll ID="chkMain" CssClass="Link" FieldName="chkServices" runat="server" />

<br />
<br />
<asp:ValidationSummary ID="vsProduct" ValidationGroup="vProductsG1" ShowSummary="false" HeaderText="Vui lòng kiểm tra lại :" runat="server" ShowMessageBox="true" />  

<center>
<asp:Button ID="btnUpdate" ValidationGroup="vProductsG1" runat="server" Text="Cập nhập" OnClick="btnUpdate_Click" />
<br /><br />
   <asp:Button ID="btnInsert" runat="server" Text="Thêm mới" OnClick="btnInsert_Click"  />
   &nbsp;&nbsp;
   <asp:Button ID="btnDelete" runat="server" Text="Xóa bỏ"  OnClientClick="return confirm('Bạn chắc là mình muốn xóa chứ !');" OnClick="btnDelete_Click" />
   &nbsp;&nbsp;
  
</center>

<br />

<asp:SqlDataSource ID="ServicesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT * FROM T_SERVICE">
   
</asp:SqlDataSource>

