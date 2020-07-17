<%@ Control Language="C#" AutoEventWireup="true" CodeFile="danh-sach-bao-hiem.ascx.cs" Inherits="Admin_Modules_danh_sach_bao_hiem" %>


<center>
     <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
</center>
<br />
<center>
    <a href="<%= Newwind.VQS.URL %>/admin/temp/danh sach nguoi lao dong chua nhan tien bao hiem.xls">Tải file mẫu</a>
</center>

<br />

<asp:DetailsView id="dvExcel" runat="server"
     AutoGenerateRows="False" Width="600" 
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
 <br />
<center>
<asp:Button ID="btnInsert" runat="server" Text="Cập nhật" 
    onclick="btnInsert_Click" />
<asp:Button ID="btnCancel" runat="server" Text="Huỷ bỏ" 
    onclick="btnCancel_Click" />  
    </center>
    
    <script type="text/javascript">
        function ShowForm(ctlID) {
            window.open("flash_file.aspx?Dir=Docs", "", "width=550, height=400, top=80, left=200,scrollbars=yes");
            return false;
        }
        function refreshPage(arg) {
            document.getElementById("ctl00_cphCMS_ctl00_dvExcel_txtFileName").value = arg;
        }
</script>
<br />
<br />
<table border="0" width="100%">
  <tr>
     <td align="center" bgcolor="#e4f2fe" colspan="3" height="30">
      <b>Danh sách người lao động chưa nhận tiền bảo hiểm</b>
     </td>     
  </tr> 
  <tr>
    <td align="right">
    
    <br /><br />

<asp:Button ID="btnXoa" runat="server" Text="Xóa toàn bộ" OnClientClick="return confirm('Bạn chắc là mình muốn xóa chứ !');"
    onclick="btnXoa_Click" Height="40px"/>

    <br /><br />
    </td>
  </tr>
</table>




<asp:GridView ID="gvListRegister"  Width="100%" runat="server" DataKeyNames="PK_BAOHIEM" 
    AutoGenerateColumns="False" DataSourceID="ListRegisterDataSource" AllowPaging="false" 
    PageSize="10" AllowSorting="false">
<Columns>
    <asp:TemplateField HeaderText="STT" >
           <ItemTemplate>
                <%# Eval("C_ORDER")%>
           </ItemTemplate>
           <ItemStyle Width="10px" />
        </asp:TemplateField >

        <asp:TemplateField HeaderText="Số CMT nước ngoài">
           <ItemTemplate>              
              <%# Eval("C_CMNDNN")%>
           </ItemTemplate>
        </asp:TemplateField>   

        <asp:TemplateField HeaderText="Họ và tên">
           <ItemTemplate>              
              <%# Eval("C_HOTEN")%>
           </ItemTemplate>
        </asp:TemplateField>           
               
        <asp:TemplateField HeaderText="Ngày sinh">
           <ItemTemplate>
          <%# Eval("C_NGAYSINH", "{0:dd/MM/yyyy}")%>              
           </ItemTemplate>
        </asp:TemplateField>  
        
        <asp:TemplateField HeaderText="Số hộ chiếu">
           <ItemTemplate>              
              <%# Eval("C_HOCHIEU")%>
           </ItemTemplate>
        </asp:TemplateField> 

        <asp:TemplateField HeaderText="Loại bảo hiểm">
           <ItemTemplate>              
              <%# Eval("C_LOAIBH")%>
           </ItemTemplate>
        </asp:TemplateField> 

        <asp:TemplateField HeaderText="Số xác nhận tham gia bảo hiểm">
           <ItemTemplate>              
              <%# Eval("C_SOXACNHAN")%>
           </ItemTemplate>
        </asp:TemplateField> 

         <asp:TemplateField HeaderText="Thời điểm tham gia bảo hiểm">
           <ItemTemplate>
          <%# Eval("C_THOIGIANTHAMGIA", "{0:dd/MM/yyyy}")%>              
           </ItemTemplate>
        </asp:TemplateField>  

        <asp:TemplateField HeaderText="Thời hạn kết thúc bảo hiểm">
           <ItemTemplate>
          <%# Eval("C_THOIHANKETTHUC", "{0:dd/MM/yyyy}")%>              
           </ItemTemplate>
        </asp:TemplateField>
        
        <asp:TemplateField HeaderText="Số tiền (won)">
           <ItemTemplate>              
              <%# Eval("C_SOTIEN")%>
           </ItemTemplate>
        </asp:TemplateField>  
        
        <asp:TemplateField HeaderText="Ngày về nước">
           <ItemTemplate>
          <%# Eval("C_NGAYVENUOC", "{0:dd/MM/yyyy}")%>              
           </ItemTemplate>
        </asp:TemplateField>    
        <asp:TemplateField HeaderText="Địa chỉ">
           <ItemTemplate>              
              <%# Eval("C_DIACHI")%>
           </ItemTemplate>
        </asp:TemplateField>  
          
</Columns>   
</asp:GridView>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td align="right">
            Tổng số: <span style="font-weight:bold"> <% =total %></span>
        </td>
        <td width="10"></td>
    </tr>
</table>

<asp:SqlDataSource ID="ListRegisterDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT * from T_BAOHIEM order by C_ORDER">    
</asp:SqlDataSource>