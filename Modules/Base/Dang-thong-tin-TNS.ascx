<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Dang-thong-tin-TNS.ascx.cs"
    Inherits="Modules_Base_Dang_thong_tin_TNS" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %>
<%@ Register Assembly="RadEditor.Net2" Namespace="Telerik.WebControls" TagPrefix="radE" %>
<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>
<asp:Panel ID="pnRegister" runat="server">
    <asp:DetailsView ID="dvPOST_TD" runat="server" DataSourceID="POST_TDDataSource" DataKeyNames="PK_TNS"
        SkinID="FeedBack" AutoGenerateRows="False" DefaultMode="Insert"
        OnItemCommand="dvPOST_TD_ItemCommand" Width="95%" HeaderText="" CaptionAlign="Top"
        HorizontalAlign="Center" OnItemInserted="dvPOST_TD_ItemInserted" OnItemInserting="dvPOST_TD_ItemInserting"
        GridLines="None" OnPreRender="dvPOST_TD_PreRender">
        <Fields>
            <asp:TemplateField HeaderText="Họ tên">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtHoten" Width="300px" runat="server" Text='<%# Bind("C_HO_TEN") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCC_HO_TEN" runat="server" ErrorMessage="Bạn chưa nhập họ tên"
                        ControlToValidate="txtHoten" SetFocusOnError="True" ValidationGroup="vPOST_FAQG1"
                        Display="Dynamic">*</asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Ngày sinh">
                <InsertItemTemplate>
                    <radCln:RadDatePicker MinDate="1900-01-01" ID="radNgaysinh" Width="89" SelectedDate='<%# Bind("C_NGAY_SINH") %>'
                        runat="server" OnLoad="radNgaysinh_Load">
                    </radCln:RadDatePicker>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Giới tính">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtGT" Width="300px" runat="server" Text='<%# Bind("C_GIOI_TINH") %>'></asp:TextBox>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Địa chỉ">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtDiachi" Width="300px" runat="server" Text='<%# Bind("C_DIA_CHI") %>'></asp:TextBox>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nghề nghiệp">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtNN" Width="300px" runat="server" Text='<%# Bind("C_NGHE_NGHIEP") %>'></asp:TextBox>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kinh nghiệm">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_KINH_NGHIEM" Width="300px" runat="server" Text='<%# Bind("C_KINH_NGHIEM") %>'></asp:TextBox>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Bằng cấp">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_BANG_CAP" Width="300px" runat="server" Text='<%# Bind("C_BANG_CAP") %>'></asp:TextBox>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Trình độ ngoại ngữ">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtTDNN" Width="300px" runat="server" Text='<%# Bind("C_TRINH_DO_NN") %>'></asp:TextBox>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nguyện vọng đăng ký">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtNV" Width="300px" TextMode="MultiLine" Columns="30" Height="50"
                        runat="server" Text='<%# Bind("C_NGUYEN_VONG") %>'></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Thời gian làm việc">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtTGLV" Width="300px" runat="server" Text='<%# Bind("C_THOI_GIAN_LV") %>'></asp:TextBox>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mức lương yêu cầu">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_MUC_LUONG_MONG_MUON" Width="300px" runat="server" Text='<%# Bind("C_MUC_LUONG_YC") %>'></asp:TextBox>
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
    
    Bạn đã đăng tin thành công !!
</asp:Panel>
<asp:ValidationSummary ID="vsPOST_FAQ" ValidationGroup="vPOST_FAQG1" ShowSummary="false"
     HeaderText="Vui lòng kiểm tra lại :" runat="server"
    ShowMessageBox="true" />
<asp:SqlDataSource ID="POST_TDDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    InsertCommand="INSERT INTO T_TNS(C_HO_TEN, C_NGAY_SINH, C_GIOI_TINH, C_DIA_CHI, C_NGHE_NGHIEP, C_KINH_NGHIEM, C_BANG_CAP, C_TRINH_DO_NN, C_NGUYEN_VONG, 
                      C_THOI_GIAN_LV, C_MUC_LUONG_YC,C_STATUS) 
                              VALUES(@C_HO_TEN, @C_NGAY_SINH, @C_GIOI_TINH, @C_DIA_CHI, @C_NGHE_NGHIEP, @C_KINH_NGHIEM, @C_BANG_CAP, @C_TRINH_DO_NN, @C_NGUYEN_VONG, 
                      @C_THOI_GIAN_LV, @C_MUC_LUONG_YC, 0)
    ">
    <InsertParameters>
        <asp:Parameter Name="C_HO_TEN" ConvertEmptyStringToNull="false" DefaultValue="" Type="String" />
        <asp:Parameter Name="C_NGAY_SINH" Type="dateTime" />
        <asp:Parameter Name="C_GIOI_TINH" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_NGHE_NGHIEP" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_DIA_CHI" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_KINH_NGHIEM" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_BANG_CAP" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_TRINH_DO_NN" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_NGUYEN_VONG" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_THOI_GIAN_LV" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_MUC_LUONG_YC" ConvertEmptyStringToNull="false" DefaultValue=""
            Type="String" />
        <asp:Parameter Name="C_STATUS" Type="Int32" />
    </InsertParameters>
</asp:SqlDataSource>
