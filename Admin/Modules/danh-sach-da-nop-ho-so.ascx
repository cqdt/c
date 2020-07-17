<%@ Control Language="C#" AutoEventWireup="true" CodeFile="danh-sach-da-nop-ho-so.ascx.cs" Inherits="Admin_Modules_danh_sach_da_nop_ho_so" %>


<center>
     <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
</center>
<br />
<center>
    <a href="<%= Newwind.VQS.URL %>/admin/temp/danh-sach-nguoi-lao-dong-da-nop-ho-so.xls">Tải file mẫu</a>
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
      <b>Danh sách người lao động đã nộp hồ sơ</b>
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


<asp:GridView ID="gvListRegister"  Width="100%" runat="server" DataKeyNames="PK_HOSO" 
    AutoGenerateColumns="False" DataSourceID="ListRegisterDataSource" AllowPaging="false" 
    PageSize="10" AllowSorting="false">
<Columns>
    <asp:TemplateField HeaderText="STT" >
           <ItemTemplate>
                <%# Eval("C_ORDER")%>
           </ItemTemplate>
           <ItemStyle Width="10px" />
        </asp:TemplateField >

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
                

        <asp:TemplateField HeaderText="Số CMT người nước ngoài tại Hàn Quốc">
           <ItemTemplate>              
              <%# Eval("C_CMNDNN")%>
           </ItemTemplate>
        </asp:TemplateField>  
        
       

        <asp:TemplateField HeaderText="Địa chỉ của người lao động">
           <ItemTemplate>              
              <%# Eval("C_DIACHI")%>
           </ItemTemplate>
        </asp:TemplateField> 

        <asp:TemplateField HeaderText="Số tiền nhận khi Hồi hương">
           <ItemTemplate>              
              <%# Eval("C_HOIHUONG")%>
           </ItemTemplate>
        </asp:TemplateField> 
                 
        
        <asp:TemplateField HeaderText="Số tiền nhận khi Mãn hạn xuất cảnh">
           <ItemTemplate>              
              <%# Eval("C_HANXUATCANH")%>
           </ItemTemplate>
        </asp:TemplateField>  
        
         <asp:TemplateField HeaderText="Thời gian gửi hồ sơ sang Hàn Quốc">
           <ItemTemplate>              
              <%# Eval("C_THOIGIANGUIHS")%>
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
   SelectCommand="SELECT * from T_NOP_HOSO order by C_ORDER">    
</asp:SqlDataSource>