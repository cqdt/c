<%@ Control Language="C#" AutoEventWireup="true" CodeFile="eps.ascx.cs" Inherits="Admin_Modules_eps" %>
<center>
     <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
</center>
<br />

<center>
    <a href="<%= Newwind.VQS.URL %>/admin/temp/thong tin nguoi lao dong eps.xls">Tải file mẫu</a>
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
      <b>Thông tin người lao động chương trình EPS</b>
     </td>     
  </tr> 
</table>


<asp:GridView ID="gvListRegister"  Width="100%" runat="server" DataKeyNames="PK_TINHTRANG" 
    AutoGenerateColumns="False" DataSourceID="ListRegisterDataSource" AllowPaging="True" 
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
        
        <asp:TemplateField HeaderText="CMND">
           <ItemTemplate>              
              <%# Eval("C_CMND")%>
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

        <asp:TemplateField HeaderText="Số báo danh">
           <ItemTemplate>              
              <%# Eval("C_SBD")%>
           </ItemTemplate>
        </asp:TemplateField> 

   
        <asp:TemplateField HeaderText="Tình trạng">
           <ItemTemplate>              
              <%# Eval("C_TINHTRANG")%>
           </ItemTemplate>
           <ItemStyle HorizontalAlign="Left" />
           <ItemStyle CssClass="tinhtrang" />
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
   SelectCommand="SELECT * from T_TINHTRANG_HS order by C_ORDER">    
</asp:SqlDataSource>