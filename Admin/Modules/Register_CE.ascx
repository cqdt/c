<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Register_CE.ascx.cs" Inherits="Admin_Modules_Register_CE" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %>
<%@ Register Assembly="RadEditor.Net2" Namespace="Telerik.WebControls" TagPrefix="radE" %>
<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>
<asp:DetailsView ID="dvRegister" runat="server" DataSourceID="RegisterDataSource"
    AutoGenerateRows="False" DataKeyNames="PK_CE" Width="100%" DefaultMode="Insert"
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
                <radCln:RadDatePicker MinDate="1900-01-01" ID="raddNgaysinh" Width="89" SelectedDate='<%# Bind("C_NGAY_SINH") %>'
                    runat="server">
                </radCln:RadDatePicker>
            </EditItemTemplate>
            <InsertItemTemplate>
                <radCln:RadDatePicker MinDate="1900-01-01" ID="raddNgaysinh" Width="89" SelectedDate='<%# Bind("C_NGAY_SINH") %>'
                    runat="server" OnLoad="raddNgaysinh_Load">
                </radCln:RadDatePicker>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Địa chỉ">
            <EditItemTemplate>
                <asp:TextBox ID="txtDiachi" Width="400px" runat="server" Text='<%# Bind("C_DIA_CHI") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtDiachi" Width="400px" runat="server" Text='<%# Bind("C_DIA_CHI") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Số hộ chiếu">
            <EditItemTemplate>
                <asp:TextBox ID="txtSohochieu" Width="400px" runat="server" Text='<%# Bind("C_SO_HO_CHIEU") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtSohochieu" Width="400px" runat="server" Text='<%# Bind("C_SO_HO_CHIEU") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Trung tâm đào tạo">
            <EditItemTemplate>
                <asp:DropDownList ID="ddlMenus" DataSourceID="FAQ1DataSource" DataTextField="C_TEN"
                    SelectedValue='<%# Bind("FK_TT") %>' DataValueField="PK_TT" runat="server">
                </asp:DropDownList>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:DropDownList ID="ddlMenus" DataSourceID="FAQ1DataSource" DataTextField="C_TEN"
                    SelectedValue='<%# Bind("FK_TT") %>' DataValueField="PK_TT" runat="server">
                </asp:DropDownList>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Số báo danh">
            <EditItemTemplate>
                <asp:TextBox ID="txtSBD" Width="400px" runat="server" Text='<%# Bind("C_MA_SO_LAO_DONG") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtSBD" Width="400px" runat="server" Text='<%# Bind("C_MA_SO_LAO_DONG") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Số chứng chỉ">
            <EditItemTemplate>
                <asp:TextBox ID="txtSocc" Width="400px" runat="server" Text='<%# Bind("C_SO_CHUNG_CHI") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="txtSocc" Width="400px" runat="server" Text='<%# Bind("C_SO_CHUNG_CHI") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Ngày cấp">
            <EditItemTemplate>
                <radCln:RadDatePicker MinDate="1900-01-01" ID="raddNgaycap" Width="89" SelectedDate='<%# Bind("C_NGAY_CAP") %>'
                    runat="server">
                </radCln:RadDatePicker>
            </EditItemTemplate>
            <InsertItemTemplate>
                <radCln:RadDatePicker MinDate="1900-01-01" ID="raddNgaycap" Width="89" SelectedDate='<%# Bind("C_NGAY_CAP") %>'
                    runat="server" OnLoad="raddNgaycap_Load">
                </radCln:RadDatePicker>
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
    SelectCommand="SELECT  PK_CE, C_HO_TEN,C_NAME, C_NGAY_SINH, C_MA_SO_LAO_DONG, C_DIA_CHI, C_SO_HO_CHIEU, FK_TT, C_SO_CHUNG_CHI, ISNULL(C_NGAY_CAP,GETDATE()) as 'C_NGAY_CAP',CONVERT(INT,C_STATUS) AS 'C_STATUS' FROM T_CE WHERE PK_CE=@PK_CE"
    InsertCommand="INSERT INTO T_CE(C_HO_TEN,C_NAME, C_NGAY_SINH, C_MA_SO_LAO_DONG, C_DIA_CHI, C_SO_HO_CHIEU, FK_TT,C_SO_CHUNG_CHI, C_NGAY_CAP,C_STATUS) 
                              VALUES(@C_HO_TEN,@C_NAME, @C_NGAY_SINH, @C_MA_SO_LAO_DONG, @C_DIA_CHI, @C_SO_HO_CHIEU, @FK_TT, @C_SO_CHUNG_CHI, @C_NGAY_CAP,@C_STATUS)"
    UpdateCommand="UPDATE T_CE SET C_HO_TEN=@C_HO_TEN,C_NAME=@C_NAME ,C_NGAY_SINH=ISNULL(@C_NGAY_SINH,C_NGAY_SINH), C_MA_SO_LAO_DONG=@C_MA_SO_LAO_DONG, C_DIA_CHI=@C_DIA_CHI, C_SO_HO_CHIEU=@C_SO_HO_CHIEU, FK_TT=@FK_TT, C_SO_CHUNG_CHI=@C_SO_CHUNG_CHI, C_NGAY_CAP=ISNULL(@C_NGAY_CAP,C_NGAY_CAP),C_STATUS=@C_STATUS WHERE PK_CE=@PK_CE">
    <SelectParameters>
        <asp:QueryStringParameter Name="PK_CE" QueryStringField="fID" DefaultValue="0" Type="Int32" />
    </SelectParameters>
    <InsertParameters>
        <asp:Parameter Name="C_HO_TEN" ConvertEmptyStringToNull="false" DefaultValue="" Type="String" />
        <asp:Parameter Name="C_NAME" ConvertEmptyStringToNull="false" DefaultValue="" Type="String" />
        <asp:Parameter Name="C_NGAY_SINH" Type="dateTime" />
        <asp:Parameter Name="C_MA_SO_LAO_DONG" ConvertEmptyStringToNull="false" Type="String" />
        <asp:Parameter Name="C_DIA_CHI" ConvertEmptyStringToNull="false" Type="String" />
        <asp:Parameter Name="C_SO_HO_CHIEU" ConvertEmptyStringToNull="false" Type="String" />
        <asp:Parameter Name="FK_TT" Type="Int32" />
        <asp:Parameter Name="C_SO_CHUNG_CHI" ConvertEmptyStringToNull="false" Type="String" />
        <asp:Parameter Name="C_NGAY_CAP" Type="dateTime" />
        <asp:Parameter Name="C_STATUS" Type="Int32" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="C_HO_TEN" ConvertEmptyStringToNull="false" DefaultValue="" Type="String" />
        <asp:Parameter Name="C_NAME" ConvertEmptyStringToNull="false" DefaultValue="" Type="String" />
        <asp:Parameter Name="C_NGAY_SINH" Type="dateTime" />
        <asp:Parameter Name="C_MA_SO_LAO_DONG" ConvertEmptyStringToNull="false" Type="String" />
        <asp:Parameter Name="C_DIA_CHI" ConvertEmptyStringToNull="false" Type="String" />
        <asp:Parameter Name="C_SO_HO_CHIEU" ConvertEmptyStringToNull="false" Type="String" />
        <asp:Parameter Name="FK_TT" Type="Int32" />
        <asp:Parameter Name="C_SO_CHUNG_CHI" ConvertEmptyStringToNull="false" Type="String" />
        <asp:Parameter Name="C_NGAY_CAP" Type="dateTime" />
        <asp:Parameter Name="C_STATUS" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="FAQ1DataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT * FROM T_TT where C_STATUS=1"></asp:SqlDataSource>
