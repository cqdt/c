<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Tim-viec.ascx.cs" Inherits="Admin_Modules_Tim_viec" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %>
<%@ Register Assembly="RadEditor.Net2" Namespace="Telerik.WebControls" TagPrefix="radE" %>
<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>
<asp:DetailsView ID="dvRegister" runat="server" DataSourceID="RegisterDataSource"
    AutoGenerateRows="False" DataKeyNames="PK_TIM_VIEC" Width="100%" DefaultMode="Insert"
    HorizontalAlign="Center" HeaderText="Thêm mới" OnItemCommand="dvRegister_ItemCommand"
    OnItemInserted="dvRegister_ItemInserted" OnItemInserting="dvRegister_ItemInserting"
    OnItemUpdated="dvRegister_ItemUpdated" OnItemUpdating="dvRegister_ItemUpdating">
    <Fields>
        <asp:TemplateField HeaderText="Tiêu đề">
            <EditItemTemplate>
                <asp:TextBox ID="txtTitle" TextMode="MultiLine" Rows="3" Width="600px" runat="server"
                    Text='<%# Bind("C_TITLE") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtTitle" TextMode="MultiLine" Rows="3" Width="600px" runat="server"
                    Text='<%# Bind("C_TITLE") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Họ tên">
            <EditItemTemplate>
                <asp:TextBox ID="txtHoten" Width="600px" runat="server" Text='<%# Bind("C_HO_TEN") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtHoten" Width="600px" runat="server" Text='<%# Bind("C_HO_TEN") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Ngày sinh">
            <EditItemTemplate>
                <radCln:RadDatePicker  MinDate="1900-01-01" ID="radNgaysinh" Width="89" SelectedDate='<%# Bind("C_NGAY_SINH") %>'
                    runat="server">
                </radCln:RadDatePicker>
            </EditItemTemplate>
            <InsertItemTemplate>
                <radCln:RadDatePicker MinDate="1900-01-01" ID="radNgaysinh" Width="89" SelectedDate='<%# Bind("C_NGAY_SINH") %>'
                    runat="server" OnLoad="radNgaysinh_Load">
                </radCln:RadDatePicker>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Giới tính">
            <EditItemTemplate>
                <asp:TextBox ID="txtGT" Width="600px" runat="server" Text='<%# Bind("C_GIOI_TINH") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtGT" Width="600px" runat="server" Text='<%# Bind("C_GIOI_TINH") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Tình trạng hôn nhân">
            <EditItemTemplate>
                <asp:TextBox ID="txtTT" Width="600px" runat="server" Text='<%# Bind("C_TINH_TRANG_HON_NHAN") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtTT" Width="600px" runat="server" Text='<%# Bind("C_TINH_TRANG_HON_NHAN") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Địa chỉ">
            <EditItemTemplate>
                <asp:TextBox ID="txtDiachi" Width="600px" runat="server" Text='<%# Bind("C_DIA_CHI") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtDiachi" Width="600px" runat="server" Text='<%# Bind("C_DIA_CHI") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Điện thoại">
            <EditItemTemplate>
                <asp:TextBox ID="txtC_PHONE" Width="600px" runat="server" Text='<%# Bind("C_DIEN_THOAI") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtC_PHONE" Width="600px" runat="server" Text='<%# Bind("C_DIEN_THOAI") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Di động">
            <EditItemTemplate>
                <asp:TextBox ID="txtDd" Width="600px" runat="server" Text='<%# Bind("C_DI_DONG") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtDd" Width="600px" runat="server" Text='<%# Bind("C_DI_DONG") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Trình độ">
            <EditItemTemplate>
                <asp:TextBox ID="txtTd" Width="600px" runat="server" Text='<%# Bind("C_TRINH_DO") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtTd" Width="600px" runat="server" Text='<%# Bind("C_TRINH_DO") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Email">
            <EditItemTemplate>
                <asp:TextBox ID="txtE" Width="600px" runat="server" Text='<%# Bind("C_EMAIL") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtE" Width="600px" runat="server" Text='<%# Bind("C_EMAIL") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Công việc mong muốn">
            <EditItemTemplate>
                <asp:TextBox ID="txtCVMM" Width="600px" runat="server" Text='<%# Bind("C_MONG_MUON") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtCVMM" Width="600px" runat="server" Text='<%# Bind("C_MONG_MUON") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Chức danh">
            <EditItemTemplate>
                <asp:TextBox ID="txtCd" Width="600px" runat="server" Text='<%# Bind("C_CHUC_DANH") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtCd" Width="600px" runat="server" Text='<%# Bind("C_CHUC_DANH") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Mô tả công việc mong muốn">
            <EditItemTemplate>
                <asp:TextBox ID="txtC_MO_TA" TextMode="MultiLine" Rows="3" Width="600px" runat="server"
                    Text='<%# Bind("C_MO_TA_CONG_VIEC") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtC_MO_TA" TextMode="MultiLine" Rows="3" Width="600px" runat="server"
                    Text='<%# Bind("C_MO_TA_CONG_VIEC") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Mức lương hiện tại">
            <EditItemTemplate>
                <asp:TextBox ID="txtC_MUC_LUONG_HIEN_TAI" Width="600px" runat="server" Text='<%# Bind("C_MUC_LUONG_HIEN_TAI") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtC_MUC_LUONG_HIEN_TAI" Width="600px" runat="server" Text='<%# Bind("C_MUC_LUONG_HIEN_TAI") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Mức lương mong muốn">
            <EditItemTemplate>
                <asp:TextBox ID="txtC_MUC_LUONG_MONG_MUON" TextMode="MultiLine" Rows="3" Width="600px"
                    runat="server" Text='<%# Bind("C_MUC_LUONG_MONG_MUON") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtC_MUC_LUONG_MONG_MUON" TextMode="MultiLine" Rows="3" Width="600px"
                    runat="server" Text='<%# Bind("C_MUC_LUONG_MONG_MUON") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Loại hình công việc">
            <EditItemTemplate>
                <asp:TextBox ID="txtC_LOAI_HINH_CV" Width="600px" runat="server" Text='<%# Bind("C_LOAI_HINH_CV") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtC_LOAI_HINH_CV" Width="600px" runat="server" Text='<%# Bind("C_LOAI_HINH_CV") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Ngành nghề mong muốn">
            <EditItemTemplate>
                <asp:TextBox ID="txtC_NGANH_NGHE_MONG_MUON" TextMode="MultiLine" Rows="3" Width="600px"
                    runat="server" Text='<%# Bind("C_NGANH_NGHE_MONG_MUON") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtC_NGANH_NGHE_MONG_MUON" TextMode="MultiLine" Rows="3" Width="600px"
                    runat="server" Text='<%# Bind("C_NGANH_NGHE_MONG_MUON") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Địa điểm làm việc mong muốn">
            <EditItemTemplate>
                <asp:TextBox ID="txtC_DIA_DIEMN" TextMode="MultiLine" Rows="3" Width="600px" runat="server"
                    Text='<%# Bind("C_DIA_DIEM") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtC_DIA_DIEM" TextMode="MultiLine" Rows="3" Width="600px" runat="server"
                    Text='<%# Bind("C_DIA_DIEM") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Sẵn sàng di chuyển">
            <EditItemTemplate>
                <asp:TextBox ID="txtC_DI_CHUYEN" Width="600px" runat="server" Text='<%# Bind("C_DI_CHUYEN") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtC_DI_CHUYEN" Width="600px" runat="server" Text='<%# Bind("C_DI_CHUYEN") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Bằng cấp">
            <EditItemTemplate>
                <asp:TextBox ID="txtC_BANG_CAP" Width="600px" runat="server" Text='<%# Bind("C_BANG_CAP") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtC_BANG_CAP" Width="600px" runat="server" Text='<%# Bind("C_BANG_CAP") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Trường tốt nghiệp">
            <EditItemTemplate>
                <asp:TextBox ID="txtC_TRUONG_TN" Width="600px" runat="server" Text='<%# Bind("C_TRUONG_TN") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtC_TRUONG_TN" Width="600px" runat="server" Text='<%# Bind("C_TRUONG_TN") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Năm tốt nghiệp">
            <EditItemTemplate>
                <asp:TextBox ID="txtC_NAM" Width="600px" runat="server" Text='<%# Bind("C_NAM") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtC_NAM" Width="600px" runat="server" Text='<%# Bind("C_NAM") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Nội dung học">
            <EditItemTemplate>
                <asp:TextBox ID="txtC_NOI_DUNG_HOC" TextMode="MultiLine" Rows="3" Width="600px" runat="server"
                    Text='<%# Bind("C_NOI_DUNG_HOC") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtC_NOI_DUNG_HOC" TextMode="MultiLine" Rows="3" Width="600px" runat="server"
                    Text='<%# Bind("C_NOI_DUNG_HOC") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Kinh nghiệm">
            <EditItemTemplate>
                <asp:TextBox ID="txtC_KINH_NGHIEM" Width="600px" runat="server" Text='<%# Bind("C_KINH_NGHIEM") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtC_KINH_NGHIEM" Width="600px" runat="server" Text='<%# Bind("C_KINH_NGHIEM") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Kĩ năng cá nhân">
            <EditItemTemplate>
                <asp:TextBox ID="txtC_KI_NANG" TextMode="MultiLine" Rows="3" Width="600px" runat="server"
                    Text='<%# Bind("C_KI_NANG") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtC_KI_NANG" TextMode="MultiLine" Rows="3" Width="600px" runat="server"
                    Text='<%# Bind("C_KI_NANG") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Từ ngày">
            <EditItemTemplate>
                <radCln:RadDatePicker  MinDate="1900-01-01" ID="raddTungay" Width="89" SelectedDate='<%# Bind("C_TU") %>'
                    runat="server">
                </radCln:RadDatePicker>
            </EditItemTemplate>
            <InsertItemTemplate>
                <radCln:RadDatePicker  MinDate="1900-01-01" ID="raddTungay" Width="89" SelectedDate='<%# Bind("C_TU") %>'
                    runat="server" OnLoad="raddTungay_Load">
                </radCln:RadDatePicker>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Đến ngày">
            <EditItemTemplate>
                <radCln:RadDatePicker  MinDate="1900-01-01" ID="raddDenngay" Width="89" SelectedDate='<%# Bind("C_DEN") %>'
                    runat="server">
                </radCln:RadDatePicker>
            </EditItemTemplate>
            <InsertItemTemplate>
                <radCln:RadDatePicker  MinDate="1900-01-01" ID="raddDenngay" Width="89" SelectedDate='<%# Bind("C_DEN") %>'
                    runat="server" OnLoad="raddDenngay_Load">
                </radCln:RadDatePicker>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Làm">
            <EditItemTemplate>
                <asp:TextBox ID="txtLam" TextMode="MultiLine" Rows="3" Width="600px" runat="server"
                    Text='<%# Bind("C_LAM") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtLam" TextMode="MultiLine" Rows="3" Width="600px" runat="server"
                    Text='<%# Bind("C_LAM") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Ngày đăng">
            <EditItemTemplate>
                <radCln:RadDateTimePicker ID="raddNgaydang" Width="89" SelectedDate='<%# Bind("C_NGAY_DANG") %>'
                    runat="server">
                    <TimePopupButton Visible="false" />
                </radCln:RadDateTimePicker>
            </EditItemTemplate>
            <InsertItemTemplate>
                <radCln:RadDateTimePicker ID="raddNgaydang" Width="89" SelectedDate='<%# Bind("C_NGAY_DANG") %>'
                    runat="server" OnLoad="raddNgaydang_Load">
                    <TimePopupButton Visible="false" />
                </radCln:RadDateTimePicker>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Trạng th&#225;i">
            <EditItemTemplate>
                <asp:RadioButtonList ID="rblStatus" RepeatColumns="2" runat="server" SelectedValue='<%# Bind("C_STATUS") %>'>
                    <asp:ListItem Text="Hiển thị" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Không hiển thị" Value="0"></asp:ListItem>
                </asp:RadioButtonList>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:RadioButtonList ID="rblStatus" RepeatColumns="2" runat="server" SelectedValue='<%# Bind("C_STATUS") %>'>
                    <asp:ListItem Text="Hiển thị" Selected="True" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Không hiển thị" Value="0"></asp:ListItem>
                </asp:RadioButtonList>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField ShowHeader="False">
            <EditItemTemplate>
                <div align="center">
                    <br />
                    <asp:Button ID="btnUpdate" ValidationGroup="vLinkG1" runat="server" CommandName="Update"
                        Text="Sửa đổi" />
                    <asp:Button ID="btnList" runat="server" CommandName="Cancel" Text="Danh sách" />
                </div>
            </EditItemTemplate>
            <InsertItemTemplate>
                <div align="center">
                    <br />
                    <asp:Button ID="btnInsert" ValidationGroup="vLinkG1" runat="server" CommandName="Insert"
                        Text="Th&#234;m mới" />
                    <asp:Button ID="btnList" runat="server" CommandName="Cancel" Text="Danh sách" />
                </div>
            </InsertItemTemplate>
        </asp:TemplateField>
    </Fields>
</asp:DetailsView>
<asp:SqlDataSource ID="RegisterDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="select PK_TIM_VIEC, C_TITLE, C_HO_TEN, ISNULL(C_NGAY_SINH,GETDATE()) as 'C_NGAY_SINH', C_GIOI_TINH, C_TINH_TRANG_HON_NHAN, C_DIA_CHI, C_DIEN_THOAI, C_DI_DONG, C_TRINH_DO, C_EMAIL, 
                      C_MONG_MUON, C_CHUC_DANH, C_MO_TA_CONG_VIEC, C_MUC_LUONG_HIEN_TAI, C_MUC_LUONG_MONG_MUON, C_LOAI_HINH_CV, 
                      C_NGANH_NGHE_MONG_MUON, C_DIA_DIEM, C_DI_CHUYEN, C_BANG_CAP, C_TRUONG_TN, C_NAM, C_NOI_DUNG_HOC, C_KINH_NGHIEM, C_KI_NANG, ISNULL(C_TU,GETDATE()) as 'C_TU', 
                      ISNULL(C_DEN,GETDATE()) as 'C_DEN', C_LAM, CONVERT(INT,C_STATUS) AS 'C_STATUS', ISNULL(C_NGAY_DANG,GETDATE()) as 'C_NGAY_DANG' from T_TIM_VIEC
 WHERE PK_TIM_VIEC=@PK_TIM_VIEC" InsertCommand="INSERT INTO T_TIM_VIEC(C_TITLE, C_HO_TEN, C_NGAY_SINH, C_GIOI_TINH, C_TINH_TRANG_HON_NHAN, C_DIA_CHI, C_DIEN_THOAI, C_DI_DONG, C_TRINH_DO,
    C_EMAIL, 
                      C_MONG_MUON, C_CHUC_DANH, C_MO_TA_CONG_VIEC, C_MUC_LUONG_HIEN_TAI, C_MUC_LUONG_MONG_MUON, C_LOAI_HINH_CV, 
                      C_NGANH_NGHE_MONG_MUON, C_DIA_DIEM, C_DI_CHUYEN, C_BANG_CAP, C_TRUONG_TN, C_NAM, C_NOI_DUNG_HOC, C_KINH_NGHIEM, C_KI_NANG, C_TU, 
                      C_DEN, C_LAM, C_STATUS, C_NGAY_DANG) 
                              VALUES(@C_TITLE, @C_HO_TEN, @C_NGAY_SINH, @C_GIOI_TINH, @C_TINH_TRANG_HON_NHAN, @C_DIA_CHI, @C_DIEN_THOAI, @C_DI_DONG, @C_TRINH_DO, @C_EMAIL, 
                      @C_MONG_MUON, @C_CHUC_DANH, @C_MO_TA_CONG_VIEC, @C_MUC_LUONG_HIEN_TAI, @C_MUC_LUONG_MONG_MUON, @C_LOAI_HINH_CV, 
                      @C_NGANH_NGHE_MONG_MUON, @C_DIA_DIEM, @C_DI_CHUYEN, @C_BANG_CAP, @C_TRUONG_TN, @C_NAM, @C_NOI_DUNG_HOC, @C_KINH_NGHIEM, @C_KI_NANG, @C_TU, 
                      @C_DEN, @C_LAM, @C_STATUS, @C_NGAY_DANG)" UpdateCommand="UPDATE T_TIM_VIEC SET C_TITLE=@C_TITLE, C_HO_TEN=@C_HO_TEN, C_NGAY_SINH=@C_NGAY_SINH, C_GIOI_TINH=@C_GIOI_TINH, C_TINH_TRANG_HON_NHAN=@C_TINH_TRANG_HON_NHAN,
   C_DIA_CHI=@C_DIA_CHI, C_DIEN_THOAI=@C_DIEN_THOAI, C_DI_DONG=@C_DI_DONG, C_TRINH_DO=@C_TRINH_DO, C_EMAIL=@C_EMAIL, 
                      C_MONG_MUON=@C_MONG_MUON, C_CHUC_DANH=@C_CHUC_DANH, C_MO_TA_CONG_VIEC=@C_MO_TA_CONG_VIEC, C_MUC_LUONG_HIEN_TAI=@C_MUC_LUONG_HIEN_TAI, C_MUC_LUONG_MONG_MUON=@C_MUC_LUONG_MONG_MUON, C_LOAI_HINH_CV=@C_LOAI_HINH_CV, 
                      C_NGANH_NGHE_MONG_MUON=@C_NGANH_NGHE_MONG_MUON, C_DIA_DIEM=@C_DIA_DIEM, C_DI_CHUYEN=@C_DI_CHUYEN, C_BANG_CAP=@C_BANG_CAP, C_TRUONG_TN=@C_TRUONG_TN, C_NAM=@C_NAM, C_NOI_DUNG_HOC=@C_NOI_DUNG_HOC, C_KINH_NGHIEM=@C_KINH_NGHIEM, C_KI_NANG=@C_KI_NANG, C_TU=@C_TU, 
                      C_DEN=@C_DEN, C_LAM=@C_LAM, C_STATUS=@C_STATUS, C_NGAY_DANG=@C_NGAY_DANG WHERE PK_TIM_VIEC=@PK_TIM_VIEC">
    <SelectParameters>
        <asp:QueryStringParameter Name="PK_TIM_VIEC" QueryStringField="fID" DefaultValue="0"
            Type="Int32" />
    </SelectParameters>
    <InsertParameters>
        <asp:Parameter Name="C_TITLE" ConvertEmptyStringToNull="false" DefaultValue="" Type="String" />
        <asp:Parameter Name="C_HO_TEN" ConvertEmptyStringToNull="false" DefaultValue="" Type="String" />
        <asp:Parameter Name="C_GIOI_TINH" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_TINH_TRANG_HON_NHAN" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_DIA_CHI" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_DIEN_THOAI" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_DI_DONG" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_TRINH_DO" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_EMAIL" ConvertEmptyStringToNull="false" DefaultValue="" Type="String" />
        <asp:Parameter Name="C_MONG_MUON" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_CHUC_DANH" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_MO_TA_CONG_VIEC" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_MUC_LUONG_HIEN_TAI" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_MUC_LUONG_MONG_MUON" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_LOAI_HINH_CV" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_NGANH_NGHE_MONG_MUON" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_DIA_DIEM" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_DI_CHUYEN" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_BANG_CAP" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_TRUONG_TN" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_NAM" ConvertEmptyStringToNull="false" DefaultValue="" Type="String" />
        <asp:Parameter Name="C_NGAY_SINH" Type="dateTime" />
        <asp:Parameter Name="C_TU" Type="dateTime" />
        <asp:Parameter Name="C_DEN" Type="dateTime" />
        <asp:Parameter Name="C_NGAY_DANG" Type="dateTime" />
        <asp:Parameter Name="C_NOI_DUNG_HOC" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_KINH_NGHIEM" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_KI_NANG" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_LAM" ConvertEmptyStringToNull="false" DefaultValue="" Type="String" />
        <asp:Parameter Name="C_STATUS" Type="Int32" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="C_TITLE" ConvertEmptyStringToNull="false" DefaultValue="" Type="String" />
        <asp:Parameter Name="C_HO_TEN" ConvertEmptyStringToNull="false" DefaultValue="" Type="String" />
        <asp:Parameter Name="C_GIOI_TINH" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_TINH_TRANG_HON_NHAN" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_DIA_CHI" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_DIEN_THOAI" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_DI_DONG" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_TRINH_DO" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_EMAIL" ConvertEmptyStringToNull="false" DefaultValue="" Type="String" />
        <asp:Parameter Name="C_MONG_MUON" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_CHUC_DANH" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_MO_TA_CONG_VIEC" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_MUC_LUONG_HIEN_TAI" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_MUC_LUONG_MONG_MUON" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_LOAI_HINH_CV" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_NGANH_NGHE_MONG_MUON" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_DIA_DIEM" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_DI_CHUYEN" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_BANG_CAP" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_TRUONG_TN" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_NAM" ConvertEmptyStringToNull="false" DefaultValue="" Type="String" />
        <asp:Parameter Name="C_NGAY_SINH" Type="dateTime" />
        <asp:Parameter Name="C_TU" Type="dateTime" />
        <asp:Parameter Name="C_DEN" Type="dateTime" />
        <asp:Parameter Name="C_NGAY_DANG" Type="dateTime" />
        <asp:Parameter Name="C_NOI_DUNG_HOC" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_KINH_NGHIEM" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_KI_NANG" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_LAM" ConvertEmptyStringToNull="false" DefaultValue="" Type="String" />
        <asp:Parameter Name="C_STATUS" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
