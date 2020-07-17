<%@ Control Language="C#" AutoEventWireup="true" CodeFile="List_xuat_canh.ascx.cs" Inherits="Admin_Modules_List_xuat_canh" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %> 
<%@ Register Assembly="RadEditor.Net2" Namespace="Telerik.WebControls" TagPrefix="radE" %>
<center>
     <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
</center>
<table border="0" width="100%">
  <tr>
     <td align="center">
   Quản lý - Danh sách người lao động xuất cảnh đi làm việc tại Hàn Quốc
     </td>     
  </tr>
</table>
<asp:GridView ID="gvListLD"  Width="100%" runat="server" DataKeyNames="PK_XC" 
    AutoGenerateColumns="False" DataSourceID="ListLDsDataSource" AllowPaging="True" 
    PageSize="20" AllowSorting="false" onrowcreated="gvListLD_RowCreated">
    <Columns>
    <asp:TemplateField HeaderText="STT" >
           <ItemTemplate>
           </ItemTemplate>
           <ItemStyle Width="10px" />
        </asp:TemplateField >
        <asp:TemplateField HeaderText="#">
           <ItemTemplate>
             <input name="chkFAQs" class="checkbox" type="checkbox" value="<%# Eval("PK_XC") %>" />
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>
                
        <asp:TemplateField HeaderText="Họ và tên">
           <ItemTemplate>
              <asp:TextBox ID="txtName" BorderWidth="0" Text='<%# Eval("C_HO_TEN")%>' runat="server"></asp:TextBox>
              
           </ItemTemplate>
        </asp:TemplateField>            
        <asp:TemplateField HeaderText="Ngày sinh">
           <ItemTemplate>
           <asp:TextBox ID="txtNGaysinh" BorderWidth="0" Text='<%# Eval("C_NGAY_SINH", "{0:dd/MM/yyyy}")%>' Width="65px" runat="server"></asp:TextBox>
              
           </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Số CMND">
           <ItemTemplate>
            <asp:TextBox ID="txtCMND" BorderWidth="0" Text='<%# Eval("C_CMND")%>' Width="65px" runat="server"></asp:TextBox>
              
           </ItemTemplate>
        </asp:TemplateField>
         <asp:TemplateField HeaderText="Đơn vị">
           <ItemTemplate>
            <asp:TextBox ID="txtDonvi" BorderWidth="0" Text='<%# Eval("C_DON_VI")%>' Width="90px" runat="server"></asp:TextBox>
              
           </ItemTemplate>
        </asp:TemplateField>
        
         <asp:TemplateField HeaderText="Ngày xuất cảnh">
           <ItemTemplate>
           <asp:TextBox ID="txtNGayxc" BorderWidth="0" Text='<%# Eval("C_NGAY_XC", "{0:dd/MM/yyyy}")%>' Width="65px" runat="server"></asp:TextBox>
              
           </ItemTemplate>
        </asp:TemplateField>
        
         <asp:TemplateField HeaderText="Khoá học">
           <ItemTemplate>
            <asp:TextBox ID="txtKhoahoc" BorderWidth="0" Text='<%# Eval("C_KHOA_HOC")%>' Width="65px" runat="server"></asp:TextBox>
              
           </ItemTemplate>
        </asp:TemplateField>
         <asp:TemplateField HeaderText="Ngày tập trung">
           <ItemTemplate>
            <asp:TextBox ID="txtNGaytaptrung" BorderWidth="0" Text='<%# Eval("C_NGAY_TAP_TRUNG", "{0:dd/MM/yyyy}")%>' Width="65px" runat="server"></asp:TextBox>
              
           </ItemTemplate>
        </asp:TemplateField>
         <asp:TemplateField HeaderText="Địa điểm tập trung">
           <ItemTemplate>
                <asp:TextBox ID="txtDiadiem" BorderWidth="0" Text='<%# Eval("C_DIA_DIEM")%>' Width="65px" runat="server"></asp:TextBox>              
           </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Trạng th&#225;i" SortExpression="C_STATUS" >
           <ItemTemplate>
               <asp:RadioButtonList ID="rblKho" RepeatColumns="2" runat="server" SelectedValue='<%# Bind("C_STATUS") %>'>
                   <asp:ListItem Text="Hiện"  Selected="True" Value="True"></asp:ListItem>
                   <asp:ListItem Text="Ẩn" Value="False"></asp:ListItem>
               </asp:RadioButtonList>
           </ItemTemplate>   
           <ItemStyle Width="70px" />        
        </asp:TemplateField>               
         <asp:TemplateField HeaderText="Mã">
           <ItemTemplate>
              <asp:TextBox ID="txtSBD" BorderWidth="0" Text='<%# Eval("C_SBD")%>' Width="50px" runat="server"></asp:TextBox>              
           </ItemTemplate>
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
 <asp:Button ID="btnUpdate" runat="server" Text="Cập nhập" OnClick="btnUpdate_Click" />
 &nbsp;
   <asp:Button ID="btnDelete" runat="server" Text="Xóa bỏ"  OnClientClick="return confirm('Bạn chắc là mình muốn xóa chứ !');" OnClick="btnDelete_Click" />
</center>
<br />
<asp:DetailsView id="dvExcel" runat="server"
     AutoGenerateRows="False" Width="80%" 
     DefaultMode="Insert" HorizontalAlign="Center" 
    HeaderText="Bạn chọn file Excel" >
    <Fields>         
        <asp:TemplateField HeaderText="File Excel">
            <InsertItemTemplate>
               <asp:TextBox ID="txtFileName" Width="400px" runat="server"></asp:TextBox>
               <asp:Button ID="btnShowImage" runat="server" OnClientClick="ShowForm();return false;" Text="Chọn File" />
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Tên Sheet">
            <InsertItemTemplate>
               <asp:TextBox ID="txtSheet" Width="400px" runat="server"></asp:TextBox>               
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Import từ dòng">
            <InsertItemTemplate>
               <asp:TextBox ID="txtBRows" Width="400px" runat="server"></asp:TextBox>               
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Import đến dòng">
            <InsertItemTemplate>
               <asp:TextBox ID="txtRows" Width="400px" runat="server"></asp:TextBox>               
            </InsertItemTemplate>
        </asp:TemplateField>
       
    </Fields>
</asp:DetailsView>
<script type="text/javascript">
    function ShowForm(ctlID)
        {
           window.open("flash_file.aspx?Dir=Docs","","width=550, height=400, top=80, left=200,scrollbars=yes");
           return false;
        }
        function refreshPage(arg)
        {
           document.getElementById("ctl00_cphCMS_ctl00_dvExcel_txtFileName").value = arg;
        }
</script>
 <br />
<center>
<asp:Button ID="btnInsert" runat="server" Text="Cập nhật" 
    onclick="btnInsert_Click" />
<asp:Button ID="btnCancel" runat="server" Text="Huỷ bỏ" 
    onclick="btnCancel_Click" />  
    </center>
    
 <asp:SqlDataSource ID="ListLDsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT * FROM T_XC order by PK_XC desc">   
</asp:SqlDataSource>