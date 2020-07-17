<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Tuyendungs.ascx.cs" Inherits="Admin_Modules_Tuyendungs" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %> 
<%@ Register Assembly="RadEditor.Net2" Namespace="Telerik.WebControls" TagPrefix="radE" %>
<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>
<center>
     <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
</center>
<table border="0" width="100%">
  <tr>
     <td colspan="4" align="center">
       Quản lý - Tuyển dụng
     </td>     
  </tr>
  <tr>
    <td width="150">
         Tiêu đề tin 
        <asp:TextBox ID="txtTitle" runat="server" Width="140px"></asp:TextBox>
        
    </td>
    <td width="150">
         Ngành nghề 
        <asp:TextBox ID="txtNganhnghe" runat="server" Width="140px"></asp:TextBox>
    </td>
    <td width="150">
       Địa điểm 
        <asp:TextBox ID="txtDiadiem" runat="server" Width="140px"></asp:TextBox>
       
    </td>
    <td align="left" valign="bottom">
     <asp:Button ID="btnSearch" runat="server" Text="Tìm kiếm" 
            onclick="btnSearch_Click" />
    </td>
  </tr>
</table>

<asp:GridView ID="gvListRegister"  Width="100%" runat="server" DataKeyNames="PK_TUYEN_DUNG" 
    AutoGenerateColumns="False" AllowPaging="True" 
    PageSize="20" AllowSorting="false" onrowcreated="gvListRegister_RowCreated">
    <Columns>
    <asp:TemplateField HeaderText="STT" >
           <ItemTemplate>
           </ItemTemplate>
           <ItemStyle Width="10px" />
        </asp:TemplateField >
        <asp:TemplateField HeaderText="#">
           <ItemTemplate>
             <input name="chkFAQs" class="checkbox" type="checkbox" value="<%# Eval("PK_TUYEN_DUNG") %>" />
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>
                
        <asp:TemplateField HeaderText="Tiêu đề">
           <ItemTemplate>              
              <a class="Link" href="Default.aspx?ctl=Tuyendung&fID=<%# Eval("PK_TUYEN_DUNG") %>"><%# Eval("C_TITLE")%></a>
           </ItemTemplate>
        </asp:TemplateField>            
      
         <asp:TemplateField HeaderText="Công ty">
           <ItemTemplate>
            <%# Eval("C_TEN_CONG_TY")%>              
           </ItemTemplate>
        </asp:TemplateField>
        
         <asp:TemplateField HeaderText="Điện thoại">
           <ItemTemplate>
           <%# Eval("C_PHONE")%>              
           </ItemTemplate>
        </asp:TemplateField>     
                        
         <asp:TemplateField HeaderText="Ngành nghề">
           <ItemTemplate>
            <%# Eval("C_LINH_VUC")%> 
           </ItemTemplate>
        </asp:TemplateField>  
        <asp:TemplateField HeaderText="Email liên hệ">
           <ItemTemplate>
              <%# Eval("C_EMAIL_LIEN_HE")%>              
           </ItemTemplate>
        </asp:TemplateField>  
        <asp:TemplateField HeaderText="Ngày đăng">
           <ItemTemplate>
            <%# Eval("C_NGAY_DANG", "{0:dd/MM/yyyy}")%>            
           </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Ngày hết hạn">
           <ItemTemplate>
            <%# Eval("C_HAN_NOP_HS", "{0:dd/MM/yyyy}")%>            
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
 &nbsp;
   <asp:Button ID="btnDelete" runat="server" Text="Xóa bỏ"  OnClientClick="return confirm('Bạn chắc là mình muốn xóa chứ !');" OnClick="btnDelete_Click" />
 &nbsp;
<asp:Button ID="btnExportExcel" runat="server" Text="Xuất ra file Excel" 
                onclick="btnExportExcel_Click" />
</center>

<%--<asp:SqlDataSource ID="ListRegisterDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT * from T_TUYEN_DUNG where (C_TITLE LIKE '%' + @C_TITLE + '%') and (C_LINH_VUC LIKE '%' + @C_LINH_VUC + '%')"> 
     <SelectParameters>  
       <asp:ControlParameter Name="C_TITLE" Type="String" ControlID="txtTitle" PropertyName="Text" ConvertEmptyStringToNull="False" />    
       <asp:ControlParameter Name="C_LINH_VUC" Type="String" ControlID="txtNganhnghe" PropertyName="Text" ConvertEmptyStringToNull="False" />      
    </SelectParameters>  
</asp:SqlDataSource>--%>