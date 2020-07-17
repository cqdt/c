<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ds-nld-tim-viec.ascx.cs" Inherits="Admin_Modules_ds_nld_tim_viec" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %> 
<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>


<center>
    <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
</center>

<br />
<table border="0" width="100%">
  <tr>
     <td align="center" bgcolor="#e4f2fe" colspan="3" height="30">
      <b>Đăng ký tìm việc trong nước</b>
     </td>     
  </tr> 
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>    
    
        <td width="350" height="40">
            
            Hình thức ứng tuyển : 
        <asp:DropDownList ID="ddlHinhthuc" runat="server" AutoPostBack="true" Width="145"
                onselectedindexchanged="ddlHinhthuc_SelectedIndexChanged">   
            <asp:ListItem Value="" Text="Tất cả"></asp:ListItem>     
            <asp:ListItem Value="1" Text="Ứng tuyển trực tiếp"></asp:ListItem>
            <asp:ListItem Value="0" Text="Ứng tuyển qua phiên"></asp:ListItem>
        </asp:DropDownList>

        </td>

        <td width="230" id="tdphien" runat="server">
        
       Chọn phiên:
            <asp:DropDownList ID="ddlPhien" runat="server" Width="145">
            </asp:DropDownList>
            



        </td>

        <td width="250" id="tdcty" runat="server">
            Chọn công ty:
            <asp:DropDownList ID="ddlCongty" runat="server" Width="145">
            </asp:DropDownList>
        </td>


        <td id="dangkytu" runat="server" width="200px">
            Đăng ký từ

            <radCln:RadDatePicker ID="raddStart_date" Width="100px" runat="server" 
                Culture="vi-VN"></radCln:RadDatePicker>

        </td>

        <td id="dangkyden" runat="server"  width="200px">
            đến
            <radCln:RadDatePicker ID="raddEnd_date" Width="100px" runat="server" 
                Culture="vi-VN"></radCln:RadDatePicker>
        </td>

        <td>
            <asp:Button ID="btnTimkiem" runat="server" Text="Tìm kiếm" OnClick="btnTimkiem_Click" />
        </td>
      


         <td align="right">
            Tổng số: <span style="font-weight: bold">
                <% =total %></span>
        </td>
        <td width="10">
        </td>
    </tr>
</table>

<asp:GridView ID="gvList" Width="100%" runat="server" DataKeyNames="ID"
    AutoGenerateColumns="False" AllowPaging="true" PageSize="20" AllowSorting="false"
    OnRowCreated="gvList_RowCreated" 
    onpageindexchanging="gvList_PageIndexChanging">
    <Columns>
       <asp:TemplateField>
           <ItemTemplate>
             <input name="chkGallerys" class="checkbox" type="checkbox" value="<%# Eval("ID") %>" />
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>    
        <asp:TemplateField HeaderText="STT">
            <ItemTemplate>
            </ItemTemplate>
            <ItemStyle Width="10px" />
        </asp:TemplateField>
        

         <asp:TemplateField HeaderText="Ứng tuyển trực tiếp">
            <ItemTemplate>
                 <a class="Link" href="Default.aspx?ctl=nld-dang-ky&fID=<%# Eval("C_MATIMVIEC") %>">Xem  </a>
            </ItemTemplate><ItemStyle Width="70px" />
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Ứng tuyển tại phiên GDVL">
            <ItemTemplate>
                 <a class="Link" href="Default.aspx?ctl=nld-dang-ky-phien&fID=<%# Eval("C_MATIMVIEC") %>">Xem  </a>
            </ItemTemplate><ItemStyle Width="70px" />
        </asp:TemplateField>

          <asp:TemplateField HeaderText="Mã TV">
            <ItemTemplate>
           
                <%# Eval("C_MATIMVIEC")%>
              
            </ItemTemplate><ItemStyle Width="150px" />
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Họ và tên">
            <ItemTemplate>
                <%# Eval("C_HODEM")%> <%# Eval("C_TEN")%>
            </ItemTemplate><ItemStyle Width="150px" />
        </asp:TemplateField>



            

        <asp:TemplateField HeaderText="Ngày sinh">
            <ItemTemplate>
                <%# Eval("C_NGAYSINH", "{0:MM/dd/yyyy}")%>
            </ItemTemplate>
        </asp:TemplateField>


        <asp:TemplateField HeaderText="Địa chỉ">
            <ItemTemplate>
                <%# Eval("C_NOICUTRU")%>
            </ItemTemplate>
        </asp:TemplateField>
      
        

        <asp:TemplateField HeaderText="Điện thoại liên hệ">
            <ItemTemplate>
                <%# Eval("C_DIENTHOAI")%>
            </ItemTemplate>
        </asp:TemplateField>
       

      


    </Columns>
</asp:GridView>
<CMS:CheckAll ID="chkMain" CssClass="Link" FieldName="chkGallerys" runat="server" />

&nbsp;&nbsp;
Hiển thị : 
    <asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
        <asp:ListItem Value="5" Text="5"></asp:ListItem>
        <asp:ListItem Value="10" Text="10"></asp:ListItem>
        <asp:ListItem Value="20" Selected="True" Text="20"></asp:ListItem>
        <asp:ListItem Value="50" Text="50"></asp:ListItem>
        <asp:ListItem Value="1000" Text="1000"></asp:ListItem>
    </asp:DropDownList>  bản ghi / 1 trang&nbsp;<br />
<br />
<br />
<center>
    &nbsp;<asp:Button ID="btnExportExcel" runat="server" Text="Xuất ra file Excel" OnClick="btnExportExcel_Click" />
     &nbsp;
     <asp:Button ID="btnDelete" runat="server" Text="Xóa bỏ"  OnClientClick="return confirm('Bạn chắc là mình muốn xóa chứ !');" OnClick="btnDelete_Click" />
   
</center>

<asp:SqlDataSource ID="ListRegisterDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT * from T_NGUOILAODONG order by ID desc"></asp:SqlDataSource>