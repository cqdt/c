<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Register_Korea.ascx.cs"
    Inherits="Admin_Modules_Register_Korea" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %>
<%@ Register Assembly="RadEditor.Net2" Namespace="Telerik.WebControls" TagPrefix="radE" %>
<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>
<asp:DetailsView ID="dvRegister" runat="server" DataSourceID="RegisterDataSource"
    AutoGenerateRows="False" DataKeyNames="PK_DK" Width="100%" DefaultMode="Insert"
    HorizontalAlign="Center" HeaderText="Thêm mới" OnItemCommand="dvRegister_ItemCommand"
    OnItemInserted="dvRegister_ItemInserted" OnItemInserting="dvRegister_ItemInserting"
    OnItemUpdated="dvRegister_ItemUpdated" OnItemUpdating="dvRegister_ItemUpdating">
    <Fields>
        <asp:TemplateField HeaderText="Họ tên">
            <EditItemTemplate>
                <asp:TextBox ID="txtName" Width="400px" runat="server" Text='<%# Bind("C_HO_TEN") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtName" Width="400px" runat="server" Text='<%# Bind("C_HO_TEN") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Ngày sinh">
            <EditItemTemplate>
                <radCln:RadDatePicker  MinDate="1900-01-01" ID="raddNgaysinh" SelectedDate='<%# Bind("C_NGAY_SINH") %>'
                    runat="server">
                </radCln:RadDatePicker>
            </EditItemTemplate>
            <InsertItemTemplate>
                <radCln:RadDatePicker  MinDate="1900-01-01" ID="raddNgaysinh" SelectedDate='<%# Bind("C_NGAY_SINH") %>'
                    runat="server" OnLoad="raddNgaysinh_Load">
                </radCln:RadDatePicker>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Chứng minh nhân dân">
            <EditItemTemplate>
                <asp:TextBox ID="txtCMND" Width="400px" runat="server" Text='<%# Bind("C_CMND") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtCMND" Width="400px" runat="server" Text='<%# Bind("C_CMND") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Tỉnh">
            <EditItemTemplate>
                <asp:TextBox ID="txtTinh" Width="400px" runat="server" Text='<%# Bind("C_TINH") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtTinh" Width="400px" runat="server" Text='<%# Bind("C_TINH") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Huyện">
            <EditItemTemplate>
                <asp:TextBox ID="txtHuyen" Width="400px" runat="server" Text='<%# Bind("C_HUYEN") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtHuyen" Width="400px" runat="server" Text='<%# Bind("C_HUYEN") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Địa chỉ hiện tại">
            <EditItemTemplate>
                <asp:TextBox ID="txtDiachi" Width="400px" runat="server" Text='<%# Bind("C_DIA_CHI_HIEN_TAI") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtDiachi" Width="400px" runat="server" Text='<%# Bind("C_DIA_CHI_HIEN_TAI") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Thời gian học">
            <EditItemTemplate>
                <asp:TextBox ID="txtThoigian" Width="400px" runat="server" Text='<%# Bind("C_THOI_GIAN_HOC") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtThoigian" Width="400px" runat="server" Text='<%# Bind("C_THOI_GIAN_HOC") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Cơ sở đào tạo">
            <EditItemTemplate>
                <asp:TextBox ID="txtCosodt" Width="400px" runat="server" Text='<%# Bind("C_CO_SO_DAO_TAO") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtCosodt" Width="400px" runat="server" Text='<%# Bind("C_CO_SO_DAO_TAO") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Máy bàn">
            <EditItemTemplate>
                <asp:TextBox ID="txtPhone" Width="400px" runat="server" Text='<%# Bind("C_PHONE") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtPhone" Width="400px" runat="server" Text='<%# Bind("C_PHONE") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Di động">
            <EditItemTemplate>
                <asp:TextBox ID="txtMobile" Width="400px" runat="server" Text='<%# Bind("C_MOBILE") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtMobile" Width="400px" runat="server" Text='<%# Bind("C_MOBILE") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Địa chỉ báo tin">
            <EditItemTemplate>
                <asp:TextBox ID="txtBaotin" Width="400px" runat="server" Text='<%# Bind("C_DIA_CHI_BAO_TIN") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtBaotin" Width="400px" runat="server" Text='<%# Bind("C_DIA_CHI_BAO_TIN") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <%-- <asp:TemplateField HeaderText="Số báo danh">
            <EditItemTemplate>
               <asp:TextBox ID="txtSBD" Width="400px" runat="server" Text='<%# Bind("C_SBD") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="txtSBD" Width="400px" runat="server" Text='<%# Bind("C_SBD") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>    <asp:TemplateField HeaderText="Điểm">
            <EditItemTemplate>
               <asp:TextBox ID="txtDiem" Width="400px" runat="server" Text='<%# Bind("C_DIEM") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox ID="txtDiem" Width="400px" runat="server" Text='<%# Bind("C_DIEM") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>   --%>
        <asp:TemplateField HeaderText="Ngành">
            <EditItemTemplate>
                <asp:DropDownList ID="ddlNganh" SelectedValue='<%# Bind("FK_NGANH") %>' DataSourceID="nganhDataSource"
                    DataTextField="C_NAME" DataValueField="PK_MENU" runat="server">
                </asp:DropDownList>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:DropDownList ID="ddlNganh" SelectedValue='<%# Bind("FK_NGANH") %>' DataSourceID="nganhDataSource"
                    DataTextField="C_NAME" DataValueField="PK_MENU" runat="server">
                </asp:DropDownList>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Đơn vị">
            <EditItemTemplate>
                <asp:DropDownList ID="ddlDV" SelectedValue='<%# Bind("FK_DON_VI") %>' DataSourceID="DVDataSource"
                    DataTextField="C_NAME" DataValueField="PK_MENU" runat="server">
                </asp:DropDownList>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:DropDownList ID="ddlDV" SelectedValue='<%# Bind("FK_DON_VI") %>' DataSourceID="DVDataSource"
                    DataTextField="C_NAME" DataValueField="PK_MENU" runat="server">
                </asp:DropDownList>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Ngày đăng ký">
            <EditItemTemplate>
                <radCln:RadDateTimePicker ID="raddNgayDK" SelectedDate='<%# Bind("C_NGAY_DK") %>'
                    runat="server">
                </radCln:RadDateTimePicker>
            </EditItemTemplate>
            <InsertItemTemplate>
                <radCln:RadDateTimePicker ID="raddNgayDK" SelectedDate='<%# Bind("C_NGAY_DK") %>'
                    runat="server" OnLoad="raddNgayDK_Load">
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
<asp:SqlDataSource ID="nganhDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT * FROM T_MENU where c_status=1 and C_PARENT=298"></asp:SqlDataSource>
<asp:SqlDataSource ID="DVDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT * FROM T_MENU where c_status=1 and C_PARENT=302"></asp:SqlDataSource>
<asp:SqlDataSource ID="RegisterDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT  PK_DK,FK_NGANH,FK_DON_VI,C_NGAY_DK,C_HO_TEN, C_NGAY_SINH, C_CMND, C_TINH, C_HUYEN, C_DIA_CHI_HIEN_TAI, C_THOI_GIAN_HOC, C_CO_SO_DAO_TAO, C_PHONE, 
                      C_MOBILE, C_DIA_CHI_BAO_TIN, CONVERT(INT,C_STATUS) AS 'C_STATUS' FROM T_DK WHERE PK_DK=@PK_DK"
    InsertCommand="INSERT INTO T_DK(FK_NGANH,FK_DON_VI,C_HO_TEN,C_NGAY_SINH,C_NGAY_DK,C_CMND,C_TINH,C_HUYEN,C_DIA_CHI_HIEN_TAI, C_THOI_GIAN_HOC, C_CO_SO_DAO_TAO, C_PHONE,C_MOBILE, C_DIA_CHI_BAO_TIN, C_STATUS) 
                              VALUES(@FK_NGANH,@FK_DON_VI,@C_HO_TEN,@C_NGAY_SINH,@C_NGAY_DK,@C_CMND,@C_TINH,C_HUYEN,@C_DIA_CHI_HIEN_TAI, @C_THOI_GIAN_HOC, @C_CO_SO_DAO_TAO, @C_PHONE,@C_MOBILE, @C_DIA_CHI_BAO_TIN,@C_STATUS)"
    UpdateCommand="UPDATE T_DK SET FK_NGANH=@FK_NGANH,FK_DON_VI=@FK_DON_VI,C_HO_TEN=@C_HO_TEN,C_NGAY_SINH=@C_NGAY_SINH,C_NGAY_DK=@C_NGAY_DK,C_CMND=@C_CMND,C_TINH=@C_TINH,C_HUYEN=@C_HUYEN,C_DIA_CHI_HIEN_TAI=@C_DIA_CHI_HIEN_TAI, C_THOI_GIAN_HOC=@C_THOI_GIAN_HOC, C_CO_SO_DAO_TAO=@C_CO_SO_DAO_TAO, C_PHONE=@C_PHONE,C_MOBILE=@C_MOBILE, C_DIA_CHI_BAO_TIN=@C_DIA_CHI_BAO_TIN,C_STATUS=@C_STATUS WHERE PK_DK=@PK_DK">
    <SelectParameters>
        <asp:QueryStringParameter Name="PK_DK" QueryStringField="fID" DefaultValue="0" Type="Int32" />
    </SelectParameters>
    <InsertParameters>
        <asp:Parameter Name="C_HO_TEN" ConvertEmptyStringToNull="false" DefaultValue="" Type="String" />
        <asp:Parameter Name="C_NGAY_SINH" Type="dateTime" />
        <asp:Parameter Name="C_NGAY_DK" Type="dateTime" />
        <asp:Parameter Name="C_CMND" ConvertEmptyStringToNull="false" Type="String" />
        <asp:Parameter Name="C_TINH" ConvertEmptyStringToNull="false" Type="String" />
        <asp:Parameter Name="C_HUYEN" ConvertEmptyStringToNull="false" Type="String" />
        <asp:Parameter Name="C_DIA_CHI_HIEN_TAI" ConvertEmptyStringToNull="false" Type="String" />
        <asp:Parameter Name="C_THOI_GIAN_HOC" ConvertEmptyStringToNull="false" Type="String" />
        <asp:Parameter Name="C_CO_SO_DAO_TAO" ConvertEmptyStringToNull="false" Type="String" />
        <asp:Parameter Name="C_PHONE" ConvertEmptyStringToNull="false" Type="String" />
        <asp:Parameter Name="C_MOBILE" ConvertEmptyStringToNull="false" Type="String" />
        <asp:Parameter Name="C_DIA_CHI_BAO_TIN" ConvertEmptyStringToNull="false" Type="String" />
        <asp:Parameter Name="C_STATUS" Type="Int32" />
        <asp:Parameter Name="FK_NGANH" Type="Int32" />
        <asp:Parameter Name="FK_DON_VI" Type="Int32" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="C_HO_TEN" ConvertEmptyStringToNull="false" DefaultValue="" Type="String" />
        <asp:Parameter Name="C_NGAY_SINH" Type="dateTime" />
        <asp:Parameter Name="C_NGAY_DK" Type="dateTime" />
        <asp:Parameter Name="C_CMND" ConvertEmptyStringToNull="false" Type="String" />
        <asp:Parameter Name="C_TINH" ConvertEmptyStringToNull="false" Type="String" />
        <asp:Parameter Name="C_HUYEN" ConvertEmptyStringToNull="false" Type="String" />
        <asp:Parameter Name="C_DIA_CHI_HIEN_TAI" ConvertEmptyStringToNull="false" Type="String" />
        <asp:Parameter Name="C_THOI_GIAN_HOC" ConvertEmptyStringToNull="false" Type="String" />
        <asp:Parameter Name="C_CO_SO_DAO_TAO" ConvertEmptyStringToNull="false" Type="String" />
        <asp:Parameter Name="C_PHONE" ConvertEmptyStringToNull="false" Type="String" />
        <asp:Parameter Name="C_MOBILE" ConvertEmptyStringToNull="false" Type="String" />
        <asp:Parameter Name="C_DIA_CHI_BAO_TIN" ConvertEmptyStringToNull="false" Type="String" />
        <asp:Parameter Name="C_STATUS" Type="Int32" />
        <asp:Parameter Name="FK_NGANH" Type="Int32" />
        <asp:Parameter Name="FK_DON_VI" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
