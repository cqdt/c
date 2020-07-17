<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Tim-viecs.ascx.cs" Inherits="Admin_Modules_Tim_viecs" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %> 
<%@ Register Assembly="RadEditor.Net2" Namespace="Telerik.WebControls" TagPrefix="radE" %>
<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>
<center>
     <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
</center>
<table border="0" width="100%">
  <tr>
     <td align="center">
       Quản lý - Tìm việc
     </td>     
  </tr>
</table><br />
<table border="0" width="100%">
  <tr>
     <td style="text-align:left" width="150">      
        Tiêu đề hồ sơ 
        <asp:TextBox ID="txtTitle" runat="server" Width="140px"></asp:TextBox>                        
     </td> 
     <td width="150">
       Ngành nghề 
        <asp:TextBox ID="txtnganhnghe" runat="server" Width="140px"></asp:TextBox>
     </td>  
      <td width="150">
       Bằng cấp 
        <asp:TextBox ID="txtbangcap" runat="server" Width="140px"></asp:TextBox>
      </td> 
      <td valign="bottom" align="left">
      <asp:Button ID="btnSearch" runat="server" Text="Tìm kiếm" />
      </td>
  </tr>
</table>
<asp:GridView ID="gvListRegister"  Width="100%" runat="server" DataKeyNames="PK_TIM_VIEC" 
    AutoGenerateColumns="False" DataSourceID="ListRegisterDataSource" AllowPaging="True" 
    PageSize="20" AllowSorting="false" onrowcreated="gvListRegister_RowCreated">
    <Columns>
    <asp:TemplateField HeaderText="STT" >
           <ItemTemplate>
           </ItemTemplate>
           <ItemStyle Width="10px" />
        </asp:TemplateField >
        <asp:TemplateField HeaderText="#">
           <ItemTemplate>
             <input name="chkFAQs" class="checkbox" type="checkbox" value="<%# Eval("PK_TIM_VIEC") %>" />
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>
                
        <asp:TemplateField HeaderText="Tiêu đề">
           <ItemTemplate>              
              <a class="Link" href="Default.aspx?ctl=Tim-viec&fID=<%# Eval("PK_TIM_VIEC") %>"><%# Eval("C_TITLE")%></a>
           </ItemTemplate>
        </asp:TemplateField>            
      
         <asp:TemplateField HeaderText="Họ tên">
           <ItemTemplate>
            <%# Eval("C_HO_TEN")%>              
           </ItemTemplate>
        </asp:TemplateField>
        
         <asp:TemplateField HeaderText="Ngày sinh">
           <ItemTemplate>
            <%# Eval("C_NGAY_SINH","{0:dd/MM/yyyy}")%>              
           </ItemTemplate>
        </asp:TemplateField>
        
         <asp:TemplateField HeaderText="Điện thoại">
           <ItemTemplate>
           <%# Eval("C_DIEN_THOAI")%>              
           </ItemTemplate>
        </asp:TemplateField>     
                        
        
        <asp:TemplateField HeaderText="Email">
           <ItemTemplate>
              <%# Eval("C_EMAIL")%>              
           </ItemTemplate>
        </asp:TemplateField>  
        <asp:TemplateField HeaderText="Ngày đăng">
           <ItemTemplate>
            <%# Eval("C_NGAY_DANG", "{0:dd/MM/yyyy}")%>            
           </ItemTemplate>
        </asp:TemplateField>
       
         <asp:TemplateField HeaderText="Trạng thái" SortExpression="C_STATUS" >
           <ItemTemplate>
              <CMS:Status ID="Status1" ActiveText="Hiển thị" InActiveText="Chưa hiển thị" Value='<%# Eval("C_STATUS") %>' runat="server"></CMS:Status>
           </ItemTemplate>
           <ItemStyle Width="80px" />
        </asp:TemplateField>
        
    </Columns>
</asp:GridView>

<CMS:CheckAll ID="chkMain" CssClass="Link" FieldName="chkFAQs" runat="server" />
&nbsp;&nbsp;
Hiển thị : 
    <asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
        <asp:ListItem Value="5" Text="5"></asp:ListItem>
        <asp:ListItem Value="10" Selected="True" Text="10"></asp:ListItem>
        <asp:ListItem Value="20" Text="20"></asp:ListItem>
        <asp:ListItem Value="50" Text="50"></asp:ListItem>
        <asp:ListItem Value="100" Text="100"></asp:ListItem>
    </asp:DropDownList> 
<center>
&nbsp;
 <asp:Button ID="btnThemmoi" runat="server" Text="Thêm mới" OnClick="btnThemmoi_Click" />
 <%--&nbsp;
 <asp:Button ID="btnUpdate" runat="server" Text="Cập nhập" OnClick="btnUpdate_Click" />--%>
 &nbsp;
   <asp:Button ID="btnDelete" runat="server" Text="Xóa bỏ"  OnClientClick="return confirm('Bạn chắc là mình muốn xóa chứ !');" OnClick="btnDelete_Click" />
 &nbsp;
<asp:Button ID="btnExportExcel" runat="server" Text="Xuất ra file Excel" 
                onclick="btnExportExcel_Click" />
</center>

<asp:SqlDataSource ID="ListRegisterDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT * from T_TIM_VIEC where (C_TITLE LIKE '%' + @C_TITLE + '%') and ((C_NGANH_NGHE_MONG_MUON LIKE '%' + @C_NGANH_NGHE_MONG_MUON + '%') or (@C_NGANH_NGHE_MONG_MUON='')) and ((C_BANG_CAP LIKE '%' + @C_BANG_CAP + '%') or (@C_BANG_CAP='')) order by PK_TIM_VIEC desc">   
   <SelectParameters>      
      <asp:ControlParameter Name="C_TITLE" Type="String" ControlID="txtTitle" PropertyName="Text" ConvertEmptyStringToNull="False" />
      <asp:ControlParameter Name="C_NGANH_NGHE_MONG_MUON" Type="String" ControlID="txtnganhnghe" PropertyName="Text" ConvertEmptyStringToNull="False" />
      <asp:ControlParameter Name="C_BANG_CAP" Type="String" ControlID="txtbangcap" PropertyName="Text" ConvertEmptyStringToNull="False" />
   </SelectParameters>  
</asp:SqlDataSource>