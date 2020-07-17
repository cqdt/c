<%@ Control Language="C#" AutoEventWireup="true" CodeFile="chi-tiet-khai-bao-thong-tin.ascx.cs" Inherits="Admin_Modules_chi_tiet_khai_bao_thong_tin" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %> 
<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>

<asp:DetailsView id="dvGallery" runat="server" DataSourceID="GalleryDataSource" 
     AutoGenerateRows="False" DataKeyNames="PK_KHAIBAO"  Width="100%" 
     DefaultMode="Insert" HorizontalAlign="Center" HeaderText="Thêm mới khai báo" OnItemCommand="dvGallery_ItemCommand" OnItemInserted="dvGallery_ItemInserted" OnItemInserting="dvGallery_ItemInserting" OnItemUpdated="dvGallery_ItemUpdated" 
     OnItemUpdating="dvGallery_ItemUpdating">
    <Fields>
       
        <asp:TemplateField HeaderText="Họ tên">
            <EditItemTemplate>
               <asp:TextBox ID="txtHoten" Width="500px" runat="server" Text='<%# Bind("C_HOTEN") %>'></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvHoten" runat="server" ErrorMessage="Tên không thể rỗng" ControlToValidate="txtHoten" SetFocusOnError="True" ValidationGroup="vGalleryG1" Display="Dynamic">*</asp:RequiredFieldValidator>
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="txtHoten" Width="500px" runat="server" Text='<%# Bind("C_HOTEN") %>'></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvHoten" runat="server" ErrorMessage="Tên không thể rỗng" ControlToValidate="txtHoten" SetFocusOnError="True" ValidationGroup="vGalleryG1" Display="Dynamic">*</asp:RequiredFieldValidator>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Số hộ chiếu">
            <EditItemTemplate>
               <asp:TextBox ID="txtHochieu" Width="500px" runat="server" Text='<%# Bind("C_HOCHIEU") %>'></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvHochieu" runat="server" ErrorMessage="Số hộ chiếu không thể rỗng" ControlToValidate="txtHochieu" SetFocusOnError="True" ValidationGroup="vGalleryG1" Display="Dynamic">*</asp:RequiredFieldValidator>
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="txtHochieu" Width="500px" runat="server" Text='<%# Bind("C_HOCHIEU") %>'></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvHochieu" runat="server" ErrorMessage="Số hộ chiếu không thể rỗng" ControlToValidate="txtHochieu" SetFocusOnError="True" ValidationGroup="vGalleryG1" Display="Dynamic">*</asp:RequiredFieldValidator>
            </InsertItemTemplate>
        </asp:TemplateField>

       <asp:TemplateField HeaderText="Ngày nhập cảnh lần đầu">
            <EditItemTemplate>
               <asp:TextBox ID="txtngaynhapcanh" Width="500px" runat="server" Text='<%# Bind("C_NGAYNHAPCANH") %>'></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvnhancanh" runat="server" ErrorMessage="Ngày nhập cảnh không thể rỗng" ControlToValidate="txtngaynhapcanh" SetFocusOnError="True" ValidationGroup="vGalleryG1" Display="Dynamic">*</asp:RequiredFieldValidator>
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="txtngaynhapcanh" Width="500px" runat="server" Text='<%# Bind("C_NGAYNHAPCANH") %>'></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvnhancanh" runat="server" ErrorMessage="Ngày nhập cảnh không thể rỗng" ControlToValidate="txtngaynhapcanh" SetFocusOnError="True" ValidationGroup="vGalleryG1" Display="Dynamic">*</asp:RequiredFieldValidator>
            </InsertItemTemplate>
        </asp:TemplateField>

           <asp:TemplateField HeaderText="Số CMND Việt Nam">
            <EditItemTemplate>
               <asp:TextBox ID="txtCMND" Width="500px" runat="server" Text='<%# Bind("C_CMND") %>'></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvCMND" runat="server" ErrorMessage="CMND không thể rỗng" ControlToValidate="txtCMND" SetFocusOnError="True" ValidationGroup="vGalleryG1" Display="Dynamic">*</asp:RequiredFieldValidator>
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="txtCMND" Width="500px" runat="server" Text='<%# Bind("C_CMND") %>'></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvCMND" runat="server" ErrorMessage="CMND không thể rỗng" ControlToValidate="txtCMND" SetFocusOnError="True" ValidationGroup="vGalleryG1" Display="Dynamic">*</asp:RequiredFieldValidator>
            </InsertItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Địa chỉ Email cá nhân">
            <EditItemTemplate>
               <asp:TextBox ID="txtEmail" Width="500px" runat="server" Text='<%# Bind("C_EMAIL") %>'></asp:TextBox>               
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="txtEmail" Width="500px" runat="server" Text='<%# Bind("C_EMAIL") %>'></asp:TextBox>               
            </InsertItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Tên công ty nơi làm việc (1)">
            <EditItemTemplate>
               <asp:TextBox ID="C_TENDN1" Width="500px" runat="server" Text='<%# Bind("C_TENDN1") %>'></asp:TextBox>
               
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="C_TENDN1" Width="500px" runat="server" Text='<%# Bind("C_TENDN1") %>'></asp:TextBox>
               
            </InsertItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Tên chủ sử dụng lao động (1)">
            <EditItemTemplate>
               <asp:TextBox ID="C_NGUOISUDUNGLAODONG1" Width="500px" runat="server" Text='<%# Bind("C_NGUOISUDUNGLAODONG1") %>'></asp:TextBox>
               
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="C_NGUOISUDUNGLAODONG1" Width="500px" runat="server" Text='<%# Bind("C_NGUOISUDUNGLAODONG1") %>'></asp:TextBox>
               
            </InsertItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Số điện thoại của công ty (1)">
            <EditItemTemplate>
               <asp:TextBox ID="C_DIENTHOAIDN1" Width="500px" runat="server" Text='<%# Bind("C_DIENTHOAIDN1") %>'></asp:TextBox>
               
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="C_DIENTHOAIDN1" Width="500px" runat="server" Text='<%# Bind("C_DIENTHOAIDN1") %>'></asp:TextBox>
               
            </InsertItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Địa chỉ nơi làm việc (1)">
            <EditItemTemplate>
               <asp:TextBox ID="C_DIACHIDN1" Width="500px" runat="server" Text='<%# Bind("C_DIACHIDN1") %>'></asp:TextBox>
               
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="C_DIACHIDN1" Width="500px" runat="server" Text='<%# Bind("C_DIACHIDN1") %>'></asp:TextBox>
               
            </InsertItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Ngày bắt đầu làm việc tại C.TY (1)">
            <EditItemTemplate>
               <asp:TextBox ID="C_NGAYLAMVIECDN1" Width="500px" runat="server" Text='<%# Bind("C_NGAYLAMVIECDN1") %>'></asp:TextBox>
               
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="C_NGAYLAMVIECDN1" Width="500px" runat="server" Text='<%# Bind("C_NGAYLAMVIECDN1") %>'></asp:TextBox>
               
            </InsertItemTemplate>
        </asp:TemplateField>

        

        <asp:TemplateField HeaderText="Tên công ty nơi làm việc (2)">
            <EditItemTemplate>
               <asp:TextBox ID="C_TENDN2" Width="500px" runat="server" Text='<%# Bind("C_TENDN2") %>'></asp:TextBox>
               
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="C_TENDN2" Width="500px" runat="server" Text='<%# Bind("C_TENDN2") %>'></asp:TextBox>
               
            </InsertItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Tên chủ sử dụng lao động (2)">
            <EditItemTemplate>
               <asp:TextBox ID="C_NGUOISUDUNGLAODONG2" Width="500px" runat="server" Text='<%# Bind("C_NGUOISUDUNGLAODONG2") %>'></asp:TextBox>
               
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="C_NGUOISUDUNGLAODONG2" Width="500px" runat="server" Text='<%# Bind("C_NGUOISUDUNGLAODONG2") %>'></asp:TextBox>
               
            </InsertItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Số điện thoại của công ty (2)">
            <EditItemTemplate>
               <asp:TextBox ID="C_DIENTHOAIDN2" Width="500px" runat="server" Text='<%# Bind("C_DIENTHOAIDN2") %>'></asp:TextBox>
               
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="C_DIENTHOAIDN2" Width="500px" runat="server" Text='<%# Bind("C_DIENTHOAIDN2") %>'></asp:TextBox>
               
            </InsertItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Địa chỉ nơi làm việc (2)">
            <EditItemTemplate>
               <asp:TextBox ID="C_DIACHIDN2" Width="500px" runat="server" Text='<%# Bind("C_DIACHIDN2") %>'></asp:TextBox>
               
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="C_DIACHIDN2" Width="500px" runat="server" Text='<%# Bind("C_DIACHIDN2") %>'></asp:TextBox>
               
            </InsertItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Ngày bắt đầu làm việc tại C.TY (2)">
            <EditItemTemplate>
               <asp:TextBox ID="C_NGAYLAMVIECDN2" Width="500px" runat="server" Text='<%# Bind("C_NGAYLAMVIECDN2") %>'></asp:TextBox>
               
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="C_NGAYLAMVIECDN2" Width="500px" runat="server" Text='<%# Bind("C_NGAYLAMVIECDN2") %>'></asp:TextBox>
               
            </InsertItemTemplate>
        </asp:TemplateField>

        

        <asp:TemplateField HeaderText="Tên công ty nơi làm việc (3)">
            <EditItemTemplate>
               <asp:TextBox ID="C_TENDN3" Width="500px" runat="server" Text='<%# Bind("C_TENDN3") %>'></asp:TextBox>
               
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="C_TENDN3" Width="500px" runat="server" Text='<%# Bind("C_TENDN3") %>'></asp:TextBox>
               
            </InsertItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Tên chủ sử dụng lao động (3)">
            <EditItemTemplate>
               <asp:TextBox ID="C_NGUOISUDUNGLAODONG3" Width="500px" runat="server" Text='<%# Bind("C_NGUOISUDUNGLAODONG3") %>'></asp:TextBox>
               
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="C_NGUOISUDUNGLAODONG3" Width="500px" runat="server" Text='<%# Bind("C_NGUOISUDUNGLAODONG3") %>'></asp:TextBox>
               
            </InsertItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Số điện thoại của công ty (3)">
            <EditItemTemplate>
               <asp:TextBox ID="C_DIENTHOAIDN3" Width="500px" runat="server" Text='<%# Bind("C_DIENTHOAIDN3") %>'></asp:TextBox>
               
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="C_DIENTHOAIDN3" Width="500px" runat="server" Text='<%# Bind("C_DIENTHOAIDN3") %>'></asp:TextBox>
               
            </InsertItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Địa chỉ nơi làm việc (3)">
            <EditItemTemplate>
               <asp:TextBox ID="C_DIACHIDN3" Width="500px" runat="server" Text='<%# Bind("C_DIACHIDN3") %>'></asp:TextBox>
               
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="C_DIACHIDN3" Width="500px" runat="server" Text='<%# Bind("C_DIACHIDN3") %>'></asp:TextBox>
               
            </InsertItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Ngày bắt đầu làm việc tại C.TY (3)">
            <EditItemTemplate>
               <asp:TextBox ID="C_NGAYLAMVIECDN3" Width="500px" runat="server" Text='<%# Bind("C_NGAYLAMVIECDN3") %>'></asp:TextBox>
               
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="C_NGAYLAMVIECDN3" Width="500px" runat="server" Text='<%# Bind("C_NGAYLAMVIECDN3") %>'></asp:TextBox>
               
            </InsertItemTemplate>
        </asp:TemplateField>
        

        
        <asp:TemplateField HeaderText="Tên công ty nơi làm việc (4)">
            <EditItemTemplate>
               <asp:TextBox ID="C_TENDN4" Width="500px" runat="server" Text='<%# Bind("C_TENDN4") %>'></asp:TextBox>
               
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="C_TENDN4" Width="500px" runat="server" Text='<%# Bind("C_TENDN4") %>'></asp:TextBox>
               
            </InsertItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Tên chủ sử dụng lao động (4)">
            <EditItemTemplate>
               <asp:TextBox ID="C_NGUOISUDUNGLAODONG4" Width="500px" runat="server" Text='<%# Bind("C_NGUOISUDUNGLAODONG4") %>'></asp:TextBox>
               
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="C_NGUOISUDUNGLAODONG4" Width="500px" runat="server" Text='<%# Bind("C_NGUOISUDUNGLAODONG4") %>'></asp:TextBox>
               
            </InsertItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Số điện thoại của công ty (4)">
            <EditItemTemplate>
               <asp:TextBox ID="C_DIENTHOAIDN4" Width="500px" runat="server" Text='<%# Bind("C_DIENTHOAIDN4") %>'></asp:TextBox>
               
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="C_DIENTHOAIDN4" Width="500px" runat="server" Text='<%# Bind("C_DIENTHOAIDN4") %>'></asp:TextBox>
               
            </InsertItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Địa chỉ nơi làm việc (4)">
            <EditItemTemplate>
               <asp:TextBox ID="C_DIACHIDN4" Width="500px" runat="server" Text='<%# Bind("C_DIACHIDN4") %>'></asp:TextBox>
               
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="C_DIACHIDN4" Width="500px" runat="server" Text='<%# Bind("C_DIACHIDN4") %>'></asp:TextBox>
               
            </InsertItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Ngày bắt đầu làm việc tại C.TY (4)">
            <EditItemTemplate>
               <asp:TextBox ID="C_NGAYLAMVIECDN4" Width="500px" runat="server" Text='<%# Bind("C_NGAYLAMVIECDN4") %>'></asp:TextBox>
               
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="C_NGAYLAMVIECDN4" Width="500px" runat="server" Text='<%# Bind("C_NGAYLAMVIECDN4") %>'></asp:TextBox>
               
            </InsertItemTemplate>
        </asp:TemplateField>
      


        <asp:TemplateField HeaderText="Tên công ty nơi làm việc (5)">
            <EditItemTemplate>
               <asp:TextBox ID="C_TENDN5" Width="500px" runat="server" Text='<%# Bind("C_TENDN5") %>'></asp:TextBox>
               
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="C_TENDN5" Width="500px" runat="server" Text='<%# Bind("C_TENDN5") %>'></asp:TextBox>
               
            </InsertItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Tên chủ sử dụng lao động (5)">
            <EditItemTemplate>
               <asp:TextBox ID="C_NGUOISUDUNGLAODONG5" Width="500px" runat="server" Text='<%# Bind("C_NGUOISUDUNGLAODONG5") %>'></asp:TextBox>
               
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="C_NGUOISUDUNGLAODONG5" Width="500px" runat="server" Text='<%# Bind("C_NGUOISUDUNGLAODONG5") %>'></asp:TextBox>
               
            </InsertItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Số điện thoại của công ty (5)">
            <EditItemTemplate>
               <asp:TextBox ID="C_DIENTHOAIDN5" Width="500px" runat="server" Text='<%# Bind("C_DIENTHOAIDN5") %>'></asp:TextBox>
               
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="C_DIENTHOAIDN5" Width="500px" runat="server" Text='<%# Bind("C_DIENTHOAIDN5") %>'></asp:TextBox>
               
            </InsertItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Địa chỉ nơi làm việc (5)">
            <EditItemTemplate>
               <asp:TextBox ID="C_DIACHIDN5" Width="500px" runat="server" Text='<%# Bind("C_DIACHIDN5") %>'></asp:TextBox>
               
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="C_DIACHIDN5" Width="500px" runat="server" Text='<%# Bind("C_DIACHIDN5") %>'></asp:TextBox>
               
            </InsertItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Ngày bắt đầu làm việc tại C.TY (5)">
            <EditItemTemplate>
               <asp:TextBox ID="C_NGAYLAMVIECDN5" Width="500px" runat="server" Text='<%# Bind("C_NGAYLAMVIECDN5") %>'></asp:TextBox>
               
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="C_NGAYLAMVIECDN5" Width="500px" runat="server" Text='<%# Bind("C_NGAYLAMVIECDN5") %>'></asp:TextBox>
               
            </InsertItemTemplate>
        </asp:TemplateField>
     


        <asp:TemplateField HeaderText="Thời hạn hợp đồng lao động">
            <EditItemTemplate>
               <asp:TextBox ID="C_HOPDONGDEN" Width="500px" runat="server" Text='<%# Bind("C_HOPDONGDEN") %>'></asp:TextBox>
               
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="C_HOPDONGDEN" Width="500px" runat="server" Text='<%# Bind("C_NGAYLAMVIECDN5") %>'></asp:TextBox>
               
            </InsertItemTemplate>
        </asp:TemplateField>

          <asp:TemplateField HeaderText="Ngày hết hạn lưu trú">
            <EditItemTemplate>
               <asp:TextBox ID="C_NGAYHETHAN" Width="500px" runat="server" Text='<%# Bind("C_NGAYHETHAN") %>'></asp:TextBox>
               
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="C_NGAYHETHAN" Width="500px" runat="server" Text='<%# Bind("C_NGAYHETHAN") %>'></asp:TextBox>
               
            </InsertItemTemplate>
        </asp:TemplateField>

          <asp:TemplateField HeaderText="Lý do về nước">
            <EditItemTemplate>
							<asp:DropDownList ID="ddlLydo" SelectedValue='<%# Bind("C_LYDO") %>' runat="server">
							 <asp:ListItem Text="" Value=""></asp:ListItem>
                             <asp:ListItem Text="Về nước trước hạn vì lý do cá nhân" Value="Về nước trước hạn vì lý do cá nhân"></asp:ListItem>
						     <asp:ListItem Text="Về nước trước hạn vì không tìm được việc làm" Value="Về nước trước hạn vì không tìm được việc làm"></asp:ListItem>
                             <asp:ListItem Text="Về nước khi hết thời hạn hợp đồng" Value="Về nước khi hết thời hạn hợp đồng"></asp:ListItem> 							    
						   <asp:ListItem Text="Cư trú bất hợp pháp tự nguyện về nước" Value="Cư trú bất hợp pháp tự nguyện về nước"></asp:ListItem>
							    <asp:ListItem Text="Lý do khác" Value="Lý do khác"></asp:ListItem> 
							</asp:DropDownList>
            </EditItemTemplate>
            <InsertItemTemplate>
							<asp:DropDownList ID="ddlLydo" SelectedValue='<%# Bind("C_LYDO") %>' runat="server">
							    							    
                                <asp:ListItem Text="Về nước trước hạn vì lý do cá nhân" Value="Về nước trước hạn vì lý do cá nhân"></asp:ListItem>
						     <asp:ListItem Text="Về nước trước hạn vì không tìm được việc làm" Value="Về nước trước hạn vì không tìm được việc làm"></asp:ListItem>
                             <asp:ListItem Text="Về nước khi hết thời hạn hợp đồng" Value="Về nước khi hết thời hạn hợp đồng"></asp:ListItem> 							    
						   <asp:ListItem Text="Cư trú bất hợp pháp tự nguyện về nước" Value="Cư trú bất hợp pháp tự nguyện về nước"></asp:ListItem>
							    <asp:ListItem Text="Lý do khác" Value="Lý do khác"></asp:ListItem> 							    
							</asp:DropDownList>
					  </InsertItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Ngày dự định về nước">
            <EditItemTemplate>
               <asp:TextBox ID="C_NGAYDANGKYVENUOC" Width="500px" runat="server" Text='<%# Bind("C_NGAYDANGKYVENUOC") %>'></asp:TextBox>
               
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="C_NGAYDANGKYVENUOC" Width="500px" runat="server" Text='<%# Bind("C_NGAYDANGKYVENUOC") %>'></asp:TextBox>
               
            </InsertItemTemplate>
        </asp:TemplateField>

    <asp:TemplateField HeaderText="Ngày khai báo đầu tiên">
            <EditItemTemplate>
               <asp:TextBox ReadOnly="true" ID="C_NGAYKHAIBAODAU" Width="500px" runat="server" Text='<%# Bind("C_NGAYKHAIBAODAU") %>'></asp:TextBox>
               
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ReadOnly="true" ID="C_NGAYKHAIBAODAU" Width="500px" runat="server" Text='<%# Bind("C_NGAYKHAIBAODAU") %>'></asp:TextBox>
               
            </InsertItemTemplate>
        </asp:TemplateField>


        <asp:TemplateField HeaderText="Ngày khai báo đầu cuối">
            <EditItemTemplate>
               <asp:TextBox ReadOnly="true" ID="C_NGAYKHAIBAOCUOI" Width="500px" runat="server" Text='<%# Bind("C_NGAYKHAIBAOCUOI") %>'></asp:TextBox>
               
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ReadOnly="true" ID="C_NGAYKHAIBAOCUOI" Width="500px" runat="server" Text='<%# Bind("C_NGAYKHAIBAOCUOI") %>'></asp:TextBox>
               
            </InsertItemTemplate>
        </asp:TemplateField>

         


         <asp:TemplateField ShowHeader="False">
            <EditItemTemplate>
               <div align="center">
                  <br />
                  <asp:Button ID="btnUpdate" ValidationGroup="vGalleryG1" runat="server" CommandName="Update" Text="Sửa đổi" />
                  <asp:Button ID="btnList" runat="server" CommandName="Cancel" Text="Danh sách" />
               </div>
            </EditItemTemplate>
            <InsertItemTemplate>
               <div align="center">
                  <br />
                  <asp:Button ID="btnInsert" ValidationGroup="vGalleryG1" runat="server" CommandName="Insert" Text="Th&#234;m mới" />
                  <asp:Button ID="btnList" runat="server" CommandName="Cancel" Text="Danh sách" />
               </div>
            </InsertItemTemplate>
        </asp:TemplateField>
    </Fields>
</asp:DetailsView> 
<asp:ValidationSummary ID="vsGallery" ValidationGroup="vGalleryG1" ShowSummary="false" HeaderText="Vui lòng kiểm tra lại :" runat="server" ShowMessageBox="true" />  

   
     
     
<asp:SqlDataSource ID="GalleryDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT    PK_KHAIBAO, C_HOTEN, C_HOCHIEU, C_NGAYNHAPCANH, C_CMND, C_SOTHE, C_DIENTHOAI, C_EMAIL, C_MUCDICH, C_TENDN1, 
                      C_NGUOISUDUNGLAODONG1, C_DIENTHOAIDN1, C_DIACHIDN1, C_NGAYLAMVIECDN1, C_TENDN2, C_NGUOISUDUNGLAODONG2, C_DIENTHOAIDN2, C_DIACHIDN2, 
                      C_NGAYLAMVIECDN2, C_TENDN3, C_NGUOISUDUNGLAODONG3, C_DIENTHOAIDN3, C_DIACHIDN3, C_NGAYLAMVIECDN3, C_TENDN4, 
                      C_NGUOISUDUNGLAODONG4, C_DIENTHOAIDN4, C_DIACHIDN4, C_NGAYLAMVIECDN4, C_TENDN5, C_NGUOISUDUNGLAODONG5, C_DIENTHOAIDN5, C_DIACHIDN5, 
                      C_NGAYLAMVIECDN5, C_HOPDONGDEN,C_LYDO, C_NGAYHETHAN, C_NGAYDANGKYVENUOC, C_NGAYGUI, C_NGAYKHAIBAOCUOI, C_NGAYKHAIBAODAU
                      FROM  T_KHAIBAO_THONGTIN WHERE PK_KHAIBAO=@PK_KHAIBAO"   
   InsertCommand="INSERT INTO T_KHAIBAO_THONGTIN(C_HOTEN, C_HOCHIEU, C_NGAYNHAPCANH, C_CMND, C_SOTHE, C_DIENTHOAI, C_EMAIL,  C_TENDN1, 
                      C_NGUOISUDUNGLAODONG1, C_DIENTHOAIDN1, C_DIACHIDN1, C_NGAYLAMVIECDN1, C_TENDN2, C_NGUOISUDUNGLAODONG2, C_DIENTHOAIDN2, C_DIACHIDN2, 
                      C_NGAYLAMVIECDN2, C_TENDN3, C_NGUOISUDUNGLAODONG3, C_DIENTHOAIDN3, C_DIACHIDN3, C_NGAYLAMVIECDN3, C_TENDN4, 
                      C_NGUOISUDUNGLAODONG4, C_DIENTHOAIDN4, C_DIACHIDN4, C_NGAYLAMVIECDN4, C_TENDN5, C_NGUOISUDUNGLAODONG5, C_DIENTHOAIDN5, C_DIACHIDN5, 
                      C_NGAYLAMVIECDN5, C_HOPDONGDEN, C_LYDO, C_NGAYHETHAN, C_NGAYDANGKYVENUOC, C_NGAYGUI) 
                              VALUES(@C_HOTEN, @C_HOCHIEU, @C_NGAYNHAPCANH, @C_CMND, @C_SOTHE, @C_DIENTHOAI, @C_EMAIL,  @C_TENDN1, 
                      @C_NGUOISUDUNGLAODONG1, @C_DIENTHOAIDN1, @C_DIACHIDN1, @C_NGAYLAMVIECDN1, @C_TENDN2, @C_NGUOISUDUNGLAODONG2, @C_DIENTHOAIDN2, @C_DIACHIDN2, 
                      @C_NGAYLAMVIECDN2, @C_TENDN3, @C_NGUOISUDUNGLAODONG3, @C_DIENTHOAIDN3, @C_DIACHIDN3, @C_NGAYLAMVIECDN3, @C_TENDN4, 
                      @C_NGUOISUDUNGLAODONG4, @C_DIENTHOAIDN4, @C_DIACHIDN4, @C_NGAYLAMVIECDN4, @C_TENDN5, @C_NGUOISUDUNGLAODONG5, @C_DIENTHOAIDN5, @C_DIACHIDN5, 
                      @C_NGAYLAMVIECDN5, @C_HOPDONGDEN, @C_LYDO, @C_NGAYHETHAN, @C_NGAYDANGKYVENUOC, GETDATE()) " 

   UpdateCommand="UPDATE T_KHAIBAO_THONGTIN SET 
   C_HOTEN=@C_HOTEN, C_HOCHIEU=@C_HOCHIEU, C_NGAYNHAPCANH=@C_NGAYNHAPCANH, C_CMND=@C_CMND, C_SOTHE=@C_SOTHE, C_DIENTHOAI=@C_DIENTHOAI, C_EMAIL=@C_EMAIL,  
   C_TENDN1=@C_TENDN1, C_NGUOISUDUNGLAODONG1=@C_NGUOISUDUNGLAODONG1, C_DIENTHOAIDN1=@C_DIENTHOAIDN1, C_DIACHIDN1=@C_DIACHIDN1, C_NGAYLAMVIECDN1=@C_NGAYLAMVIECDN1, 
   C_TENDN2=@C_TENDN2, C_NGUOISUDUNGLAODONG2=@C_NGUOISUDUNGLAODONG2, C_DIENTHOAIDN2=@C_DIENTHOAIDN2, C_DIACHIDN2=@C_DIACHIDN2, C_NGAYLAMVIECDN2=@C_NGAYLAMVIECDN2, 
   C_TENDN3=@C_TENDN3, C_NGUOISUDUNGLAODONG3=@C_NGUOISUDUNGLAODONG3, C_DIENTHOAIDN3=@C_DIENTHOAIDN3, C_DIACHIDN3=@C_DIACHIDN3, C_NGAYLAMVIECDN3=@C_NGAYLAMVIECDN3, 
   C_TENDN4=@C_TENDN4, C_NGUOISUDUNGLAODONG4=@C_NGUOISUDUNGLAODONG4, C_DIENTHOAIDN4=@C_DIENTHOAIDN4, C_DIACHIDN4=@C_DIACHIDN4, C_NGAYLAMVIECDN4=@C_NGAYLAMVIECDN4, 
   C_TENDN5=@C_TENDN5, C_NGUOISUDUNGLAODONG5=@C_NGUOISUDUNGLAODONG5, C_DIENTHOAIDN5=@C_DIENTHOAIDN5, C_DIACHIDN5=@C_DIACHIDN5, C_NGAYLAMVIECDN5=@C_NGAYLAMVIECDN5, 
   C_HOPDONGDEN=@C_HOPDONGDEN, C_LYDO=@C_LYDO, C_NGAYHETHAN=@C_NGAYHETHAN, C_NGAYDANGKYVENUOC=@C_NGAYDANGKYVENUOC, C_NGAYGUI=GETDATE()
   
    WHERE PK_KHAIBAO=@PK_KHAIBAO" 
    >
   <SelectParameters>
     <asp:QueryStringParameter Name="PK_KHAIBAO" QueryStringField="aID" DefaultValue="0" Type="Int32" />
   </SelectParameters>
   <InsertParameters>     
     <asp:Parameter Name="C_HOTEN" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_HOCHIEU" ConvertEmptyStringToNull="false" Type="String"/>

     <asp:Parameter Name="C_NGAYNHAPCANH" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_CMND" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_SOTHE" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_DIENTHOAI" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_EMAIL" ConvertEmptyStringToNull="false" Type="String"/>

     <asp:Parameter Name="C_TENDN1" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_NGUOISUDUNGLAODONG1" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_DIENTHOAIDN1" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_DIACHIDN1" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_NGAYLAMVIECDN1" ConvertEmptyStringToNull="false" Type="String"/>

     <asp:Parameter Name="C_TENDN2" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_NGUOISUDUNGLAODONG2" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_DIENTHOAIDN2" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_DIACHIDN2" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_NGAYLAMVIECDN2" ConvertEmptyStringToNull="false" Type="String"/>

     <asp:Parameter Name="C_TENDN3" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_NGUOISUDUNGLAODONG3" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_DIENTHOAIDN3" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_DIACHIDN3" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_NGAYLAMVIECDN3" ConvertEmptyStringToNull="false" Type="String"/>

     <asp:Parameter Name="C_TENDN4" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_NGUOISUDUNGLAODONG4" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_DIENTHOAIDN4" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_DIACHIDN4" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_NGAYLAMVIECDN4" ConvertEmptyStringToNull="false" Type="String"/>

     <asp:Parameter Name="C_TENDN5" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_NGUOISUDUNGLAODONG5" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_DIENTHOAIDN5" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_DIACHIDN5" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_NGAYLAMVIECDN5" ConvertEmptyStringToNull="false" Type="String"/>


     <asp:Parameter Name="C_HOPDONGDEN" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_LYDO" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_NGAYHETHAN" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_NGAYDANGKYVENUOC" ConvertEmptyStringToNull="false" Type="String"/>
     
     <asp:Parameter Name="C_NGAYGUI" Type="DateTime"  />
     <asp:Parameter Name="C_NGAYKHAIBAOCUOI" Type="DateTime"  />
     <asp:Parameter Name="C_NGAYKHAIBAODAU" Type="DateTime"  />

     
   </InsertParameters>
   <UpdateParameters>
    <asp:Parameter Name="C_HOTEN" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_HOCHIEU" ConvertEmptyStringToNull="false" Type="String"/>

     <asp:Parameter Name="C_NGAYNHAPCANH" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_CMND" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_SOTHE" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_DIENTHOAI" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_EMAIL" ConvertEmptyStringToNull="false" Type="String"/>

     <asp:Parameter Name="C_TENDN1" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_NGUOISUDUNGLAODONG1" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_DIENTHOAIDN1" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_DIACHIDN1" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_NGAYLAMVIECDN1" ConvertEmptyStringToNull="false" Type="String"/>

     <asp:Parameter Name="C_TENDN2" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_NGUOISUDUNGLAODONG2" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_DIENTHOAIDN2" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_DIACHIDN2" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_NGAYLAMVIECDN2" ConvertEmptyStringToNull="false" Type="String"/>

     <asp:Parameter Name="C_TENDN3" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_NGUOISUDUNGLAODONG3" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_DIENTHOAIDN3" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_DIACHIDN3" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_NGAYLAMVIECDN3" ConvertEmptyStringToNull="false" Type="String"/>

     <asp:Parameter Name="C_TENDN4" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_NGUOISUDUNGLAODONG4" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_DIENTHOAIDN4" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_DIACHIDN4" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_NGAYLAMVIECDN4" ConvertEmptyStringToNull="false" Type="String"/>

     <asp:Parameter Name="C_TENDN5" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_NGUOISUDUNGLAODONG5" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_DIENTHOAIDN5" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_DIACHIDN5" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_NGAYLAMVIECDN5" ConvertEmptyStringToNull="false" Type="String"/>


     <asp:Parameter Name="C_HOPDONGDEN" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_LYDO" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_NGAYHETHAN" ConvertEmptyStringToNull="false" Type="String"/>
     <asp:Parameter Name="C_NGAYDANGKYVENUOC" ConvertEmptyStringToNull="false" Type="String"/>
     
     <asp:Parameter Name="C_NGAYGUI" Type="DateTime"  />
     <asp:Parameter Name="C_NGAYKHAIBAOCUOI" Type="DateTime"  />
     <asp:Parameter Name="C_NGAYKHAIBAODAU" Type="DateTime"  />
   </UpdateParameters>
</asp:SqlDataSource>
