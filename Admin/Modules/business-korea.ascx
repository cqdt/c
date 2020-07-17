<%@ Control Language="C#" AutoEventWireup="true" CodeFile="business-korea.ascx.cs" Inherits="Admin_Modules_business_korea" %>





<center>
    <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
</center>

<br />
<table border="0" width="100%">
  <tr>
     <td align="center" bgcolor="#e4f2fe" colspan="3" height="30">
      <b>Danh sách Doanh nghiệp</b>
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
            <a href="Default.aspx?ctl=business-korea-job&fID=<%# Eval("C_MATUYENDUNG") %>">
                <%# Eval("C_MATUYENDUNG")%>
            </a>
            </ItemTemplate>
        </asp:TemplateField>
        
        <asp:TemplateField HeaderText="Tên công ty">
            <ItemTemplate>
                <%# Eval("C_TENCTY")%>
            </ItemTemplate>
        </asp:TemplateField>
       
        <asp:TemplateField HeaderText="Ngành nghề">
            <ItemTemplate>
                <%# Eval("C_NGANHNGHE")%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Địa chỉ">
            <ItemTemplate>
                <%# Eval("C_DIACHICTY")%> - <%# Eval("C_HUYEN")%> - <%# Eval("C_TINH")%>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Website">
            <ItemTemplate>
                <%# Eval("C_WEBSITE")%>
            </ItemTemplate>
        </asp:TemplateField>
          <asp:TemplateField HeaderText="Người liên hệ">
            <ItemTemplate>
                <%# Eval("C_MR")%> <%# Eval("C_NGUOILIENHE")%> 
            </ItemTemplate>
        </asp:TemplateField>
        
        <asp:TemplateField HeaderText="Chức danh">
            <ItemTemplate>
                <%# Eval("C_CHUCDANH")%>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Điện thoại">
            <ItemTemplate>
                <%# Eval("C_DTLIENHE")%>
            </ItemTemplate>
        </asp:TemplateField>

    
        
       


        <asp:TemplateField HeaderText="Email">
            <ItemTemplate>
                <%# Eval("C_EMAIL")%>
            </ItemTemplate>
        </asp:TemplateField>

       

        <asp:TemplateField HeaderText="Ngày đăng ký">
            <ItemTemplate>
                <%# Eval("C_NGAYDK", "{0:dd/MM/yyyy}")%>
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
    SelectCommand="SELECT * from T_TUYENDUNG_KR order by ID desc"></asp:SqlDataSource>