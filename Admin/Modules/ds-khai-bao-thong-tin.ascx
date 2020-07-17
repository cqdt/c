<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ds-khai-bao-thong-tin.ascx.cs" Inherits="Admin_Modules_ds_khai_bao_thong_tin" %>
<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %> 



<center>
    <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
</center>

<br />
<table border="0" width="100%">
  <tr>
     <td align="center" bgcolor="#e4f2fe" colspan="3" height="30">
      <b>Danh sách khai báo thông tin người lao động tại Hàn Quốc</b>
     </td>     
  </tr> 
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>   
        <td width="20" height="60">&nbsp;</td>
        <td width="80">
            Số hộ chiếu        
        </td>    
        <td width="220">
             <asp:TextBox ID="txtsohochieu" runat="server" Width="190px"></asp:TextBox>            
        </td>
        <td width="120">
            Ngày nhập cảnh từ
        </td>    
        <td width="90">
             <radCln:RadDatePicker ID="raddNhapcanhtu" Width="89" runat="server">    
             <DateInput DateFormat="dd/MM/yyyy"> 
            </DateInput>                 
                </radCln:RadDatePicker>
        </td>
        <td width="30">
            Đến
        </td>
        <td width="190">
          <radCln:RadDatePicker ID="raddNhapcanhden" Width="89" runat="server">    
             <DateInput DateFormat="dd/MM/yyyy"> 
            </DateInput>                 
                </radCln:RadDatePicker>
        </td>


         <td width="100">
            Ngày khai báo từ
        </td>    
        <td width="90">
             <radCln:RadDatePicker ID="khaibaotu" Width="89" runat="server">    
             <DateInput DateFormat="dd/MM/yyyy"> 
            </DateInput>                 
                </radCln:RadDatePicker>
        </td>
        <td width="30">
            Đến
        </td>
        <td width="150">
          <radCln:RadDatePicker ID="khaibaoden" Width="89" runat="server">    
             <DateInput DateFormat="dd/MM/yyyy"> 
            </DateInput>                 
                </radCln:RadDatePicker>
        </td>


         <td width="150">
            Ngày khai báo cuối cùng từ
        </td>    
        <td width="90">
             <radCln:RadDatePicker ID="khaibaocuoitu" Width="89" runat="server">    
             <DateInput DateFormat="dd/MM/yyyy"> 
            </DateInput>                 
                </radCln:RadDatePicker>
        </td>
        <td width="30">
            Đến
        </td>
        <td width="110">
          <radCln:RadDatePicker ID="khaibaocuoiden" Width="89" runat="server">    
             <DateInput DateFormat="dd/MM/yyyy"> 
            </DateInput>                 
                </radCln:RadDatePicker>
        </td>


        <td><asp:Button ID="btnSearch" runat="server" Text="Tìm kiếm" 
                onclick="btnSearch_Click" /></td>
        <td align="right">
            Tổng số: <span style="font-weight: bold">
                <% =total %> bản ghi</span>
        </td>
        <td width="10">
        </td>
    </tr>



</table>



<asp:GridView ID="gvList" Width="100%" runat="server" DataKeyNames="PK_KHAIBAO"
    AutoGenerateColumns="False" AllowPaging="true" PageSize="20" AllowSorting="false"
    OnRowCreated="gvList_RowCreated" 
    onpageindexchanging="gvList_PageIndexChanging" OnRowCommand="gvList_RowCommand">
    <Columns>

          

        <asp:TemplateField HeaderText="STT">
            <ItemTemplate>
            </ItemTemplate>
            <ItemStyle Width="10px" />
        </asp:TemplateField>

         <asp:TemplateField>
           <ItemTemplate>
             <input name="chkGallerys" class="checkbox" type="checkbox" value="<%# Eval("PK_KHAIBAO") %>" />
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>  


         <asp:TemplateField HeaderText="Sửa" SortExpression="PK_KHAIBAO" >
           <ItemTemplate>
              <a href="Default.aspx?ctl=chi-tiet-khai-bao-thong-tin&aID=<%# Eval("PK_KHAIBAO") %>"><img src="Images/Edit.png" border="0" alt="" /></a>
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Word" >
           <ItemTemplate>
               <asp:Button Text="Word" runat="server" CommandName="Word" CommandArgument="<%# Container.DataItemIndex  %>" />
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>
        
        
        <asp:BoundField DataField="C_HOTEN" HeaderText="Họ tên" ItemStyle-Width="130px"/>
        <asp:BoundField DataField="C_HOCHIEU" HeaderText="Số hộ chiếu" ItemStyle-Width="80px"/>

         <asp:TemplateField HeaderText="Ngày nhập cảnh lần đầu">
            <ItemTemplate>
                <%# Eval("C_NGAYNHAPCANH")%>
            </ItemTemplate>
             <ItemStyle Width="130px" />
        </asp:TemplateField>

        <%--<asp:TemplateField HeaderText="Số CMND Việt Nam">
            <ItemTemplate>
                <%# Eval("C_CMND")%>
            </ItemTemplate>
        </asp:TemplateField>


        <asp:TemplateField HeaderText="Địa chỉ Email cá nhân">
            <ItemTemplate>
                <%# Eval("C_EMAIL")%>
            </ItemTemplate>
        </asp:TemplateField>--%>
                     

        <asp:TemplateField HeaderText="Số CMT nước ngoài">
            <ItemTemplate>
                <%# Eval("C_SOTHE")%>
            </ItemTemplate>
            <ItemStyle Width="230px" />
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Số điện thoại cá nhân">
            <ItemTemplate>
                <%# Eval("C_DIENTHOAI")%>
            </ItemTemplate>
            <ItemStyle Width="130px" />
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Số điện thoại cá nhân thay đổi(nếu có)">
            <ItemTemplate>
                <%# Eval("C_DIENTHOAI1")%>
            </ItemTemplate>
            <ItemStyle Width="130px" />
        </asp:TemplateField>

        <%--<asp:TemplateField HeaderText="Tên công ty làm việc hiện tại">
            <ItemTemplate>
                <%# Eval("C_TENDN_HIENTAI")%>
            </ItemTemplate>
        </asp:TemplateField>--%>
               
        <asp:TemplateField HeaderText="Tên công ty khai báo lần đầu">
            <ItemTemplate>
                <%# Eval("C_TENDN1")%>
            </ItemTemplate>
            <ItemStyle Width="130px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Thay đổi tên công ty lần 1(nếu có)">
            <ItemTemplate>
                <%# Eval("C_TENDN2")%>
            </ItemTemplate>
            <ItemStyle Width="130px" />
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Thay đổi tên công ty lần 1(nếu có)">
            <ItemTemplate>
                <%# Eval("C_TENDNTD")%>
            </ItemTemplate>
            <ItemStyle Width="130px" />
        </asp:TemplateField>
        <%--<asp:TemplateField HeaderText="Tên công ty thay đổi 2">
            <ItemTemplate>
                <%# Eval("C_TENDN3")%>
            </ItemTemplate>
            <ItemStyle Width="130px" />
        </asp:TemplateField>--%>
        <%--<asp:TemplateField HeaderText="Điện thoại công ty làm việc hiện tại">
            <ItemTemplate>
                <%# Eval("C_DIENTHOAIDN_HIENTAI")%>
            </ItemTemplate>
        </asp:TemplateField>--%>
        <asp:TemplateField HeaderText="Số điện thoại công ty khai báo lần đầu">
            <ItemTemplate>
                <%# Eval("C_DIENTHOAIDN1")%>
            </ItemTemplate>
            <ItemStyle Width="130px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Số điện thoại công ty thay đổi lần 1(nếu có)">
            <ItemTemplate>
                <%# Eval("C_DIENTHOAIDN2")%>
            </ItemTemplate>
            <ItemStyle Width="130px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Số điện thoại công ty thay đổi lần 2(nếu có)">
            <ItemTemplate>
                <%# Eval("C_DIENTHOAIDNTD")%>
            </ItemTemplate>
            <ItemStyle Width="130px" />
        </asp:TemplateField>
        <%--<asp:TemplateField HeaderText="Điện thoại công ty thay đổi 2">
            <ItemTemplate>
                <%# Eval("C_DIENTHOAIDN3")%>
            </ItemTemplate>
            <ItemStyle Width="130px" />
        </asp:TemplateField>--%>
        <%--<asp:TemplateField HeaderText="Địa chỉ công ty hiện tại">
            <ItemTemplate>
                <%# Eval("C_DIACHIDN_HIENTAI")%>
            </ItemTemplate>
        </asp:TemplateField>--%>
        <asp:TemplateField HeaderText="Địa chỉ công ty khai báo lần đầu">
            <ItemTemplate>
                <%# Eval("C_DIACHIDOANHNGHIEP")%>
            </ItemTemplate>
            <ItemStyle Width="230px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Địa chỉ công ty thay đổi lần 1(nếu có)">
            <ItemTemplate>
                <%# Eval("C_DIACHIDOANHNGHIEP1")%>
            </ItemTemplate>
            <ItemStyle Width="230px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Địa chỉ công ty thay đổi lần 2(nếu có)">
            <ItemTemplate>
                <%# Eval("C_DIACHIDOANHNGHIEPTD")%>
            </ItemTemplate>
            <ItemStyle Width="230px" />
        </asp:TemplateField>
        <%--<asp:TemplateField HeaderText="Địa chỉ công ty thay đổi 2">
            <ItemTemplate>
                <%# Eval("C_DIACHIDN3")%>
            </ItemTemplate>
            <ItemStyle Width="130px" />
        </asp:TemplateField>--%>
        <%--<asp:TemplateField HeaderText="Thời hạn hợp đồng">
            <ItemTemplate>
                <%# Eval("C_HOPDONGDEN")%>
            </ItemTemplate>
            <ItemStyle Width="130px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Lý do về nước">
            <ItemTemplate>
                <%# Eval("C_LYDO")%>
            </ItemTemplate>
            <ItemStyle Width="230px" />
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Ngày hết hạn lưu trú">
            <ItemTemplate>
                <%# Eval("C_NGAYHETHAN")%>
            </ItemTemplate>
            <ItemStyle Width="130px" />
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Ngày dự định về nước">
            <ItemTemplate>
                <%# Eval("C_NGAYDANGKYVENUOC")%>
            </ItemTemplate>
            <ItemStyle Width="130px" />
        </asp:TemplateField>--%>

        <asp:TemplateField HeaderText="Đổi tư cách lưu trú">
            <ItemTemplate>
                <%# Eval("C_DOITUCACHLUUTRU")%>
            </ItemTemplate>
            <ItemStyle Width="130px" />
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Ngày khai báo">
            <ItemTemplate>
                <%# Eval("C_NGAYKHAIBAODAU", "{0:dd/MM/yyyy}")%>
            </ItemTemplate><ItemStyle Width="130px" />
        </asp:TemplateField>

         <%--<asp:TemplateField HeaderText="Ngày cập nhật">
            <ItemTemplate>
                <%# Eval("C_NGAYGUI", "{0:dd/MM/yyyy}")%>
            </ItemTemplate><ItemStyle Width="130px" />
        </asp:TemplateField>--%>

        <asp:TemplateField HeaderText="Ngày khai báo cuối cùng">
            <ItemTemplate>
                <%# Eval("C_NGAYKHAIBAOCUOI", "{0:dd/MM/yyyy}")%>
            </ItemTemplate><ItemStyle Width="130px" />
        </asp:TemplateField>
              
                 

    </Columns>
</asp:GridView>
<CMS:CheckAll ID="chkMain" CssClass="Link" FieldName="chkGallerys" runat="server" />
<br />
<center>

&nbsp;<asp:Button ID="btnInsert" runat="server" Text="Thêm mới" OnClick="btnInsert_Click" />

    

    &nbsp;<asp:Button ID="tbnXoa" runat="server" Text="Xóa bản ghi"  OnClientClick="return confirm('Dữ liệu sẽ bị xóa vĩnh viễn. Bạn chắc là mình muốn xóa chứ !');"
        onclick="tbnXoa_Click"  />

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;<asp:Button ID="btnExportExcel" runat="server" Text="Xuất ra file Excel" OnClick="btnExportExcel_Click" />

        &nbsp;<asp:Button ID="tbnImport" runat="server" Text="Import từ file Excel" 
        onclick="tbnImport_Click"  />
</center>

