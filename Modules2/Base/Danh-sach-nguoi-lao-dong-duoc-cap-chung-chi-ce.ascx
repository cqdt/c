
<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Danh-sach-nguoi-lao-dong-duoc-cap-chung-chi-ce.ascx.cs" Inherits="Modules_Base_Danh_sach_nguoi_lao_dong_duoc_cap_chung_chi_ce" %>
<asp:GridView id="gvArticles" runat="server" ShowHeader="true" Width="100%"
		AutoGenerateColumns="False" AllowPaging="True" HorizontalAlign="Center" onrowcreated="gvArticles_RowCreated"
    CaptionAlign="Top" PageSize="20" SkinID="Luoi">
		<PagerSettings FirstPageText="First" LastPageText="Last" 
            Mode="NumericFirstLast" NextPageText="Next" PageButtonCount="5" 
            PreviousPageText="Previous" />
		<Columns>		    
		     <asp:TemplateField HeaderText="STT" HeaderStyle-BackColor="#b0e7fc">
           <ItemTemplate>
           </ItemTemplate>
            <HeaderStyle BackColor="#B0E7FC"></HeaderStyle>
           <ItemStyle Width="10px" />
        </asp:TemplateField>		   
		    <asp:TemplateField HeaderText="Họ tên" HeaderStyle-BackColor="#b0e7fc">
					 <ItemTemplate>
					    <%# Eval("C_HO_TEN")%>
					 </ItemTemplate>
                <HeaderStyle BackColor="#B0E7FC"></HeaderStyle>
		    </asp:TemplateField>
		     <asp:TemplateField HeaderText="Ngày sinh" HeaderStyle-BackColor="#b0e7fc">
					 <ItemTemplate>
					    <%# Eval("C_NGAY_SINH","{0:dd/MM/yyyy}")%>
					 </ItemTemplate>
                <HeaderStyle BackColor="#B0E7FC"></HeaderStyle>
		    </asp:TemplateField>
		    <asp:TemplateField HeaderText="Số hộ chiếu" HeaderStyle-BackColor="#b0e7fc"> 
					 <ItemTemplate>
					    <%# Eval("C_SO_HO_CHIEU")%>
					 </ItemTemplate>
                <HeaderStyle BackColor="#B0E7FC"></HeaderStyle>
		    </asp:TemplateField>
		    
		     <asp:TemplateField HeaderText="Số chứng chỉ" HeaderStyle-BackColor="#b0e7fc">
					 <ItemTemplate>
					    <%# Eval("C_SO_CHUNG_CHI")%>
					 </ItemTemplate>					 

            <HeaderStyle BackColor="#B0E7FC"></HeaderStyle>
		    </asp:TemplateField>
		     <asp:TemplateField HeaderText="Ngày cấp" HeaderStyle-BackColor="#b0e7fc">
					 <ItemTemplate>
					    <%# TTV.Utils.SetDateNull(Eval("C_SO_CHUNG_CHI").ToString(),Eval("C_NGAY_CAP","{0:dd/MM/yyyy}"))%>
					 </ItemTemplate>					 

<HeaderStyle BackColor="#B0E7FC"></HeaderStyle>
		    </asp:TemplateField>
		</Columns>
		<PagerStyle CssClass="Gird_Page" />
</asp:GridView> 
<br />
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td align="left">
        &nbsp;&nbsp;

        </td>
        <td align="right">       
            <asp:Button ID="btnExportExcel" runat="server" Text="Xuất ra file Excel" 
                onclick="btnExportExcel_Click" />
        
        </td>
    </tr>
</table>
 