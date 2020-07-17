<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Tim-viec.ascx.cs" Inherits="Modules_Base_Tim_viec" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %>
<%@ Register Assembly="RadEditor.Net2" Namespace="Telerik.WebControls" TagPrefix="radE" %>
<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>
<asp:Panel ID="pnRegister" runat="server">
    <asp:DetailsView ID="dvPOST_TD" runat="server" DataSourceID="POST_TDDataSource" DataKeyNames="PK_TIM_VIEC"
        SkinID="FeedBack"  AutoGenerateRows="False" DefaultMode="Insert"
        OnItemCommand="dvPOST_TD_ItemCommand" Width="95%" HeaderText="" CaptionAlign="Top"
        HorizontalAlign="Center" OnItemInserted="dvPOST_TD_ItemInserted" OnItemInserting="dvPOST_TD_ItemInserting"
        GridLines="None" OnPreRender="dvPOST_TD_PreRender">
        <Fields>
            <asp:TemplateField ShowHeader="false">
                <InsertItemTemplate>
                    <b>Thông tin hồ sơ</b>
                </InsertItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tiêu đề hồ sơ (*)">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_TITLE" Width="250px" Text='<%# Bind("C_TITLE") %>' runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvC_TITLE" runat="server" ErrorMessage="Bạn chưa nhập Tiêu đề hồ sơ"
                        ControlToValidate="txtC_TITLE" SetFocusOnError="True" ValidationGroup="vPOST_FAQG1"
                        Display="Dynamic">*</asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Họ tên (*)">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_HO_TEN" Width="250px" Text='<%# Bind("C_HO_TEN") %>' runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCC_HO_TEN" runat="server" ErrorMessage="Bạn chưa nhập họ tên"
                        ControlToValidate="txtC_HO_TEN" SetFocusOnError="True" ValidationGroup="vPOST_FAQG1"
                        Display="Dynamic">*</asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Ngày sinh">
                <InsertItemTemplate>
                    <radCln:RadDatePicker MinDate="1900-01-01" ID="raddNgaysinh" Width="89" SelectedDate='<%# Bind("C_NGAY_SINH") %>'
                        OnLoad="raddNgaysinh_Load" runat="server">
                    </radCln:RadDatePicker>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Giới tính">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_GIOI_TINH" Width="250px" Text='<%# Bind("C_GIOI_TINH") %>'
                        runat="server"></asp:TextBox>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tình trạng hôn nhân">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_TINH_TRANG_HON_NHAN" Width="250px" Text='<%# Bind("C_TINH_TRANG_HON_NHAN") %>'
                        runat="server"></asp:TextBox>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Địa chỉ">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_DIA_CHI" Width="250px" Text='<%# Bind("C_DIA_CHI") %>' runat="server"></asp:TextBox>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Điện thoại">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_DIEN_THOAI" Width="250px" Text='<%# Bind("C_DIEN_THOAI") %>'
                        runat="server"></asp:TextBox>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Di động">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_DI_DONG" Width="250px" Text='<%# Bind("C_DI_DONG") %>' runat="server"></asp:TextBox>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Trình độ">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_TRINH_DO" Width="250px" Text='<%# Bind("C_TRINH_DO") %>' runat="server"></asp:TextBox>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_EMAIL" Width="250px" Text='<%# Bind("C_EMAIL") %>' runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revSENDER_EMAIL" runat="server" 
                        ErrorMessage="Sai định dạng Email" ControlToValidate="txtC_EMAIL" SetFocusOnError="True"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="vPOST_FAQG1"
                        Display="Dynamic">*</asp:RegularExpressionValidator>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="false">
                <InsertItemTemplate>
                    <b>Việc làm mong muốn</b>
                </InsertItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Công việc mong muốn">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_MONG_MUON" Width="250px" Text='<%# Bind("C_MONG_MUON") %>'
                        runat="server"></asp:TextBox>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Chức danh">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_CHUC_DANH" Width="250px" Text='<%# Bind("C_CHUC_DANH") %>'
                        runat="server"></asp:TextBox>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mô tả công việc mong muốn">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_MO_TA_CONG_VIEC" Width="250px" TextMode="MultiLine" Columns="30"
                        Height="50" Text='<%# Bind("C_MO_TA_CONG_VIEC") %>' runat="server"></asp:TextBox>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mức lương hiện tại">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_MUC_LUONG_HIEN_TAI" Width="250px" Text='<%# Bind("C_MUC_LUONG_HIEN_TAI") %>'
                        runat="server"></asp:TextBox>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mức lương mong muốn">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_MUC_LUONG_MONG_MUON" Width="250px" Text='<%# Bind("C_MUC_LUONG_MONG_MUON") %>'
                        runat="server"></asp:TextBox>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Loại hình công việc">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_LOAI_HINH_CV" Width="250px" Text='<%# Bind("C_LOAI_HINH_CV") %>'
                        runat="server"></asp:TextBox>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Ngành nghề mong muốn">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_NGANH_NGHE_MONG_MUON" Width="250px" TextMode="MultiLine" Columns="30"
                        Height="50" Text='<%# Bind("C_NGANH_NGHE_MONG_MUON") %>' runat="server"></asp:TextBox>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Địa điểm làm việc mong muốn">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_DIA_DIEM" Width="250px" TextMode="MultiLine" Columns="30" Height="50"
                        Text='<%# Bind("C_DIA_DIEM") %>' runat="server"></asp:TextBox>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Sẵn sàng di chuyển">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_DI_CHUYEN" Width="250px" Text='<%# Bind("C_DI_CHUYEN") %>'
                        runat="server"></asp:TextBox>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="false">
                <InsertItemTemplate>
                    <b>Quá trình học tập và các bằng cấp đạt được </b>
                </InsertItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Bằng cấp">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_BANG_CAP" Width="250px" Text='<%# Bind("C_BANG_CAP") %>' runat="server"></asp:TextBox>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Trường tốt nghiệp">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_TRUONG_TN" Width="250px" Text='<%# Bind("C_TRUONG_TN") %>'
                        runat="server"></asp:TextBox>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Năm tốt nghiệp">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_NAM" Width="250px" Text='<%# Bind("C_NAM") %>' runat="server"></asp:TextBox>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nội dung học">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_NOI_DUNG_HOC" TextMode="MultiLine" Columns="30" Height="50"
                        Width="250px" Text='<%# Bind("C_NOI_DUNG_HOC") %>' runat="server"></asp:TextBox>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="false">
                <InsertItemTemplate>
                    <b>Kinh nghiệm làm việc </b>
                </InsertItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kinh nghiệm">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_KINH_NGHIEM" Width="250px" Text='<%# Bind("C_KINH_NGHIEM") %>'
                        runat="server"></asp:TextBox>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kĩ năng cá nhân">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_KI_NANG" TextMode="MultiLine" Columns="30" Height="50" Width="300px"
                        Text='<%# Bind("C_KI_NANG") %>' runat="server"></asp:TextBox>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Từ">
                <InsertItemTemplate>
                    <radCln:RadDatePicker MinDate="1900-01-01" ID="raddTu" Width="89" SelectedDate='<%# Bind("C_TU") %>' OnLoad="raddTu_Load"
                        runat="server">
                    </radCln:RadDatePicker>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Đến">
                <InsertItemTemplate>
                    <radCln:RadDatePicker MinDate="1900-01-01" ID="raddDen" Width="89" SelectedDate='<%# Bind("C_DEN") %>'
                        OnLoad="raddDen_Load" runat="server">
                    </radCln:RadDatePicker>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Làm">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_LAM" TextMode="MultiLine" Columns="30" Height="50" Width="300px"
                        Text='<%# Bind("C_LAM") %>' runat="server"></asp:TextBox>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:CommandField  ButtonType="Button" ValidationGroup="vPOST_FAQG1"
                ShowInsertButton="True">
                <ItemStyle HorizontalAlign="Center" />
            </asp:CommandField>
        </Fields>
    </asp:DetailsView>
</asp:Panel>
<asp:Panel ID="PnThank" runat="server" CssClass="caution" Height="50px" Width="100%"
    Visible="false">
    <%-- <%= CMS.Lang.GetKey("Dang-ky-kiem-tra-tieng-han.ascx", "Register")%>--%>
    Bạn đã đăng tin thành công !!
</asp:Panel>
<asp:ValidationSummary ID="vsPOST_FAQ" ValidationGroup="vPOST_FAQG1" ShowSummary="false"
     HeaderText="Vui lòng kiểm tra lại :" runat="server"
    ShowMessageBox="true" />
<asp:SqlDataSource ID="POST_TDDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    InsertCommand="INSERT INTO T_TIM_VIEC(C_TITLE,C_HO_TEN,C_NGAY_SINH,C_GIOI_TINH,C_TINH_TRANG_HON_NHAN,C_DIA_CHI,C_DIEN_THOAI,C_DI_DONG,
    C_TRINH_DO,C_EMAIL,C_MONG_MUON,C_CHUC_DANH,C_MO_TA_CONG_VIEC,C_MUC_LUONG_HIEN_TAI,C_MUC_LUONG_MONG_MUON,C_LOAI_HINH_CV,C_NGANH_NGHE_MONG_MUON,
    C_DIA_DIEM,C_DI_CHUYEN,C_BANG_CAP,C_TRUONG_TN,C_NAM,C_NOI_DUNG_HOC,C_KINH_NGHIEM,C_KI_NANG,C_TU,C_DEN,C_LAM,C_STATUS,C_NGAY_DANG)
                    VALUES(@C_TITLE,@C_HO_TEN,@C_NGAY_SINH,@C_GIOI_TINH,@C_TINH_TRANG_HON_NHAN,@C_DIA_CHI,@C_DIEN_THOAI,@C_DI_DONG,@C_TRINH_DO,@C_EMAIL,@C_MONG_MUON,@C_CHUC_DANH,@C_MO_TA_CONG_VIEC,@C_MUC_LUONG_HIEN_TAI,@C_MUC_LUONG_MONG_MUON,@C_LOAI_HINH_CV,@C_NGANH_NGHE_MONG_MUON,@C_DIA_DIEM,@C_DI_CHUYEN,@C_BANG_CAP,@C_TRUONG_TN,@C_NAM,@C_NOI_DUNG_HOC,@C_KINH_NGHIEM,@C_KI_NANG,@C_TU,@C_DEN,@C_LAM,0,GETDATE())
    ">
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
        <asp:Parameter Name="C_NGAY_DANG" Type="dateTime" />
        <asp:Parameter Name="C_TU" Type="dateTime" />
        <asp:Parameter Name="C_DEN" Type="dateTime" />
        <asp:Parameter Name="C_NOI_DUNG_HOC" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_KINH_NGHIEM" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_KI_NANG" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_LAM" ConvertEmptyStringToNull="false" DefaultValue="" Type="String" />
        <asp:Parameter Name="C_STATUS" Type="Int32" />
    </InsertParameters>
</asp:SqlDataSource>
