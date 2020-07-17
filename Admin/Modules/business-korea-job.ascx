<%@ Control Language="C#" AutoEventWireup="true" CodeFile="business-korea-job.ascx.cs" Inherits="Admin_Modules_business_korea_job" %>



<center>
    <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
</center>

<br />
<table border="0" width="100%">
  <tr>
     <td align="center" bgcolor="#e4f2fe" colspan="3" height="30">
      <b>Danh sách việc làm</b>
     </td>     
  </tr> 
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>       
        <td align="right">
            Tổng số: <span style="font-weight: bold">
                <% =total %> bản ghi</span>
        </td>
        <td width="10">
        </td>
    </tr>
</table>

<asp:GridView ID="gvList" Width="100%" runat="server" DataKeyNames="ID"
    AutoGenerateColumns="False" AllowPaging="false" PageSize="20" AllowSorting="false"
    OnRowCreated="gvList_RowCreated" DataSourceID="ListRegisterDataSource">
    <Columns>
    

        <asp:TemplateField HeaderText="STT">
            <ItemTemplate>
            </ItemTemplate>
            <ItemStyle Width="10px" />
        </asp:TemplateField>


         <asp:TemplateField>
           <ItemTemplate>
             <input name="chkAVotes" class="checkbox" type="checkbox" value="<%# Eval("ID") %>" />
           </ItemTemplate>
           <ItemStyle Width="30px" />
        </asp:TemplateField>
        
        <asp:TemplateField HeaderText="Mã tuyển dụng">
            <ItemTemplate>
                <%# Eval("FK_CTY")%>
            </ItemTemplate>
        </asp:TemplateField>
       
        <asp:TemplateField HeaderText="Vị trí">
            <ItemTemplate>
                <%# Eval("C_VITRI")%>
            </ItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Mô tả">
            <ItemTemplate>
                <%# Eval("C_MOTA")%>
            </ItemTemplate>
        </asp:TemplateField>
        
        <asp:TemplateField HeaderText="Số lượng tuyển">
            <ItemTemplate>
                <%# Eval("C_SOLUONGTUYEN")%>
            </ItemTemplate>
        </asp:TemplateField>

      <asp:TemplateField HeaderText="Kỹ năng giao tiếp tiếng Hàn">
            <ItemTemplate>
                <%# Eval("C_KYNANGGIAOTIEPTIENGHAN")%>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Nghề làm việc">
            <ItemTemplate>
                <%# Eval("C_NGHE")%>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Năm làm việc">
            <ItemTemplate>
                <%# Eval("C_NAMLAMVIEC")%>
            </ItemTemplate>
        </asp:TemplateField>

          <asp:TemplateField HeaderText="Bằng cấp">
            <ItemTemplate>
                <%# Eval("C_BANGCAP")%>
            </ItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Chi tiết">
            <ItemTemplate>
                <%# Eval("C_CHITIETBANGCAP")%>
            </ItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Độ tuổi từ">
            <ItemTemplate>
                <%# Eval("C_TUOITU")%>
            </ItemTemplate>
        </asp:TemplateField>


         <asp:TemplateField HeaderText="Đến">
            <ItemTemplate>
                <%# Eval("C_TUOIDEN")%>
            </ItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Giới tính">
            <ItemTemplate>
                <%# Eval("C_GIOITINH")%>
            </ItemTemplate>
        </asp:TemplateField>

          <asp:TemplateField HeaderText="Nơi cư trú">
            <ItemTemplate>
                <%# Eval("C_NOICUTRU")%>
            </ItemTemplate>
        </asp:TemplateField>
         

        <asp:TemplateField HeaderText="Mức lương tối thiểu">
            <ItemTemplate>
                <%# Eval("C_MUCLUONGTOITHIEU")%>
            </ItemTemplate>
        </asp:TemplateField>

          <asp:TemplateField HeaderText="Thưởng">
            <ItemTemplate>
                <%# Eval("C_THUONG")%>
            </ItemTemplate>
        </asp:TemplateField>
         <asp:TemplateField HeaderText="Theo">
            <ItemTemplate>
                <%# Eval("C_THANGQUYNAM")%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Chế độ khác">
            <ItemTemplate>
                <%# Eval("C_CHEDOKHAC")%>
            </ItemTemplate>
        </asp:TemplateField>

      

           <asp:TemplateField HeaderText="Hồ sơ dự tuyển">
            <ItemTemplate>
                <%# Eval("C_HOSO")%>
            </ItemTemplate>
        </asp:TemplateField>


         <asp:TemplateField HeaderText="Tiếp nhận hồ sơ từ">
            <ItemTemplate>
                <%# Eval("C_THOIGIANNHANTU")%>
            </ItemTemplate>
        </asp:TemplateField>

          <asp:TemplateField HeaderText="đến">
            <ItemTemplate>
                <%# Eval("C_THOIGIANNHANDEN")%>
            </ItemTemplate>
        </asp:TemplateField>

          <asp:TemplateField HeaderText="Thời gia tuyển">
            <ItemTemplate>
                <%# Eval("C_THOIGIANTUYEN")%>
            </ItemTemplate>
        </asp:TemplateField>


        <asp:TemplateField HeaderText="Ngày đăng ký">
            <ItemTemplate>
                <%# Eval("C_NGAY", "{0:dd/MM/yyyy}")%>
            </ItemTemplate><ItemStyle Width="80px" />
        </asp:TemplateField>
    </Columns>
</asp:GridView>

<br />
<center>
    &nbsp;<asp:Button ID="btnExportExcel" runat="server" Text="Xuất ra file Excel" OnClick="btnExportExcel_Click" />


     &nbsp;&nbsp;
   <asp:Button ID="btnDelete" runat="server" Text="Xóa bỏ"  OnClientClick="return confirm('Bạn chắc là mình muốn xóa chứ !');" OnClick="btnDelete_Click" />


</center>

<asp:SqlDataSource ID="ListRegisterDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT     dbo.T_DM_VITRI.C_VITRI, dbo.T_DM_NGHE.C_NGHE, dbo.T_TUYENDUNG_VIECLAM.ID, dbo.T_TUYENDUNG_VIECLAM.FK_CTY, 
                      dbo.T_TUYENDUNG_VIECLAM.C_MOTA, dbo.T_TUYENDUNG_VIECLAM.C_SOLUONGTUYEN, dbo.T_TUYENDUNG_VIECLAM.C_KYNANGGIAOTIEPTIENGHAN, 
                      dbo.T_TUYENDUNG_VIECLAM.C_BANGCAP, dbo.T_TUYENDUNG_VIECLAM.C_NAMLAMVIEC, dbo.T_TUYENDUNG_VIECLAM.C_CHITIETBANGCAP, 
                      dbo.T_TUYENDUNG_VIECLAM.C_TUOITU, dbo.T_TUYENDUNG_VIECLAM.C_TUOIDEN, dbo.T_TUYENDUNG_VIECLAM.C_GIOITINH, 
                      dbo.T_TUYENDUNG_VIECLAM.C_NOICUTRU, dbo.T_TUYENDUNG_VIECLAM.C_MUCLUONGTOITHIEU, dbo.T_TUYENDUNG_VIECLAM.C_THUONG, 
                      dbo.T_TUYENDUNG_VIECLAM.C_THANGQUYNAM, dbo.T_TUYENDUNG_VIECLAM.C_CHEDOKHAC, dbo.T_TUYENDUNG_VIECLAM.C_HOSO, 
                      dbo.T_TUYENDUNG_VIECLAM.C_THOIGIANNHANTU, dbo.T_TUYENDUNG_VIECLAM.C_THOIGIANNHANDEN, dbo.T_TUYENDUNG_VIECLAM.C_THOIGIANTUYEN, 
                      dbo.T_TUYENDUNG_VIECLAM.C_NGAY
FROM         dbo.T_TUYENDUNG_VIECLAM INNER JOIN
                      dbo.T_DM_VITRI ON dbo.T_TUYENDUNG_VIECLAM.C_VITRI = dbo.T_DM_VITRI.C_MAVT INNER JOIN
                      dbo.T_DM_NGHE ON dbo.T_TUYENDUNG_VIECLAM.C_NGHELAMVIEC = dbo.T_DM_NGHE.C_MA WHERE T_TUYENDUNG_VIECLAM.FK_CTY=@FK_CTY order by T_TUYENDUNG_VIECLAM.ID desc ">
    <SelectParameters>
     <asp:QueryStringParameter Name="FK_CTY" QueryStringField="fID" DefaultValue="0" Type="String" />
   </SelectParameters>
    
    </asp:SqlDataSource>