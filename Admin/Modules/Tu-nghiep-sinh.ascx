<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Tu-nghiep-sinh.ascx.cs"
    Inherits="Admin_Modules_Tu_nghiep_sinh" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %>
<%@ Register Assembly="RadEditor.Net2" Namespace="Telerik.WebControls" TagPrefix="radE" %>
<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>
<asp:DetailsView ID="dvRegister" runat="server" DataSourceID="RegisterDataSource"
    AutoGenerateRows="False" DataKeyNames="PK_TNS" Width="100%" DefaultMode="Insert"
    HorizontalAlign="Center" HeaderText="Thêm mới" OnItemCommand="dvRegister_ItemCommand"
    OnItemInserted="dvRegister_ItemInserted" OnItemInserting="dvRegister_ItemInserting"
    OnItemUpdated="dvRegister_ItemUpdated" OnItemUpdating="dvRegister_ItemUpdating">
    <Fields>
        <asp:TemplateField HeaderText="Họ tên">
            <EditItemTemplate>
                <asp:TextBox ID="txtHoten" Width="300px" runat="server" Text='<%# Bind("C_HO_TEN") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtHoten" Width="300px" runat="server" Text='<%# Bind("C_HO_TEN") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Ngày sinh">
            <EditItemTemplate>
                <radCln:RadDatePicker MinDate="1900-01-01" ID="radNgaysinh" Width="89" SelectedDate='<%# Bind("C_NGAY_SINH") %>'
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
                <asp:TextBox ID="txtGT" Width="300px" runat="server" Text='<%# Bind("C_GIOI_TINH") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtGT" Width="300px" runat="server" Text='<%# Bind("C_GIOI_TINH") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Địa chỉ">
            <EditItemTemplate>
                <asp:TextBox ID="txtDiachi" Width="300px" runat="server" Text='<%# Bind("C_DIA_CHI") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtDiachi" Width="300px" runat="server" Text='<%# Bind("C_DIA_CHI") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Nghề nghiệp">
            <EditItemTemplate>
                <asp:TextBox ID="txtNN" Width="300px" runat="server" Text='<%# Bind("C_NGHE_NGHIEP") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtNN" Width="300px" runat="server" Text='<%# Bind("C_NGHE_NGHIEP") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Kinh nghiệm">
            <EditItemTemplate>
                <asp:TextBox ID="txtC_KINH_NGHIEM" Width="300px" runat="server" Text='<%# Bind("C_KINH_NGHIEM") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtC_KINH_NGHIEM" Width="300px" runat="server" Text='<%# Bind("C_KINH_NGHIEM") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Bằng cấp">
            <EditItemTemplate>
                <asp:TextBox ID="txtC_BANG_CAP" Width="300px" runat="server" Text='<%# Bind("C_BANG_CAP") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtC_BANG_CAP" Width="300px" runat="server" Text='<%# Bind("C_BANG_CAP") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Trình độ ngoại ngữ">
            <EditItemTemplate>
                <asp:TextBox ID="txtTDNN" Width="300px" runat="server" Text='<%# Bind("C_TRINH_DO_NN") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtTDNN" Width="300px" runat="server" Text='<%# Bind("C_TRINH_DO_NN") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Nguyện vọng đăng ký">
            <EditItemTemplate>
                <asp:TextBox ID="txtNV" Width="300px" TextMode="MultiLine" Columns="30" Height="50"
                    runat="server" Text='<%# Bind("C_NGUYEN_VONG") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtNV" Width="300px" TextMode="MultiLine" Columns="30" Height="50"
                    runat="server" Text='<%# Bind("C_NGUYEN_VONG") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Thời gian làm việc">
            <EditItemTemplate>
                <asp:TextBox ID="txtTGLV" Width="300px" runat="server" Text='<%# Bind("C_THOI_GIAN_LV") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtTGLV" Width="300px" runat="server" Text='<%# Bind("C_THOI_GIAN_LV") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Mức lương yêu cầu">
            <EditItemTemplate>
                <asp:TextBox ID="txtC_MUC_LUONG_MONG_MUON" Width="300px" runat="server" Text='<%# Bind("C_MUC_LUONG_YC") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtC_MUC_LUONG_MONG_MUON" Width="300px" runat="server" Text='<%# Bind("C_MUC_LUONG_YC") %>'></asp:TextBox>
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
    SelectCommand="select PK_TNS, C_HO_TEN, C_NGAY_SINH, C_GIOI_TINH, C_DIA_CHI, C_NGHE_NGHIEP, C_KINH_NGHIEM, C_BANG_CAP, C_TRINH_DO_NN, C_NGUYEN_VONG, 
                      C_THOI_GIAN_LV, C_MUC_LUONG_YC,CONVERT(INT,C_STATUS) AS 'C_STATUS' from T_TNS
 WHERE PK_TNS=@PK_TNS" InsertCommand="INSERT INTO T_TNS(C_HO_TEN, C_NGAY_SINH, C_GIOI_TINH, C_DIA_CHI, C_NGHE_NGHIEP, C_KINH_NGHIEM, C_BANG_CAP, C_TRINH_DO_NN, C_NGUYEN_VONG, 
                      C_THOI_GIAN_LV, C_MUC_LUONG_YC,C_STATUS) 
                              VALUES(@C_HO_TEN, @C_NGAY_SINH, @C_GIOI_TINH, @C_DIA_CHI, @C_NGHE_NGHIEP, @C_KINH_NGHIEM, @C_BANG_CAP, @C_TRINH_DO_NN, @C_NGUYEN_VONG, 
                      @C_THOI_GIAN_LV, @C_MUC_LUONG_YC, @C_STATUS)" UpdateCommand="UPDATE T_TNS SET C_HO_TEN=@C_HO_TEN, C_NGAY_SINH=@C_NGAY_SINH, C_GIOI_TINH=@C_GIOI_TINH, C_DIA_CHI=@C_DIA_CHI, C_NGHE_NGHIEP=@C_NGHE_NGHIEP, 
                C_KINH_NGHIEM=@C_KINH_NGHIEM, C_BANG_CAP=@C_BANG_CAP, C_TRINH_DO_NN=@C_TRINH_DO_NN, C_NGUYEN_VONG=@C_NGUYEN_VONG, 
                      C_THOI_GIAN_LV=@C_THOI_GIAN_LV, C_MUC_LUONG_YC=@C_MUC_LUONG_YC, C_STATUS=@C_STATUS WHERE PK_TNS=@PK_TNS">
    <SelectParameters>
        <asp:QueryStringParameter Name="PK_TNS" QueryStringField="fID" DefaultValue="0" Type="Int32" />
    </SelectParameters>
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
    <UpdateParameters>
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
    </UpdateParameters>
</asp:SqlDataSource>
