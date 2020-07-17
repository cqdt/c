<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Dang-ky-kiem-tra-tieng-han.ascx.cs"
    Inherits="Modules_Base_Dang_ky_kiem_tra_tieng_han" %>
<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>
<asp:Panel ID="pnRegister" runat="server">
    <asp:DetailsView ID="dvRegister" runat="server" DataSourceID="DataSourceRegister"
        DataKeyNames="PK_DK" SkinID="FeedBack"  AutoGenerateRows="False"
        DefaultMode="Insert" OnItemCommand="dvRegister_ItemCommand" Width="100%" CaptionAlign="Top"
        HorizontalAlign="Center" OnItemInserted="dvRegister_ItemInserted" OnItemInserting="dvRegister_ItemInserting"
        GridLines="None">
        <Fields>
            <asp:TemplateField  HeaderText="Họ và tên (*)">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_HO_TEN" Width="250px" Text='<%# Bind("C_HO_TEN") %>' runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ErrorMessage="Tên không thể rỗng"
                        ControlToValidate="txtC_HO_TEN" SetFocusOnError="True" ValidationGroup="vPOST_FAQG1"
                        Display="Dynamic">*</asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField  HeaderText="Ngày sinh (*)">
                <InsertItemTemplate>
                    <radCln:RadDatePicker MinDate="1900-01-01" ID="raddNgaysinh" Width="89" SelectedDate='<%# Bind("C_NGAY_SINH") %>'
                        OnLoad="raddNgaysinh_Load" runat="server">
                    </radCln:RadDatePicker>
                    <%--<asp:RequiredFieldValidator ID="rfvNS" runat="server" ErrorMessage="Ngày sinh không thể rỗng" ControlToValidate="raddNgaysinh" SetFocusOnError="True" ValidationGroup="vPOST_FAQG1" Display="Dynamic">*</asp:RequiredFieldValidator>--%>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField  HeaderText="Số CMND (*)">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_CMND" Width="250px" Text='<%# Bind("C_CMND") %>' runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCMND" runat="server" ErrorMessage="Số CMND không thể rỗng"
                        ControlToValidate="txtC_CMND" SetFocusOnError="True" ValidationGroup="vPOST_FAQG1"
                        Display="Dynamic">*</asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField  HeaderText="Tỉnh (*)">
                <InsertItemTemplate>
                    <asp:DropDownList ID="ddlTinh" SelectedValue='<%# Bind("C_TINH") %>' runat="server"
                        Width="160">
                        <asp:ListItem Text="An Giang" Value="An Giang"></asp:ListItem>
                        <asp:ListItem Text="Bà Rịa-Vũng Tàu" Value="Bà Rịa-Vũng Tàu"></asp:ListItem>
                        <asp:ListItem Text="Bạc Liêu" Value="Bạc Liêu"></asp:ListItem>
                        <asp:ListItem Text="Bắc Cạn" Value="Bắc Cạn"></asp:ListItem>
                        <asp:ListItem Text="Bắc Giang" Value="Bắc Giang"></asp:ListItem>
                        <asp:ListItem Text="Bắc Ninh" Value="Bắc Ninh"></asp:ListItem>
                        <asp:ListItem Text="Bến Tre" Value="Bến Tre"></asp:ListItem>
                        <asp:ListItem Text="Bình Dương" Value="Bình Dương"></asp:ListItem>
                        <asp:ListItem Text="Bình Định" Value="Bình Định"></asp:ListItem>
                        <asp:ListItem Text="Bình Phước" Value="Bình Phước"></asp:ListItem>
                        <asp:ListItem Text="Bình Thuận" Value="Bình Thuận"></asp:ListItem>
                        <asp:ListItem Text="Cà Mau" Value="Cà Mau"></asp:ListItem>
                        <asp:ListItem Text="Cao Bằng" Value="Cao Bằng"></asp:ListItem>
                        <asp:ListItem Text="Cần Thơ" Value="Cần Thơ"></asp:ListItem>
                        <asp:ListItem Text="Đà Nẵng" Value="Đà Nẵng"></asp:ListItem>
                        <asp:ListItem Text="Đắk Lắk" Value="Đắk Lắk"></asp:ListItem>
                        <asp:ListItem Text="Đắk Nông" Value="Đắk Nông"></asp:ListItem>
                        <asp:ListItem Text="Điện Biên" Value="Điện Biên"></asp:ListItem>
                        <asp:ListItem Text="Đồng Nai" Value="Đồng Nai"></asp:ListItem>
                        <asp:ListItem Text="Đồng Tháp" Value="Đồng Tháp"></asp:ListItem>
                        <asp:ListItem Text="Gia Lai" Value="Gia Lai"></asp:ListItem>
                        <asp:ListItem Text="Hà Giang" Value="Hà Giang"></asp:ListItem>
                        <asp:ListItem Text="Hà Nam" Value="Hà Nam"></asp:ListItem>
                        <asp:ListItem Text="Hà Nội" Value="Hà Nội"></asp:ListItem>
                        <asp:ListItem Text="Hà Tĩnh" Value="Hà Tĩnh"></asp:ListItem>
                        <asp:ListItem Text="Hải Dương" Value="Hải Dương"></asp:ListItem>
                        <asp:ListItem Text="Hải Phòng" Value="Hải Phòng"></asp:ListItem>
                        <asp:ListItem Text="Hậu Giang" Value="Hậu Giang"></asp:ListItem>
                        <asp:ListItem Text="Hòa Bình" Value="Hòa Bình"></asp:ListItem>
                        <asp:ListItem Text="Thành phố Hồ Chí Minh" Value="Thành phố Hồ Chí Minh"></asp:ListItem>
                        <asp:ListItem Text="Hưng Yên" Value="Hưng Yên"></asp:ListItem>
                        <asp:ListItem Text="Khánh Hoà" Value="Khánh Hoà"></asp:ListItem>
                        <asp:ListItem Text="Kiên Giang" Value="Kiên Giang"></asp:ListItem>
                        <asp:ListItem Text="Kon Tum" Value="Kon Tum"></asp:ListItem>
                        <asp:ListItem Text="Lai Châu" Value="Lai Châu"></asp:ListItem>
                        <asp:ListItem Text="Lạng Sơn" Value="Lạng Sơn"></asp:ListItem>
                        <asp:ListItem Text="Lào Cai" Value="Lào Cai"></asp:ListItem>
                        <asp:ListItem Text="Lâm Đồng" Value="Lâm Đồng"></asp:ListItem>
                        <asp:ListItem Text="Long An" Value="Long An"></asp:ListItem>
                        <asp:ListItem Text="Nam Định" Value="Nam Định"></asp:ListItem>
                        <asp:ListItem Text="Nghệ An" Value="Nghệ An"></asp:ListItem>
                        <asp:ListItem Text="Ninh Bình" Value="Ninh Bình"></asp:ListItem>
                        <asp:ListItem Text="Ninh Thuận" Value="Ninh Thuận"></asp:ListItem>
                        <asp:ListItem Text="Phú Thọ" Value="Phú Thọ"></asp:ListItem>
                        <asp:ListItem Text="Phú Yên" Value="Phú Yên"></asp:ListItem>
                        <asp:ListItem Text="Quảng Bình" Value="Quảng Bình"></asp:ListItem>
                        <asp:ListItem Text="Quảng Nam" Value="Quảng Nam"></asp:ListItem>
                        <asp:ListItem Text="Quảng Ngãi" Value="Quảng Ngãi"></asp:ListItem>
                        <asp:ListItem Text="Quảng Ninh" Value="Quảng Ninh"></asp:ListItem>
                        <asp:ListItem Text="Quảng Trị" Value="Quảng Trị"></asp:ListItem>
                        <asp:ListItem Text="Sóc Trăng" Value="Sóc Trăng"></asp:ListItem>
                        <asp:ListItem Text="Sơn La" Value="Sơn La"></asp:ListItem>
                        <asp:ListItem Text="Tây Ninh" Value="Tây Ninh"></asp:ListItem>
                        <asp:ListItem Text="Thái Bình" Value="Thái Bình"></asp:ListItem>
                        <asp:ListItem Text="Thái Nguyên" Value="Thái Nguyên"></asp:ListItem>
                        <asp:ListItem Text="Thanh Hoá" Value="Thanh Hoá"></asp:ListItem>
                        <asp:ListItem Text="Thừa Thiên-Huế" Value="Thừa Thiên-Huế"></asp:ListItem>
                        <asp:ListItem Text="Tiền Giang" Value="Tiền Giang"></asp:ListItem>
                        <asp:ListItem Text="Trà Vinh" Value="Trà Vinh"></asp:ListItem>
                        <asp:ListItem Text="Tuyên Quang" Value="Tuyên Quang"></asp:ListItem>
                        <asp:ListItem Text="Vĩnh Long" Value="Vĩnh Long"></asp:ListItem>
                        <asp:ListItem Text="Vĩnh Phúc" Value="Vĩnh Phúc"></asp:ListItem>
                        <asp:ListItem Text="Yên Bái" Value="Yên Bái"></asp:ListItem>
                    </asp:DropDownList>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField  HeaderText="Huyện (*)">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_HUYEN" Width="250px" Text='<%# Bind("C_HUYEN") %>' runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvHuyen" runat="server" ErrorMessage="Huyện không thể rỗng"
                        ControlToValidate="txtC_HUYEN" SetFocusOnError="True" ValidationGroup="vPOST_FAQG1"
                        Display="Dynamic">*</asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField  HeaderText="Địa chỉ hiện tại (*)">
                <InsertItemTemplate>
                    <asp:DropDownList ID="ddlDCHT" SelectedValue='<%# Bind("C_DIA_CHI_HIEN_TAI") %>'
                        runat="server" Width="160">
                        <asp:ListItem Text="An Giang" Value="An Giang"></asp:ListItem>
                        <asp:ListItem Text="Bà Rịa-Vũng Tàu" Value="Bà Rịa-Vũng Tàu"></asp:ListItem>
                        <asp:ListItem Text="Bạc Liêu" Value="Bạc Liêu"></asp:ListItem>
                        <asp:ListItem Text="Bắc Cạn" Value="Bắc Cạn"></asp:ListItem>
                        <asp:ListItem Text="Bắc Giang" Value="Bắc Giang"></asp:ListItem>
                        <asp:ListItem Text="Bắc Ninh" Value="Bắc Ninh"></asp:ListItem>
                        <asp:ListItem Text="Bến Tre" Value="Bến Tre"></asp:ListItem>
                        <asp:ListItem Text="Bình Dương" Value="Bình Dương"></asp:ListItem>
                        <asp:ListItem Text="Bình Định" Value="Bình Định"></asp:ListItem>
                        <asp:ListItem Text="Bình Phước" Value="Bình Phước"></asp:ListItem>
                        <asp:ListItem Text="Bình Thuận" Value="Bình Thuận"></asp:ListItem>
                        <asp:ListItem Text="Cà Mau" Value="Cà Mau"></asp:ListItem>
                        <asp:ListItem Text="Cao Bằng" Value="Cao Bằng"></asp:ListItem>
                        <asp:ListItem Text="Cần Thơ" Value="Cần Thơ"></asp:ListItem>
                        <asp:ListItem Text="Đà Nẵng" Value="Đà Nẵng"></asp:ListItem>
                        <asp:ListItem Text="Đắk Lắk" Value="Đắk Lắk"></asp:ListItem>
                        <asp:ListItem Text="Đắk Nông" Value="Đắk Nông"></asp:ListItem>
                        <asp:ListItem Text="Điện Biên" Value="Điện Biên"></asp:ListItem>
                        <asp:ListItem Text="Đồng Nai" Value="Đồng Nai"></asp:ListItem>
                        <asp:ListItem Text="Đồng Tháp" Value="Đồng Tháp"></asp:ListItem>
                        <asp:ListItem Text="Gia Lai" Value="Gia Lai"></asp:ListItem>
                        <asp:ListItem Text="Hà Giang" Value="Hà Giang"></asp:ListItem>
                        <asp:ListItem Text="Hà Nam" Value="Hà Nam"></asp:ListItem>
                        <asp:ListItem Text="Hà Nội" Value="Hà Nội"></asp:ListItem>
                        <asp:ListItem Text="Hà Tĩnh" Value="Hà Tĩnh"></asp:ListItem>
                        <asp:ListItem Text="Hải Dương" Value="Hải Dương"></asp:ListItem>
                        <asp:ListItem Text="Hải Phòng" Value="Hải Phòng"></asp:ListItem>
                        <asp:ListItem Text="Hậu Giang" Value="Hậu Giang"></asp:ListItem>
                        <asp:ListItem Text="Hòa Bình" Value="Hòa Bình"></asp:ListItem>
                        <asp:ListItem Text="Thành phố Hồ Chí Minh" Value="Thành phố Hồ Chí Minh"></asp:ListItem>
                        <asp:ListItem Text="Hưng Yên" Value="Hưng Yên"></asp:ListItem>
                        <asp:ListItem Text="Khánh Hoà" Value="Khánh Hoà"></asp:ListItem>
                        <asp:ListItem Text="Kiên Giang" Value="Kiên Giang"></asp:ListItem>
                        <asp:ListItem Text="Kon Tum" Value="Kon Tum"></asp:ListItem>
                        <asp:ListItem Text="Lai Châu" Value="Lai Châu"></asp:ListItem>
                        <asp:ListItem Text="Lạng Sơn" Value="Lạng Sơn"></asp:ListItem>
                        <asp:ListItem Text="Lào Cai" Value="Lào Cai"></asp:ListItem>
                        <asp:ListItem Text="Lâm Đồng" Value="Lâm Đồng"></asp:ListItem>
                        <asp:ListItem Text="Long An" Value="Long An"></asp:ListItem>
                        <asp:ListItem Text="Nam Định" Value="Nam Định"></asp:ListItem>
                        <asp:ListItem Text="Nghệ An" Value="Nghệ An"></asp:ListItem>
                        <asp:ListItem Text="Ninh Bình" Value="Ninh Bình"></asp:ListItem>
                        <asp:ListItem Text="Ninh Thuận" Value="Ninh Thuận"></asp:ListItem>
                        <asp:ListItem Text="Phú Thọ" Value="Phú Thọ"></asp:ListItem>
                        <asp:ListItem Text="Phú Yên" Value="Phú Yên"></asp:ListItem>
                        <asp:ListItem Text="Quảng Bình" Value="Quảng Bình"></asp:ListItem>
                        <asp:ListItem Text="Quảng Nam" Value="Quảng Nam"></asp:ListItem>
                        <asp:ListItem Text="Quảng Ngãi" Value="Quảng Ngãi"></asp:ListItem>
                        <asp:ListItem Text="Quảng Ninh" Value="Quảng Ninh"></asp:ListItem>
                        <asp:ListItem Text="Quảng Trị" Value="Quảng Trị"></asp:ListItem>
                        <asp:ListItem Text="Sóc Trăng" Value="Sóc Trăng"></asp:ListItem>
                        <asp:ListItem Text="Sơn La" Value="Sơn La"></asp:ListItem>
                        <asp:ListItem Text="Tây Ninh" Value="Tây Ninh"></asp:ListItem>
                        <asp:ListItem Text="Thái Bình" Value="Thái Bình"></asp:ListItem>
                        <asp:ListItem Text="Thái Nguyên" Value="Thái Nguyên"></asp:ListItem>
                        <asp:ListItem Text="Thanh Hoá" Value="Thanh Hoá"></asp:ListItem>
                        <asp:ListItem Text="Thừa Thiên-Huế" Value="Thừa Thiên-Huế"></asp:ListItem>
                        <asp:ListItem Text="Tiền Giang" Value="Tiền Giang"></asp:ListItem>
                        <asp:ListItem Text="Trà Vinh" Value="Trà Vinh"></asp:ListItem>
                        <asp:ListItem Text="Tuyên Quang" Value="Tuyên Quang"></asp:ListItem>
                        <asp:ListItem Text="Vĩnh Long" Value="Vĩnh Long"></asp:ListItem>
                        <asp:ListItem Text="Vĩnh Phúc" Value="Vĩnh Phúc"></asp:ListItem>
                        <asp:ListItem Text="Yên Bái" Value="Yên Bái"></asp:ListItem>
                    </asp:DropDownList>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Ngành đăng ký">
                <InsertItemTemplate>
                    <asp:DropDownList Width="160" Height="21" ID="ddlMenus" DataSourceID="FAQDataSource"
                        DataTextField="C_NAME" DataValueField="PK_MENU" runat="server" SelectedValue='<%# Bind("FK_NGANH") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Đơn vị">
                <InsertItemTemplate>
                    <asp:DropDownList Width="160" Height="21" ID="ddlDV" DataSourceID="DVDataSource"
                        DataTextField="C_NAME" DataValueField="PK_MENU" runat="server" SelectedValue='<%# Bind("FK_DON_VI") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField  HeaderText="Thời gian học tiếng Hàn (*)">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_THOI_GIAN_HOC" Width="154px" Text='<%# Bind("C_THOI_GIAN_HOC") %>'
                        runat="server"></asp:TextBox><span style="font-style: italic"> (tháng)</span>
                    <asp:RequiredFieldValidator ID="rfvThoigian" runat="server" ErrorMessage="Thời gian học không thể rỗng"
                        ControlToValidate="txtC_THOI_GIAN_HOC" SetFocusOnError="True" ValidationGroup="vPOST_FAQG1"
                        Display="Dynamic">*</asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="rvThoigian" runat="server" ControlToValidate="txtC_THOI_GIAN_HOC"
                        ErrorMessage="Thời gian học tiếng Hàn phải là chữ số >=0" ValidationGroup="vPOST_FAQG1"
                        MaximumValue="9999999999" MinimumValue="0" SetFocusOnError="True" Type="Double"
                        Display="Dynamic">*</asp:RangeValidator>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField  HeaderText="Cơ sở đào tạo (*)">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_CO_SO_DAO_TAO" Width="250px" Text='<%# Bind("C_CO_SO_DAO_TAO") %>'
                        runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCS" runat="server" ErrorMessage="Cơ sở đào tạo không thể rỗng"
                        ControlToValidate="txtC_CO_SO_DAO_TAO" SetFocusOnError="True" ValidationGroup="vPOST_FAQG1"
                        Display="Dynamic">*</asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField  HeaderText="Điện thoại cố định (*)">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_PHONE" Width="250px" Text='<%# Bind("C_PHONE") %>' runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ErrorMessage="Điện thoại cố định không thể rỗng"
                        ControlToValidate="txtC_PHONE" SetFocusOnError="True" ValidationGroup="vPOST_FAQG1"
                        Display="Dynamic">*</asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField  HeaderText="Điện thoại di dộng (*)">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_MOBILE" Width="250px" Text='<%# Bind("C_MOBILE") %>' runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvMb" runat="server" ErrorMessage="Điện thoại di động không thể rỗng"
                        ControlToValidate="txtC_MOBILE" SetFocusOnError="True" ValidationGroup="vPOST_FAQG1"
                        Display="Dynamic">*</asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField  HeaderText="Địa chỉ báo tin (*)">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_DIA_CHI_BAO_TIN" Width="250px" Text='<%# Bind("C_DIA_CHI_BAO_TIN") %>'
                        runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvdcbt" runat="server" ErrorMessage="Địa chỉ báo tin không thể rỗng"
                        ControlToValidate="txtC_DIA_CHI_BAO_TIN" SetFocusOnError="True" ValidationGroup="vPOST_FAQG1"
                        Display="Dynamic">*</asp:RequiredFieldValidator>
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
    <%= CMS.Lang.GetKey("Dang-ky-kiem-tra-tieng-han.ascx", "Register")%>
</asp:Panel>
<asp:ValidationSummary ID="vsPOST_FAQ" ValidationGroup="vPOST_FAQG1" ShowSummary="false"
     HeaderText="Vui lòng kiểm tra lại :" runat="server"
    ShowMessageBox="true" />
<asp:SqlDataSource ID="DataSourceRegister" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    InsertCommand="INSERT INTO T_DK(C_HO_TEN,C_NGAY_SINH,C_CMND,C_TINH,C_HUYEN,C_DIA_CHI_HIEN_TAI,C_THOI_GIAN_HOC,C_CO_SO_DAO_TAO,C_PHONE,C_MOBILE,C_DIA_CHI_BAO_TIN,C_STATUS,FK_NGANH,FK_DON_VI,C_NGAY_DK) 
                         VALUES(@C_HO_TEN,@C_NGAY_SINH,@C_CMND,@C_TINH,@C_HUYEN,@C_DIA_CHI_HIEN_TAI,@C_THOI_GIAN_HOC,@C_CO_SO_DAO_TAO,@C_PHONE,@C_MOBILE,@C_DIA_CHI_BAO_TIN,0,@FK_NGANH,@FK_DON_VI,GETDATE())">
    <InsertParameters>
        <asp:Parameter Name="C_HO_TEN" DefaultValue="" Type="String" />
        <asp:Parameter Name="C_NGAY_SINH" />
        <asp:Parameter Name="C_NGAY_DK" />
        <asp:Parameter Name="C_CMND" />
        <asp:Parameter Name="C_TINH" />
        <asp:Parameter Name="C_HUYEN" />
        <asp:Parameter Name="C_DIA_CHI_HIEN_TAI" />
        <asp:Parameter Name="C_THOI_GIAN_HOC" />
        <asp:Parameter Name="C_CO_SO_DAO_TAO" />
        <asp:Parameter Name="C_PHONE" />
        <asp:Parameter Name="C_MOBILE" />
        <asp:Parameter Name="C_DIA_CHI_BAO_TIN" />
        <asp:Parameter Name="FK_NGANH" />
        <asp:Parameter Name="FK_DON_VI" />
    </InsertParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="FAQDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT * FROM T_MENU where C_STATUS=1 and C_PARENT=298"></asp:SqlDataSource>
<asp:SqlDataSource ID="DVDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT * FROM T_MENU where C_STATUS=1 and C_PARENT=302"></asp:SqlDataSource>
