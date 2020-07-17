<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ket-noi-theo-nganh-nghe.ascx.cs" Inherits="Admin_Modules_ket_noi_theo_nganh_nghe" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %>

<style>
.dong{

    background-color: #86a95f;
    color: white;

}
</style>
<center>
    <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
</center>
<br />
<table border="0" width="100%" cellpadding="0" cellspacing="0">
    <tr>
     <td width="10" bgcolor="#f9cd58">
        </td>
    <td id="Td1" width="280" runat="server" bgcolor="#f9cd58">
            Lựa chọn ngành nghề:
             <asp:DropDownList ID="cboNganhngheduocdaotao" runat="server" CssClass="danhmucnghe"
                Style="width: 152px; height: 36px;">
            </asp:DropDownList>
           <%-- <asp:DropDownList ID="ddlCongty" runat="server" Width="150"  height="25">          
				    <asp:ListItem Text="--- Tất cả ---" Value=""></asp:ListItem>					    				    
				     <asp:ListItem Text="< 5,000,000 VNĐ" Value="< 5000000"></asp:ListItem>	
				     <asp:ListItem Text="6,000,000 VNĐ" Value="6000000"></asp:ListItem>	
				     <asp:ListItem Text="7,000,000 VNĐ" Value="7000000"></asp:ListItem>	
				     <asp:ListItem Text="8,000,000 VNĐ" Value="8000000"></asp:ListItem>	
				     <asp:ListItem Text="9,000,000 VNĐ" Value="9000000"></asp:ListItem>					    
				     <asp:ListItem Text="10,000,000 VNĐ" Value="10000000"></asp:ListItem>
				     <asp:ListItem Text="11,000,000 VNĐ" Value="11000000"></asp:ListItem>
				     <asp:ListItem Text="12,000,000 VNĐ" Value="12000000"></asp:ListItem>
				     <asp:ListItem Text="13,000,000 VNĐ" Value="13000000"></asp:ListItem>
				     <asp:ListItem Text="14,000,000 VNĐ" Value="14000000"></asp:ListItem>
				     <asp:ListItem Text="15,000,000 VNĐ" Value="15000000"></asp:ListItem>
				     <asp:ListItem Text="Thỏa thuận" Value="Thỏa thuận"></asp:ListItem>				          				    				  		   			
            </asp:DropDownList>--%>
        </td>
        <td bgcolor="#f9cd58">
            <asp:Button ID="btnTimkiem" runat="server" Text="    LỌC    " OnClick="btnTimkiem_Click" />
        </td>
        <td align="left" bgcolor="#f9cd58"  height="30" >
            <b>KẾT NỐI THEO TIÊU CHUẨN NGÀNH NGHỀ<asp:Label ID="Label1" runat="server" Text="" ForeColor="red"></asp:Label></b>
        </td>
    </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
 <tr>
    <td height="5px">
        </td>
        </tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0">
    
    <tr>
    <td width="10" height="30px" class="dong">
        </td>

     <td align="left" height="30px" class="dong">
      <b>   DANH SÁCH CÔNG TY ĐẠT YÊU CẦU </b>
    </td>
    
    <td align="right" height="30px" class="dong">
            Tổng số: <span style="font-weight: bold">
                <% =total %> đơn vị</span>
        </td>
        <td width="10" height="30px" class="dong">
        </td>
    </tr>
</table>
<asp:GridView ID="gvList" Width="100%" runat="server" DataKeyNames="ID" AutoGenerateColumns="False"
    AllowPaging="true" PageSize="1000" AllowSorting="false" OnRowCreated="gvList_RowCreated"
    OnPageIndexChanging="gvList_PageIndexChanging">
    <Columns>
     
        <asp:TemplateField HeaderText="STT">
            <ItemTemplate>
            </ItemTemplate>
            <ItemStyle Width="10px" />
        </asp:TemplateField>
        
         <asp:TemplateField HeaderText="Mã tuyển dụng">
            <ItemTemplate>
                <%# Eval("C_MATUYENDUNG")%>
            </ItemTemplate>
           
        </asp:TemplateField>
        
        
        <asp:TemplateField HeaderText="Công ty">
            <ItemTemplate>
                <%# Eval("C_TENCTY")%>
            </ItemTemplate>
           
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Vị trí">
            <ItemTemplate>
                <%# Eval("C_VITRI_KR")%>
                
            </ItemTemplate>
            
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Thời gian tuyển">
            <ItemTemplate>
                <%# Eval("C_THOIGIANTUYEN", "{0:MM/dd/yyyy}")%>
            </ItemTemplate>
        </asp:TemplateField>
    
        <asp:TemplateField HeaderText="Ngày gửi">
            <ItemTemplate>
                 <%# Eval("C_NGAY", "{0:MM/dd/yyyy}")%>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
 <tr>
    <td height="5px">
        </td>
        </tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0">
    
    <tr>
    <td width="10" height="30px" class="dong">
        </td>

     <td align="left" height="30px" class="dong">
      <b>   DANH SÁCH NGƯỜI LAO ĐỘNG ĐẠT YÊU CẦU </b>
    </td>
    
    <td align="right" height="30px" class="dong">
            Tổng số: <span style="font-weight: bold">
                <% =total2 %> người</span>
        </td>
        <td width="10" height="30px" class="dong">
        </td>
    </tr>
</table>
<asp:GridView ID="GridView1" Width="100%" runat="server" DataKeyNames="ID" AutoGenerateColumns="False"
    AllowPaging="true" PageSize="1000" AllowSorting="false" OnRowCreated="gvList_RowCreated1"
  >
    <Columns>
     
        <asp:TemplateField HeaderText="STT">
            <ItemTemplate>
            </ItemTemplate>
            <ItemStyle Width="10px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Mã tìm việc">
            <ItemTemplate>
                <%# Eval("C_MATIMVIEC")%>
            </ItemTemplate>
           
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Họ">
            <ItemTemplate>
                <%# Eval("C_HODEM")%>
                
            </ItemTemplate>
            
              </asp:TemplateField>
             <asp:TemplateField HeaderText="Tên">
            <ItemTemplate>
                <%# Eval("C_TEN")%>
            </ItemTemplate>
           
        </asp:TemplateField>
         <asp:TemplateField HeaderText="Ngày sinh">
            <ItemTemplate>
                <%# Eval("C_NGAYSINH")%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Điện thoại">
            <ItemTemplate>
                <%# Eval("C_DIENTHOAI")%>
                
            </ItemTemplate>           
        </asp:TemplateField>
       
    
        <asp:TemplateField HeaderText="Ngày gửi">
            <ItemTemplate>
                 <%# Eval("C_EMAIL")%>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<%--<CMS:CheckAll ID="chkMain" CssClass="Link" FieldName="chkGallerys" runat="server" />
&nbsp;&nbsp; Hiển thị :--%>
<%--<asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
    <asp:ListItem Value="5" Text="5"></asp:ListItem>
    <asp:ListItem Value="10" Text="10"></asp:ListItem>
    <asp:ListItem Value="20" Selected="True" Text="20"></asp:ListItem>
    <asp:ListItem Value="50" Text="50"></asp:ListItem>
    <asp:ListItem Value="1000" Text="1000"></asp:ListItem>
</asp:DropDownList>
bản ghi / 1 trang&nbsp;<br />
<br />
<br />
<center>
    &nbsp;<asp:Button ID="btnExportExcel" runat="server" Text="Xuất ra file Excel" OnClick="btnExportExcel_Click" />
    &nbsp;
    <%--<asp:Button ID="btnDelete" runat="server" Text="Xóa bỏ" OnClientClick="return confirm('Bạn chắc là mình muốn xóa chứ !');"
        OnClick="btnDelete_Click" />
</center>
--%>