<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Danh-sach-duoc-cap-chung-chi-CE.ascx.cs" Inherits="Admin_Modules_Danh_sach_duoc_cap_chung_chi_CE" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %> 
<%@ Register Assembly="RadEditor.Net2" Namespace="Telerik.WebControls" TagPrefix="radE" %>
<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>
<center>
     <asp:Label ID="lblAlert" runat="server" Text="" ForeColor="red"></asp:Label>
</center>
<table border="0" width="100%">
  <tr>
     <td align="center">
      Quản lý - Danh sách được cấp chứng chỉ CE
     </td>     
  </tr>
</table>

<asp:GridView ID="gvListRegister"  Width="100%" runat="server" DataKeyNames="PK_CE" 
    AutoGenerateColumns="False" DataSourceID="ListRegisterDataSource" AllowPaging="True" 
    PageSize="20" AllowSorting="false" onrowcreated="gvListRegister_RowCreated">
    <Columns>
    <asp:TemplateField HeaderText="STT" >
           <ItemTemplate>
           </ItemTemplate>
           <ItemStyle Width="10px" />
        </asp:TemplateField >
        <asp:TemplateField HeaderText="#">
           <ItemTemplate>
             <input name="chkFAQs" class="checkbox" type="checkbox" value="<%# Eval("PK_CE") %>" />
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
          <%# Eval("C_NGAY_SINH", "{0:MM/dd/yyyy}")%>              
           </ItemTemplate>
        </asp:TemplateField>   
                  
        
         <asp:TemplateField HeaderText="Số hộ chiếu">
           <ItemTemplate>
           <%# Eval("C_SO_HO_CHIEU")%>              
           </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Trung tâm đào tạo">
           <ItemTemplate>
            <%# Eval("C_TRUNG_TAM_DT")%>              
           </ItemTemplate>
        </asp:TemplateField>
         <asp:TemplateField HeaderText="Số chứng chỉ">
           <ItemTemplate>
            <%# Eval("C_SO_CHUNG_CHI")%>              
           </ItemTemplate>
        </asp:TemplateField>
       
        <asp:TemplateField HeaderText="Ngày cấp">
           <ItemTemplate>
            <%# Eval("C_NGAY_CAP", "{0:MM/dd/yyyy}")%>            
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
<center>

 &nbsp;
   <asp:Button ID="btnDelete" runat="server" Text="Xóa bỏ"  OnClientClick="return confirm('Bạn chắc là mình muốn xóa chứ !');" OnClick="btnDelete_Click" />
&nbsp;
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
    onclick="btnInsert_Click" style="height: 26px" />
<asp:Button ID="btnCancel" runat="server" Text="Huỷ bỏ" 
    onclick="btnCancel_Click" />  
    </center>
    
<asp:SqlDataSource ID="ListRegisterDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT * from T_CAP_CE">   
</asp:SqlDataSource>