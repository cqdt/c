<%@ Control Language="C#" AutoEventWireup="true" CodeFile="nld-dang-ky.ascx.cs" Inherits="Admin_Modules_nld_dang_ky" %>



<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %> 
<center>
    <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
</center>

<br />
<table border="0" width="100%">
  <tr>
     <td align="center" bgcolor="#e4f2fe" colspan="3" height="30">
      <b>NLD đăng ký tìm việc</b>
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
    AutoGenerateColumns="False" AllowPaging="true" PageSize="20" AllowSorting="false"
    OnRowCreated="gvList_RowCreated" DataSourceID="ListRegisterDataSource">
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
        
        <asp:TemplateField HeaderText="Họ và tên">
            <ItemTemplate>
                <%# Eval("C_HODEM")%> <%# Eval("C_TEN")%>
            </ItemTemplate><ItemStyle Width="150px" />
        </asp:TemplateField>


              <asp:TemplateField HeaderText="Mã TV">
            <ItemTemplate>
           
                <%# Eval("FK_MATV")%>
           
            </ItemTemplate><ItemStyle Width="150px" />
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Vị trí ứng tuyển">
            <ItemTemplate>
           
                <%# Eval("C_VITRI")%>
           
            </ItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Mô tả vị trí">
            <ItemTemplate>
           
                <%# Eval("C_MOTA")%>
           
            </ItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Công ty">
            <ItemTemplate>
           
                <%# Eval("C_TENCTY")%>
           
            </ItemTemplate>
        </asp:TemplateField>

       

        <asp:TemplateField HeaderText="Ngày đăng ký">
            <ItemTemplate>
                <%# Eval("C_NGAYGUI", "{0:dd/MM/yyyy}")%>
            </ItemTemplate><ItemStyle Width="80px" />
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
    &nbsp;<%--<asp:Button ID="btnExportExcel" runat="server" Text="Xuất ra file Excel" OnClick="btnExportExcel_Click" />--%>
     &nbsp;
     <asp:Button ID="btnDelete" runat="server" Text="Xóa bỏ"  OnClientClick="return confirm('Bạn chắc là mình muốn xóa chứ !');" OnClick="btnDelete_Click" />
   
</center>

<asp:SqlDataSource ID="ListRegisterDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT   T_NGUOILAODONG_TV.ID, T_NGUOILAODONG_TV.FK_MATV, T_NGUOILAODONG_TV.C_NGAYGUI, T_NGUOILAODONG.C_TEN, 
                            T_NGUOILAODONG.C_HODEM, T_TUYENDUNG_VIECLAM.C_VITRI, T_TUYENDUNG_KR.C_MATUYENDUNG, T_TUYENDUNG_KR.C_TENCTY, T_TUYENDUNG_VIECLAM.C_MOTA
                            FROM T_NGUOILAODONG INNER JOIN
                            T_NGUOILAODONG_TV ON T_NGUOILAODONG.C_MATIMVIEC = T_NGUOILAODONG_TV.FK_MATV INNER JOIN
                            T_TUYENDUNG_VIECLAM ON T_NGUOILAODONG_TV.FK_TUYENDUNGVL = T_TUYENDUNG_VIECLAM.ID INNER JOIN
                            T_TUYENDUNG_KR ON T_TUYENDUNG_VIECLAM.FK_CTY = T_TUYENDUNG_KR.C_MATUYENDUNG
                            WHERE (T_NGUOILAODONG_TV.FK_MATV = @FK_MATV)
                            ORDER BY T_NGUOILAODONG.ID DESC">
 <SelectParameters>
     <asp:QueryStringParameter Name="FK_MATV" QueryStringField="fID" DefaultValue="0" Type="String" />
   </SelectParameters>


</asp:SqlDataSource>
