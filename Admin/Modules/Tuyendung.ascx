<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Tuyendung.ascx.cs" Inherits="Admin_Modules_Tuyendung" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %>
<%@ Register Assembly="RadEditor.Net2" Namespace="Telerik.WebControls" TagPrefix="radE" %>
<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>
<asp:DetailsView ID="dvRegister" runat="server" DataSourceID="RegisterDataSource"
    AutoGenerateRows="False" DataKeyNames="PK_TUYEN_DUNG" Width="100%" DefaultMode="Insert"
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
        <asp:TemplateField HeaderText="Tên công ty">
            <EditItemTemplate>
                <asp:TextBox ID="txtTencty" Width="600px" runat="server" Text='<%# Bind("C_TEN_CONG_TY") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtTencty" Width="600px" runat="server" Text='<%# Bind("C_TEN_CONG_TY") %>'></asp:TextBox>
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
        <asp:TemplateField HeaderText="Mô tả">
            <EditItemTemplate>
                <asp:TextBox ID="txtC_MO_TA" TextMode="MultiLine" Rows="3" Width="600px" runat="server"
                    Text='<%# Bind("C_MO_TA") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtC_MO_TA" TextMode="MultiLine" Rows="3" Width="600px" runat="server"
                    Text='<%# Bind("C_MO_TA") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Số điện thoại">
            <EditItemTemplate>
                <asp:TextBox ID="txtC_PHONE" Width="600px" runat="server" Text='<%# Bind("C_PHONE") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtC_PHONE" Width="600px" runat="server" Text='<%# Bind("C_PHONE") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Quy mô">
            <EditItemTemplate>
                <asp:TextBox ID="txtC_QUY_MO" Width="600px" runat="server" Text='<%# Bind("C_QUY_MO") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtC_QUY_MO" Width="600px" runat="server" Text='<%# Bind("C_QUY_MO") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Tiêu chí">
            <EditItemTemplate>
                <asp:TextBox ID="txtC_TIEU_CHI" TextMode="MultiLine" Rows="3" Width="600px" runat="server"
                    Text='<%# Bind("C_TIEU_CHI") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtC_TIEU_CHI" TextMode="MultiLine" Rows="3" Width="600px" runat="server"
                    Text='<%# Bind("C_TIEU_CHI") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Quy mô">
            <EditItemTemplate>
                <asp:TextBox ID="txtC_WEBSITE" Width="600px" runat="server" Text='<%# Bind("C_WEBSITE") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtC_WEBSITE" Width="600px" runat="server" Text='<%# Bind("C_WEBSITE") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Vị trí">
            <EditItemTemplate>
                <asp:TextBox ID="txtC_VI_TRI" TextMode="MultiLine" Rows="3" Width="600px" runat="server"
                    Text='<%# Bind("C_VI_TRI") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtC_VI_TRI" TextMode="MultiLine" Rows="3" Width="600px" runat="server"
                    Text='<%# Bind("C_VI_TRI") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Số lượng tuyển">
            <EditItemTemplate>
                <asp:TextBox ID="txtC_SL_TUYEN" Width="600px" runat="server" Text='<%# Bind("C_SL_TUYEN") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtC_SL_TUYEN" Width="600px" runat="server" Text='<%# Bind("C_SL_TUYEN") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Lĩnh vực">
            <EditItemTemplate>
                <asp:TextBox ID="txtC_LINH_VUC" TextMode="MultiLine" Rows="3" Width="600px" runat="server"
                    Text='<%# Bind("C_LINH_VUC") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtC_LINH_VUC" TextMode="MultiLine" Rows="3" Width="600px" runat="server"
                    Text='<%# Bind("C_LINH_VUC") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Địa điểm làm việc">
            <EditItemTemplate>
                <asp:TextBox ID="txtC_DIA_DIEM_LAM_VIEC" TextMode="MultiLine" Rows="3" Width="600px"
                    runat="server" Text='<%# Bind("C_DIA_DIEM_LAM_VIEC") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtC_DIA_DIEM_LAM_VIEC" TextMode="MultiLine" Rows="3" Width="600px"
                    runat="server" Text='<%# Bind("C_DIA_DIEM_LAM_VIEC") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Mô tả việc làm">
            <EditItemTemplate>
                <asp:TextBox ID="txtC_MO_TA_VIEC_LAM" TextMode="MultiLine" Rows="3" Width="600px"
                    runat="server" Text='<%# Bind("C_MO_TA_VIEC_LAM") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtC_MO_TA_VIEC_LAM" TextMode="MultiLine" Rows="3" Width="600px"
                    runat="server" Text='<%# Bind("C_MO_TA_VIEC_LAM") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Kỹ năng">
            <EditItemTemplate>
                <asp:TextBox ID="txtC_KY_NANG" TextMode="MultiLine" Rows="3" Width="600px" runat="server"
                    Text='<%# Bind("C_KY_NANG") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtC_KY_NANG" TextMode="MultiLine" Rows="3" Width="600px" runat="server"
                    Text='<%# Bind("C_KY_NANG") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Trình độ tối thiểu">
            <EditItemTemplate>
                <asp:TextBox ID="txtC_TRINH_DO_TOI_THIEU" TextMode="MultiLine" Rows="3" Width="600px"
                    runat="server" Text='<%# Bind("C_TRINH_DO_TOI_THIEU") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtC_TRINH_DO_TOI_THIEU" TextMode="MultiLine" Rows="3" Width="600px"
                    runat="server" Text='<%# Bind("C_TRINH_DO_TOI_THIEU") %>'></asp:TextBox>
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
        <asp:TemplateField HeaderText="Yêu cầu giới tính">
            <EditItemTemplate>
                <asp:TextBox ID="txtC_YC_GIOI_TINH" Width="600px" runat="server" Text='<%# Bind("C_YC_GIOI_TINH") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtC_YC_GIOI_TINH" Width="600px" runat="server" Text='<%# Bind("C_YC_GIOI_TINH") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Hình thức làm việc">
            <EditItemTemplate>
                <asp:TextBox ID="txtC_HINH_THUC_LAM_VIEC" Width="600px" runat="server" Text='<%# Bind("C_HINH_THUC_LAM_VIEC") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtC_HINH_THUC_LAM_VIEC" Width="600px" runat="server" Text='<%# Bind("C_HINH_THUC_LAM_VIEC") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Mức lương">
            <EditItemTemplate>
                <asp:TextBox ID="txtC_MUC_LUONG" Width="600px" runat="server" Text='<%# Bind("C_MUC_LUONG") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtC_MUC_LUONG" Width="600px" runat="server" Text='<%# Bind("C_MUC_LUONG") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Thời gian thử việc">
            <EditItemTemplate>
                <asp:TextBox ID="txtC_THOI_GIAN_THU_VIEC" Width="600px" runat="server" Text='<%# Bind("C_THOI_GIAN_THU_VIEC") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtC_THOI_GIAN_THU_VIEC" Width="600px" runat="server" Text='<%# Bind("C_THOI_GIAN_THU_VIEC") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Các chế độ khác">
            <EditItemTemplate>
                <asp:TextBox ID="txtC_CAC_CHE_DO_KHAC" TextMode="MultiLine" Rows="3" Width="600px"
                    runat="server" Text='<%# Bind("C_CAC_CHE_DO_KHAC") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtC_CAC_CHE_DO_KHAC" TextMode="MultiLine" Rows="3" Width="600px"
                    runat="server" Text='<%# Bind("C_CAC_CHE_DO_KHAC") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Yêu cầu hồ sơ">
            <EditItemTemplate>
                <asp:TextBox ID="txtC_YEU_CAU_HO_SO" TextMode="MultiLine" Rows="3" Width="600px"
                    runat="server" Text='<%# Bind("C_YEU_CAU_HO_SO") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtC_YEU_CAU_HO_SO" TextMode="MultiLine" Rows="3" Width="600px"
                    runat="server" Text='<%# Bind("C_YEU_CAU_HO_SO") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Ngày đăng">
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
        <asp:TemplateField HeaderText="Hạn nộp hồ sơ">
            <EditItemTemplate>
                <radCln:RadDatePicker MinDate="1900-01-01" ID="radHannop" Width="89" SelectedDate='<%# Bind("C_HAN_NOP_HS") %>'
                    runat="server">
                </radCln:RadDatePicker>
            </EditItemTemplate>
            <InsertItemTemplate>
                <radCln:RadDatePicker MinDate="1900-01-01" ID="radHannop" Width="89" SelectedDate='<%# Bind("C_HAN_NOP_HS") %>'
                    runat="server" OnLoad="radHannop_Load">
                </radCln:RadDatePicker>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Người liên hệ">
            <EditItemTemplate>
                <asp:TextBox ID="txtC_NGUOI_LIEN_HE" Width="600px" runat="server" Text='<%# Bind("C_NGUOI_LIEN_HE") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtC_NGUOI_LIEN_HE" Width="600px" runat="server" Text='<%# Bind("C_NGUOI_LIEN_HE") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Địa chỉ liên hệ">
            <EditItemTemplate>
                <asp:TextBox ID="txtC_DIA_CHI_LIEN_HE" Width="600px" runat="server" Text='<%# Bind("C_DIA_CHI_LIEN_HE") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtC_DIA_CHI_LIEN_HE" Width="600px" runat="server" Text='<%# Bind("C_DIA_CHI_LIEN_HE") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Email liên hệ">
            <EditItemTemplate>
                <asp:TextBox ID="txtC_EMAIL_LIEN_HE" Width="600px" runat="server" Text='<%# Bind("C_EMAIL_LIEN_HE") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtC_EMAIL_LIEN_HE" Width="600px" runat="server" Text='<%# Bind("C_EMAIL_LIEN_HE") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Điện thoại liên hệ">
            <EditItemTemplate>
                <asp:TextBox ID="txtC_DIEN_THOAI_LIEN_HE" Width="600px" runat="server" Text='<%# Bind("C_DIEN_THOAI_LIEN_HE") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtC_DIEN_THOAI_LIEN_HE" Width="600px" runat="server" Text='<%# Bind("C_DIEN_THOAI_LIEN_HE") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Di động">
            <EditItemTemplate>
                <asp:TextBox ID="txtC_DI_DONG" Width="600px" runat="server" Text='<%# Bind("C_DI_DONG") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtC_DI_DONG" Width="600px" runat="server" Text='<%# Bind("C_DI_DONG") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Hình thức liên hệ">
            <EditItemTemplate>
                <asp:TextBox ID="txtC_HINH_THUC_LIEN_HE" Width="600px" runat="server" Text='<%# Bind("C_HINH_THUC_LIEN_HE") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtC_HINH_THUC_LIEN_HE" Width="600px" runat="server" Text='<%# Bind("C_HINH_THUC_LIEN_HE") %>'></asp:TextBox>
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
    SelectCommand="SELECT  PK_TUYEN_DUNG, C_DIA_CHI,C_TITLE,C_TEN_CONG_TY, C_MO_TA, C_PHONE, C_QUY_MO, C_TIEU_CHI, C_WEBSITE, C_VI_TRI, C_SL_TUYEN, C_LINH_VUC,C_DIA_DIEM_LAM_VIEC,C_MO_TA_VIEC_LAM,C_KY_NANG,C_TRINH_DO_TOI_THIEU,C_KINH_NGHIEM,C_YC_GIOI_TINH,C_HINH_THUC_LAM_VIEC,C_MUC_LUONG,C_CAC_CHE_DO_KHAC,C_THOI_GIAN_THU_VIEC,C_YEU_CAU_HO_SO,ISNULL(C_NGAY_DANG,GETDATE()) as 'C_NGAY_DANG',ISNULL(C_HAN_NOP_HS,GETDATE()) as 'C_HAN_NOP_HS',CONVERT(INT,C_STATUS) AS 'C_STATUS',C_NGUOI_LIEN_HE,C_DIA_CHI_LIEN_HE,C_DIEN_THOAI_LIEN_HE,C_EMAIL_LIEN_HE,C_DI_DONG,C_HINH_THUC_LIEN_HE FROM T_TUYEN_DUNG WHERE PK_TUYEN_DUNG=@PK_TUYEN_DUNG"
    InsertCommand="INSERT INTO T_TUYEN_DUNG(C_TITLE,C_TEN_CONG_TY, C_DIA_CHI,C_MO_TA, C_PHONE, C_QUY_MO, C_TIEU_CHI, C_WEBSITE, C_VI_TRI, C_SL_TUYEN, C_LINH_VUC,C_DIA_DIEM_LAM_VIEC,C_MO_TA_VIEC_LAM,C_KY_NANG,C_TRINH_DO_TOI_THIEU,C_KINH_NGHIEM,C_YC_GIOI_TINH,C_HINH_THUC_LAM_VIEC,C_MUC_LUONG,C_CAC_CHE_DO_KHAC,C_THOI_GIAN_THU_VIEC,C_YEU_CAU_HO_SO,C_NGAY_DANG,C_HAN_NOP_HS,C_STATUS,C_NGUOI_LIEN_HE,C_DIA_CHI_LIEN_HE,C_DIEN_THOAI_LIEN_HE,C_EMAIL_LIEN_HE,C_DI_DONG,C_HINH_THUC_LIEN_HE) 
                              VALUES(@C_TITLE,@C_TEN_CONG_TY,@C_DIA_CHI ,@C_MO_TA, @C_PHONE, @C_QUY_MO, @C_TIEU_CHI, @C_WEBSITE, @C_VI_TRI, @C_SL_TUYEN, @C_LINH_VUC,@C_DIA_DIEM_LAM_VIEC,@C_MO_TA_VIEC_LAM,@C_KY_NANG,@C_TRINH_DO_TOI_THIEU,@C_KINH_NGHIEM,@C_YC_GIOI_TINH,@C_HINH_THUC_LAM_VIEC,@C_MUC_LUONG,@C_CAC_CHE_DO_KHAC,@C_THOI_GIAN_THU_VIEC,@C_YEU_CAU_HO_SO,@C_NGAY_DANG,@C_HAN_NOP_HS,@C_STATUS,@C_NGUOI_LIEN_HE,@C_DIA_CHI_LIEN_HE,@C_DIEN_THOAI_LIEN_HE,@C_EMAIL_LIEN_HE,@C_DI_DONG,@C_HINH_THUC_LIEN_HE)"
    UpdateCommand="UPDATE T_TUYEN_DUNG SET C_TITLE=@C_TITLE,C_TEN_CONG_TY=@C_TEN_CONG_TY,C_DIA_CHI=@C_DIA_CHI,C_MO_TA=@C_MO_TA,C_PHONE=@C_PHONE,C_QUY_MO=@C_QUY_MO,C_TIEU_CHI=@C_TIEU_CHI,C_WEBSITE=@C_WEBSITE,C_VI_TRI=@C_VI_TRI, C_SL_TUYEN=@C_SL_TUYEN,C_NGAY_DANG=ISNULL(@C_NGAY_DANG,C_NGAY_DANG),C_LINH_VUC=@C_LINH_VUC,C_DIA_DIEM_LAM_VIEC=@C_DIA_DIEM_LAM_VIEC,C_MO_TA_VIEC_LAM=@C_MO_TA_VIEC_LAM,C_KY_NANG=@C_KY_NANG,C_TRINH_DO_TOI_THIEU=@C_TRINH_DO_TOI_THIEU,C_KINH_NGHIEM=@C_KINH_NGHIEM,C_YC_GIOI_TINH=@C_YC_GIOI_TINH,C_HINH_THUC_LAM_VIEC=@C_HINH_THUC_LAM_VIEC,C_MUC_LUONG=@C_MUC_LUONG,C_CAC_CHE_DO_KHAC=@C_CAC_CHE_DO_KHAC,C_THOI_GIAN_THU_VIEC=@C_THOI_GIAN_THU_VIEC,C_YEU_CAU_HO_SO=@C_YEU_CAU_HO_SO,C_HAN_NOP_HS=ISNULL(@C_HAN_NOP_HS,C_HAN_NOP_HS),C_STATUS=@C_STATUS,C_NGUOI_LIEN_HE=@C_NGUOI_LIEN_HE,C_DIA_CHI_LIEN_HE=@C_DIA_CHI_LIEN_HE,C_DIEN_THOAI_LIEN_HE=@C_DIEN_THOAI_LIEN_HE,C_EMAIL_LIEN_HE=@C_EMAIL_LIEN_HE,C_DI_DONG=@C_DI_DONG,C_HINH_THUC_LIEN_HE=@C_HINH_THUC_LIEN_HE WHERE PK_TUYEN_DUNG=@PK_TUYEN_DUNG">
    <SelectParameters>
        <asp:QueryStringParameter Name="PK_TUYEN_DUNG" QueryStringField="fID" DefaultValue="0"
            Type="Int32" />
    </SelectParameters>
    <InsertParameters>
        <asp:Parameter Name="C_TITLE" ConvertEmptyStringToNull="false" DefaultValue="" Type="String" />
        <asp:Parameter Name="C_TEN_CONG_TY" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_MO_TA" ConvertEmptyStringToNull="false" DefaultValue="" Type="String" />
        <asp:Parameter Name="C_DIA_CHI" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_PHONE" ConvertEmptyStringToNull="false" DefaultValue="" Type="String" />
        <asp:Parameter Name="C_QUY_MO" ConvertEmptyStringToNull="false" DefaultValue="" Type="String" />
        <asp:Parameter Name="C_TIEU_CHI" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_WEBSITE" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_VI_TRI" ConvertEmptyStringToNull="false" DefaultValue="" Type="String" />
        <asp:Parameter Name="C_SL_TUYEN" Type="Int32" />
        <asp:Parameter Name="C_LINH_VUC" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_DIA_DIEM_LAM_VIEC" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_MO_TA_VIEC_LAM" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_KY_NANG" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_TRINH_DO_TOI_THIEU" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_KINH_NGHIEM" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_YC_GIOI_TINH" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_HINH_THUC_LAM_VIEC" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_MUC_LUONG" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_THOI_GIAN_THU_VIEC" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_CAC_CHE_DO_KHAC" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_YEU_CAU_HO_SO" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_NGAY_DANG" Type="dateTime" />
        <asp:Parameter Name="C_HAN_NOP_HS" Type="dateTime" />
        <asp:Parameter Name="C_NGUOI_LIEN_HE" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_DIA_CHI_LIEN_HE" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_EMAIL_LIEN_HE" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_DIEN_THOAI_LIEN_HE" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_DI_DONG" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_HINH_THUC_LIEN_HE" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_STATUS" Type="Int32" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="C_TITLE" ConvertEmptyStringToNull="false" DefaultValue="" Type="String" />
        <asp:Parameter Name="C_TEN_CONG_TY" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_MO_TA" ConvertEmptyStringToNull="false" DefaultValue="" Type="String" />
        <asp:Parameter Name="C_DIA_CHI" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_PHONE" ConvertEmptyStringToNull="false" DefaultValue="" Type="String" />
        <asp:Parameter Name="C_QUY_MO" ConvertEmptyStringToNull="false" DefaultValue="" Type="String" />
        <asp:Parameter Name="C_TIEU_CHI" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_WEBSITE" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_VI_TRI" ConvertEmptyStringToNull="false" DefaultValue="" Type="String" />
        <asp:Parameter Name="C_SL_TUYEN" Type="Int32" />
        <asp:Parameter Name="C_LINH_VUC" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_DIA_DIEM_LAM_VIEC" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_MO_TA_VIEC_LAM" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_KY_NANG" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_TRINH_DO_TOI_THIEU" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_KINH_NGHIEM" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_YC_GIOI_TINH" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_HINH_THUC_LAM_VIEC" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_MUC_LUONG" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_THOI_GIAN_THU_VIEC" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_CAC_CHE_DO_KHAC" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_YEU_CAU_HO_SO" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_NGAY_DANG" Type="dateTime" />
        <asp:Parameter Name="C_HAN_NOP_HS" Type="dateTime" />
        <asp:Parameter Name="C_NGUOI_LIEN_HE" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_DIA_CHI_LIEN_HE" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_EMAIL_LIEN_HE" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_DIEN_THOAI_LIEN_HE" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_DI_DONG" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_HINH_THUC_LIEN_HE" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_STATUS" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
