<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Thong-ke-TNS.ascx.cs" Inherits="Admin_Modules_Thong_ke_TNS" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %> 
<%@ Register Assembly="RadEditor.Net2" Namespace="Telerik.WebControls" TagPrefix="radE" %>
<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>
<center>
     <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
</center>
<table border="0" width="100%">
  <tr>
     <td align="center"><b>
           Thống kê - Danh sách tu nghiệp sinh tại Nhật</b>
     </td>     
  </tr>
</table>

<asp:GridView ID="gvListRegister"  Width="100%" runat="server" DataKeyNames="PK_TNS" 
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
             <input name="chkFAQs" class="checkbox" type="checkbox" value="<%# Eval("PK_TNS") %>" />
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>
                
        <asp:TemplateField HeaderText="Họ tên">
           <ItemTemplate>              
              <a class="Link" href="Default.aspx?ctl=Tu-nghiep-sinh&fID=<%# Eval("PK_TNS") %>"><%# Eval("C_HO_TEN")%></a>
           </ItemTemplate>
        </asp:TemplateField>          
      
       
        
         <asp:TemplateField HeaderText="Ngày sinh">
           <ItemTemplate>
            <%# Eval("C_NGAY_SINH","{0:MM/dd/yyyy}")%>              
           </ItemTemplate>
        </asp:TemplateField>
        
         <asp:TemplateField HeaderText="Giới tính">
           <ItemTemplate>
           <%# Eval("C_GIOI_TINH")%>              
           </ItemTemplate>
        </asp:TemplateField>     
                        
        
        <asp:TemplateField HeaderText="Địa chỉ">
           <ItemTemplate>
              <%# Eval("C_DIA_CHI")%>              
           </ItemTemplate>
        </asp:TemplateField>  
        <asp:TemplateField HeaderText="Nghề nghiệp">
           <ItemTemplate>
              <%# Eval("C_NGHE_NGHIEP")%>              
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
    
        <br />
        <center> 
&nbsp;<asp:Button ID="btnExportExcel" runat="server" Text="Xuất ra file Excel" 
                onclick="btnExportExcel_Click" />
</center>
<asp:SqlDataSource ID="ListRegisterDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT * from T_TNS order by PK_TNS desc">   
</asp:SqlDataSource>