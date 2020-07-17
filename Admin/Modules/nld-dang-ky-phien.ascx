<%@ Control Language="C#" AutoEventWireup="true" CodeFile="nld-dang-ky-phien.ascx.cs" Inherits="Admin_Modules_nld_dang_ky_phien" %>



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


         <asp:TemplateField HeaderText="Công ty">
            <ItemTemplate>
           
                <%# Eval("C_CTY")%>
           
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
   
     <asp:Button ID="btnDelete" runat="server" Text="Xóa bỏ"  OnClientClick="return confirm('Bạn chắc là mình muốn xóa chứ !');" OnClick="btnDelete_Click" />
   
</center>

<asp:SqlDataSource ID="ListRegisterDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT     dbo.T_NGUOILAODONG_TV.ID, dbo.T_NGUOILAODONG_TV.FK_MATV, dbo.T_NGUOILAODONG_TV.C_NGAYGUI, dbo.T_NGUOILAODONG.C_TEN, 
                      dbo.T_NGUOILAODONG.C_HODEM, dbo.T_PHIEN_GDVL_CHITIET.C_CTY, dbo.T_PHIEN_GDVL_CHITIET.C_VITRI
FROM         dbo.T_NGUOILAODONG INNER JOIN
                      dbo.T_NGUOILAODONG_TV ON dbo.T_NGUOILAODONG.C_MATIMVIEC = dbo.T_NGUOILAODONG_TV.FK_MATV INNER JOIN
                      dbo.T_PHIEN_GDVL_CHITIET ON dbo.T_NGUOILAODONG_TV.FK_PHIEN = dbo.T_PHIEN_GDVL_CHITIET.ID
WHERE     (dbo.T_NGUOILAODONG_TV.FK_MATV = @FK_MATV)
ORDER BY dbo.T_NGUOILAODONG.ID DESC">
 <SelectParameters>
     <asp:QueryStringParameter Name="FK_MATV" QueryStringField="fID" DefaultValue="0" Type="String" />
   </SelectParameters>


</asp:SqlDataSource>
