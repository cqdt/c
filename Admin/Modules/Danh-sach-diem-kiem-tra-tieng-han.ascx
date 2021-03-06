﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Danh-sach-diem-kiem-tra-tieng-han.ascx.cs" Inherits="Admin_Modules_Danh_sach_diem_kiem_tra_tieng_han" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %> 
<%@ Register Assembly="RadEditor.Net2" Namespace="Telerik.WebControls" TagPrefix="radE" %>
<center>
     <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
</center>
<table border="0" width="100%">
  <tr>
     <td align="center" bgcolor="#e4f2fe" colspan="3">
      <b>Quản lý - Kết quả điểm kiểm tra tiếng Hàn</b>
     </td>     
  </tr> 
</table>

<asp:GridView ID="gvListRegister"  Width="100%" runat="server" DataKeyNames="PK_DANG_KY" 
    AutoGenerateColumns="False" DataSourceID="ListRegisterDataSource" AllowPaging="True" 
    PageSize="10" AllowSorting="false" onrowcreated="gvListRegister_RowCreated">
    <Columns>
    <asp:TemplateField HeaderText="STT" >
           <ItemTemplate>
           </ItemTemplate>
           <ItemStyle Width="10px" />
        </asp:TemplateField >
        <asp:TemplateField HeaderText="#">
           <ItemTemplate>
             <input name="chkFAQs" class="checkbox" type="checkbox" value="<%# Eval("PK_DANG_KY") %>" />
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>
                
        <asp:TemplateField HeaderText="Họ và tên">
           <ItemTemplate>              
              <%# Eval("C_HO_TEN")%>
           </ItemTemplate>
        </asp:TemplateField>   
               
        <asp:TemplateField HeaderText="Ngày sinh">
           <ItemTemplate>
          <%# Eval("C_NGAY_SINH", "{0:dd/MM/yyyy}")%>              
           </ItemTemplate>
        </asp:TemplateField>      
         <asp:TemplateField HeaderText="Tỉnh">
           <ItemTemplate>
           <%# Eval("C_TINH")%>              
           </ItemTemplate>
        </asp:TemplateField>     
       <asp:TemplateField HeaderText="Đơn vị">
           <ItemTemplate>
            <%# Eval("C_DON_VI")%>              
           </ItemTemplate>
        </asp:TemplateField>     
        
        <asp:TemplateField HeaderText="Ngành">
           <ItemTemplate>
            <%# Eval("C_NGANH")%>              
           </ItemTemplate>
        </asp:TemplateField>                      
         <asp:TemplateField HeaderText="SBD">
           <ItemTemplate>
            <%# Eval("C_SBD")%>              
           </ItemTemplate>
        </asp:TemplateField>  
        <asp:TemplateField HeaderText="Điểm đọc">
           <ItemTemplate>
           <%# Eval("C_DIEM_DOC")%>              
           </ItemTemplate>
        </asp:TemplateField>
        
           <asp:TemplateField HeaderText="Điểm nghe">
           <ItemTemplate>
            <%# Eval("C_DIEM_NGHE")%>              
           </ItemTemplate>
        </asp:TemplateField>
         <asp:TemplateField HeaderText="Tổng điểm">
           <ItemTemplate>
            <%# Eval("C_TONG")%>              
           </ItemTemplate>
        </asp:TemplateField>
         <asp:TemplateField HeaderText="Trạng thái">
           <ItemTemplate>
            <%# Eval("C_TRANGTHAI")%>              
           </ItemTemplate>
        </asp:TemplateField>
             
       
    </Columns>
</asp:GridView>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td align="left">
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
        </td>
        <td align="right">
            Tổng số: <span style="font-weight:bold"> <% =total %></span>
        </td>
        <td width="10"></td>
    </tr>
</table>
<br />
<center>
 &nbsp;
 
   <asp:Button ID="btnDelete" runat="server" Text="Xóa bỏ"  OnClientClick="return confirm('Bạn chắc là mình muốn xóa chứ !');" OnClick="btnDelete_Click" />
&nbsp;
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
 <br />
<center>
<asp:Button ID="btnInsert" runat="server" Text="Cập nhật" 
    onclick="btnInsert_Click" />
<asp:Button ID="btnCancel" runat="server" Text="Huỷ bỏ" 
    onclick="btnCancel_Click" />  
    </center>
    
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

<asp:SqlDataSource ID="ListRegisterDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT PK_DANG_KY,C_HO_TEN,C_NGAY_SINH,C_TINH,C_DON_VI,C_NGANH,C_SBD,C_DIEM_DOC,C_DIEM_NGHE,C_TRANGTHAI,(T_DIEM_DANG_KY_KIEM_TRA_TIENG_HAN.C_DIEM_DOC+T_DIEM_DANG_KY_KIEM_TRA_TIENG_HAN.C_DIEM_NGHE) as C_TONG from T_DIEM_DANG_KY_KIEM_TRA_TIENG_HAN order by PK_DANG_KY desc">   
   <SelectParameters>    
      
   </SelectParameters>  
</asp:SqlDataSource>