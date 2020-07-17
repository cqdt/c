<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Tuyen-dung.ascx.cs" Inherits="Modules_Base_Tuyen_dung" %>
<%@ Register Namespace="CMS.Web.Controls" Assembly="CMS" TagPrefix="CMS" %> 
<%@ Register Assembly="RadEditor.Net2" Namespace="Telerik.WebControls" TagPrefix="radE" %>
<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>
  <asp:Panel ID="pnRegister" runat="server">
<asp:DetailsView ID="dvPOST_TD" runat="server" DataSourceID="POST_TDDataSource"
        DataKeyNames="PK_TUYEN_DUNG" SkinID="FeedBack" 
        AutoGenerateRows="False" DefaultMode="Insert" OnItemCommand="dvPOST_TD_ItemCommand"
        Width="95%" HeaderText="Đăng tin tuyển dụng" CaptionAlign="Top" 
        HorizontalAlign="Center" OnItemInserted="dvPOST_TD_ItemInserted" 
        OnItemInserting="dvPOST_TD_ItemInserting" GridLines="None" 
    onprerender="dvPOST_TD_PreRender">
        <Fields>
         <asp:TemplateField ShowHeader="false">
            <InsertItemTemplate>
                <b>Thông tin doanh nghiệp tuyển dụng </b>
            </InsertItemTemplate>          
            <ItemStyle HorizontalAlign="Center" />
        </asp:TemplateField>
            <asp:TemplateField  HeaderText="Công ty tuyển dụng (*)">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_TEN_CONG_TY" Width="250px" Text='<%# Bind("C_TEN_CONG_TY") %>' runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvC_TEN_CONG_TY" runat="server" ErrorMessage="Bạn chưa nhập Tên công ty" ControlToValidate="txtC_TEN_CONG_TY" SetFocusOnError="True" ValidationGroup="vPOST_FAQG1" Display="Dynamic">*</asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField  HeaderText="Tiêu đề tin tuyển dụng (*)">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_TITLE" Width="250px" Text='<%# Bind("C_TITLE") %>' runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvC_TITLE" runat="server" ErrorMessage="Bạn chưa nhập Tiêu đề tin tuyển dụng" ControlToValidate="txtC_TITLE" SetFocusOnError="True" ValidationGroup="vPOST_FAQG1" Display="Dynamic">*</asp:RequiredFieldValidator>
                    
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField  HeaderText="Địa chỉ(*)">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_DIA_CHI" Width="250px" Text='<%# Bind("C_DIA_CHI") %>' runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvC_DIA_CHI" runat="server" ErrorMessage="Bạn chưa nhập Địa chỉ" ControlToValidate="txtC_DIA_CHI" SetFocusOnError="True" ValidationGroup="vPOST_FAQG1" Display="Dynamic">*</asp:RequiredFieldValidator>
                    
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Mô tả công ty (*)">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_MO_TA" Width="250px" TextMode="MultiLine" Columns="30" Height="50" Text='<%# Bind("C_MO_TA") %>' runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvC_MO_TA" runat="server" ErrorMessage="Bạn chưa nhập Mô tả công ty" ControlToValidate="txtC_MO_TA" SetFocusOnError="True" ValidationGroup="vPOST_FAQG1" Display="Dynamic">*</asp:RequiredFieldValidator>
                    
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Điện thoại">
                <InsertItemTemplate>
                        <asp:TextBox ID="txtC_PHONE" Width="250px" Text='<%# Bind("C_PHONE") %>' runat="server"></asp:TextBox>                
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>             
            
            <asp:TemplateField  HeaderText="Quy mô" >
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_QUY_MO" Width="250px"  Text='<%# Bind("C_QUY_MO") %>' runat="server"></asp:TextBox>
                    
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
             <asp:TemplateField  HeaderText="Tiêu chí hoạt động" >
                <InsertItemTemplate>
                    <asp:TextBox ID="txtC_TIEU_CHI" Width="300" TextMode="MultiLine" Columns="50" Height="80" Text='<%# Bind("C_TIEU_CHI") %>' runat="server"></asp:TextBox>                    
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
              <asp:TemplateField HeaderText="Website">
                <InsertItemTemplate>
                        <asp:TextBox ID="txtC_WEBSITE" Width="250px" Text='<%# Bind("C_WEBSITE") %>' runat="server"></asp:TextBox>                
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>     
            
             <asp:TemplateField ShowHeader="false">
            <InsertItemTemplate>
                <b>Thông tin vị trí tuyển dụng</b>
            </InsertItemTemplate>          
            <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Chức danh/Vị trí">
                <InsertItemTemplate>
                        <asp:TextBox ID="txtC_VI_TRI" Width="250px" Text='<%# Bind("C_VI_TRI") %>' runat="server"></asp:TextBox>                
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>     
            <asp:TemplateField HeaderText="Số lượng tuyển">
                <InsertItemTemplate>
                        <asp:TextBox ID="txtC_SL_TUYEN" Width="250px" Text='<%# Bind("C_SL_TUYEN") %>' runat="server"></asp:TextBox>                
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>  
            
               <asp:TemplateField HeaderText="Lĩnh vực ngành nghề">
                <InsertItemTemplate>                        
                        <asp:TextBox ID="txtC_LINH_VUC" Width="250px" TextMode="MultiLine" Columns="30" Height="50" Text='<%# Bind("C_LINH_VUC") %>' runat="server"></asp:TextBox>                
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField> 
            <asp:TemplateField HeaderText="Địa điểm làm việc">
                <InsertItemTemplate>
                        <asp:TextBox ID="txtC_DIA_DIEM_LAM_VIEC" Width="250px" Text='<%# Bind("C_DIA_DIEM_LAM_VIEC") %>' runat="server"></asp:TextBox>                
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>  
            <asp:TemplateField  HeaderText="Mô tả việc làm" >
                 <InsertItemTemplate>
                   <radE:RadEditor ID="radeC_MO_TA_VIEC_LAM" Html='<%# Bind("C_MO_TA_VIEC_LAM") %>'  Width="300px" Height="80px" runat="server" ShowSubmitCancelButtons="False" ToolbarMode="Default" AllowThumbGeneration="True" DeleteDocumentsPaths="~/uploads/" DeleteFlashPaths="~/uploads/" DeleteImagesPaths="~/uploads/" DeleteMediaPaths="~/uploads/" DocumentsPaths="~/uploads/" FlashPaths="~/uploads/" ImagesPaths="~/uploads/" MediaPaths="~/uploads/" UploadDocumentsPaths="~/uploads/" UploadFlashPaths="~/uploads/" UploadImagesPaths="~/uploads/" UploadMediaPaths="~/uploads/" DocumentsFilters="*.doc,*.xls,*.ppt,*.txt,*.pdf" MaxImageSize="10240000" MaxDocumentSize="10240000" MaxFlashSize="10240000" ToolsFile="~/RadControls/Editor/ToolsFile1.xml">
                   </radE:RadEditor>                   
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField  HeaderText="Kỹ năng tối thiểu" >
                 <InsertItemTemplate>
                   <radE:RadEditor ID="radeC_KY_NANG" Html='<%# Bind("C_KY_NANG") %>'  Width="300px" Height="80px" runat="server" ShowSubmitCancelButtons="False" ToolbarMode="Default" AllowThumbGeneration="True" DeleteDocumentsPaths="~/uploads/" DeleteFlashPaths="~/uploads/" DeleteImagesPaths="~/uploads/" DeleteMediaPaths="~/uploads/" DocumentsPaths="~/uploads/" FlashPaths="~/uploads/" ImagesPaths="~/uploads/" MediaPaths="~/uploads/" UploadDocumentsPaths="~/uploads/" UploadFlashPaths="~/uploads/" UploadImagesPaths="~/uploads/" UploadMediaPaths="~/uploads/" DocumentsFilters="*.doc,*.xls,*.ppt,*.txt,*.pdf" MaxImageSize="10240000" MaxDocumentSize="10240000" MaxFlashSize="10240000" ToolsFile="~/RadControls/Editor/ToolsFile1.xml">
                   </radE:RadEditor>                   
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            
             <asp:TemplateField HeaderText="Trình độ tối thiểu">
                <InsertItemTemplate>
                        <asp:TextBox ID="txtC_TRINH_DO_TOI_THIEU" Width="250px" Text='<%# Bind("C_TRINH_DO_TOI_THIEU") %>' runat="server"></asp:TextBox>                
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>  
            <asp:TemplateField HeaderText="Kinh nghiệm yêu cầu">
                <InsertItemTemplate>
                        <asp:TextBox ID="txtC_KINH_NGHIEM" Width="250px" Text='<%# Bind("C_KINH_NGHIEM") %>' runat="server"></asp:TextBox>                
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Yêu cầu giới tính">
                <InsertItemTemplate>
                        <asp:TextBox ID="txtC_YC_GIOI_TINH" Width="250px" Text='<%# Bind("C_YC_GIOI_TINH") %>' runat="server"></asp:TextBox>                
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Hình thức làm việc">
                <InsertItemTemplate>
                        <asp:TextBox ID="txtC_HINH_THUC_LAM_VIEC" Width="250px" Text='<%# Bind("C_HINH_THUC_LAM_VIEC") %>' runat="server"></asp:TextBox>                
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Mức lương">
                <InsertItemTemplate>
                        <asp:TextBox ID="txtC_MUC_LUONG" Width="250px" Text='<%# Bind("C_MUC_LUONG") %>' runat="server"></asp:TextBox>                
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Thời gian thử việc">
                <InsertItemTemplate>
                        <asp:TextBox ID="txtC_THOI_GIAN_THU_VIEC" Width="250px" Text='<%# Bind("C_THOI_GIAN_THU_VIEC") %>' runat="server"></asp:TextBox>                
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            
            <asp:TemplateField  HeaderText="Các chế độ khác" >
                 <InsertItemTemplate>
                   <radE:RadEditor ID="radeC_CAC_CHE_DO_KHAC" Html='<%# Bind("C_CAC_CHE_DO_KHAC") %>'  Width="300px" Height="80px" runat="server" ShowSubmitCancelButtons="False" ToolbarMode="Default" AllowThumbGeneration="True" DeleteDocumentsPaths="~/uploads/" DeleteFlashPaths="~/uploads/" DeleteImagesPaths="~/uploads/" DeleteMediaPaths="~/uploads/" DocumentsPaths="~/uploads/" FlashPaths="~/uploads/" ImagesPaths="~/uploads/" MediaPaths="~/uploads/" UploadDocumentsPaths="~/uploads/" UploadFlashPaths="~/uploads/" UploadImagesPaths="~/uploads/" UploadMediaPaths="~/uploads/" DocumentsFilters="*.doc,*.xls,*.ppt,*.txt,*.pdf" MaxImageSize="10240000" MaxDocumentSize="10240000" MaxFlashSize="10240000" ToolsFile="~/RadControls/Editor/ToolsFile1.xml">
                   </radE:RadEditor>                   
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            
             <asp:TemplateField  HeaderText="Yêu cầu hồ sơ" >
                 <InsertItemTemplate>
                   <radE:RadEditor ID="radeC_YEU_CAU_HO_SO" Html='<%# Bind("C_YEU_CAU_HO_SO") %>'  Width="300px" Height="80px" runat="server" ShowSubmitCancelButtons="False" ToolbarMode="Default" AllowThumbGeneration="True" DeleteDocumentsPaths="~/uploads/" DeleteFlashPaths="~/uploads/" DeleteImagesPaths="~/uploads/" DeleteMediaPaths="~/uploads/" DocumentsPaths="~/uploads/" FlashPaths="~/uploads/" ImagesPaths="~/uploads/" MediaPaths="~/uploads/" UploadDocumentsPaths="~/uploads/" UploadFlashPaths="~/uploads/" UploadImagesPaths="~/uploads/" UploadMediaPaths="~/uploads/" DocumentsFilters="*.doc,*.xls,*.ppt,*.txt,*.pdf" MaxImageSize="10240000" MaxDocumentSize="10240000" MaxFlashSize="10240000" ToolsFile="~/RadControls/Editor/ToolsFile1.xml">
                   </radE:RadEditor>                   
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            
            <asp:TemplateField  HeaderText="Hạn nộp hồ sơ" >
                 <InsertItemTemplate>                    
                    <radCln:RadDatePicker MinDate="1900-01-01" ID="raddHannophs" Width="89"  SelectedDate='<%# Bind("C_HAN_NOP_HS") %>' OnLoad="raddHannophs_Load" runat="server"></radCln:RadDatePicker>
                                     
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
             <asp:TemplateField ShowHeader="false">
            <InsertItemTemplate>
                <b>Thông tin liên hệ Nhà tuyển dụng </b>
            </InsertItemTemplate>          
            <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Người liên hệ (*)">
                <InsertItemTemplate>
                        <asp:TextBox ID="txtC_NGUOI_LIEN_HE" Width="250px" Text='<%# Bind("C_NGUOI_LIEN_HE") %>' runat="server"></asp:TextBox>                
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Địa chỉ liên hệ (*)">
                <InsertItemTemplate>
                        <asp:TextBox ID="txtC_DIA_CHI_LIEN_HE" Width="300px" Text='<%# Bind("C_DIA_CHI_LIEN_HE") %>' runat="server"></asp:TextBox>                
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email liên hệ (*)">
                <InsertItemTemplate>
                        <asp:TextBox ID="txtC_EMAIL_LIEN_HE" Width="300px" Text='<%# Bind("C_EMAIL_LIEN_HE") %>' runat="server"></asp:TextBox> 
                                   <asp:RegularExpressionValidator ID="revSENDER_EMAIL" runat="server" ErrorMessage="Sai định dạng Email" ControlToValidate="txtC_EMAIL_LIEN_HE" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="vPOST_FAQG1" Display="Dynamic">*</asp:RegularExpressionValidator>     
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Số điện thoại liên hệ (*)">
                <InsertItemTemplate>
                        <asp:TextBox ID="txtC_DIEN_THOAI_LIEN_HE" Width="300px" Text='<%# Bind("C_DIEN_THOAI_LIEN_HE") %>' runat="server"></asp:TextBox>                
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Di động (*)">
                <InsertItemTemplate>
                        <asp:TextBox ID="txtC_DI_DONG" Width="300px" Text='<%# Bind("C_DI_DONG") %>' runat="server"></asp:TextBox>                
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Hình thức liên hệ (*)">
                <InsertItemTemplate>
                        <asp:TextBox ID="txtC_HINH_THUC_LIEN_HE" Width="300px" Text='<%# Bind("C_HINH_THUC_LIEN_HE") %>' runat="server"></asp:TextBox>                
                </InsertItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            
            
            
            
            <asp:CommandField  ButtonType="Button" ValidationGroup="vPOST_FAQG1" ShowInsertButton="True">
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
     <asp:ValidationSummary ID="vsPOST_FAQ" ValidationGroup="vPOST_FAQG1" ShowSummary="false" HeaderText="Vui lòng kiểm tra lại :" runat="server" ShowMessageBox="true" />  

    <asp:SqlDataSource ID="POST_TDDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    InsertCommand="INSERT INTO T_TUYEN_DUNG(C_TITLE,C_TEN_CONG_TY,C_DIA_CHI,C_MO_TA,C_PHONE,C_QUY_MO,C_TIEU_CHI,C_WEBSITE,C_VI_TRI,C_SL_TUYEN,C_LINH_VUC,C_DIA_DIEM_LAM_VIEC,C_MO_TA_VIEC_LAM,C_KY_NANG,C_TRINH_DO_TOI_THIEU,C_KINH_NGHIEM,C_YC_GIOI_TINH,C_HINH_THUC_LAM_VIEC,C_MUC_LUONG,C_THOI_GIAN_THU_VIEC,C_CAC_CHE_DO_KHAC,C_YEU_CAU_HO_SO,C_NGAY_DANG,C_HAN_NOP_HS,C_NGUOI_LIEN_HE,C_DIA_CHI_LIEN_HE,C_EMAIL_LIEN_HE,C_DIEN_THOAI_LIEN_HE,C_DI_DONG,C_HINH_THUC_LIEN_HE,C_STATUS)
                    VALUES(@C_TITLE,@C_TEN_CONG_TY,@C_DIA_CHI,@C_MO_TA,@C_PHONE,@C_QUY_MO,@C_TIEU_CHI,@C_WEBSITE,@C_VI_TRI,@C_SL_TUYEN,@C_LINH_VUC,@C_DIA_DIEM_LAM_VIEC,@C_MO_TA_VIEC_LAM,@C_KY_NANG,@C_TRINH_DO_TOI_THIEU,@C_KINH_NGHIEM,@C_YC_GIOI_TINH,@C_HINH_THUC_LAM_VIEC,@C_MUC_LUONG,@C_THOI_GIAN_THU_VIEC,@C_CAC_CHE_DO_KHAC,@C_YEU_CAU_HO_SO,GETDATE(),@C_HAN_NOP_HS,@C_NGUOI_LIEN_HE,@C_DIA_CHI_LIEN_HE,@C_EMAIL_LIEN_HE,@C_DIEN_THOAI_LIEN_HE,@C_DI_DONG,@C_HINH_THUC_LIEN_HE,0)
    ">
    <InsertParameters>
        <asp:Parameter Name="C_TITLE" ConvertEmptyStringToNull="false"  DefaultValue="" Type="String"/>
        <asp:Parameter Name="C_TEN_CONG_TY" ConvertEmptyStringToNull="false"  DefaultValue="" Type="String"/>
        <asp:Parameter Name="C_DIA_CHI" ConvertEmptyStringToNull="false"  DefaultValue="" Type="String"/>
        <asp:Parameter Name="C_MO_TA" ConvertEmptyStringToNull="false"  DefaultValue="" Type="String"/>
        <asp:Parameter Name="C_PHONE" ConvertEmptyStringToNull="false"  DefaultValue="" Type="String"/>
        <asp:Parameter Name="C_QUY_MO" ConvertEmptyStringToNull="false"  DefaultValue="" Type="String"/>
        <asp:Parameter Name="C_TIEU_CHI" ConvertEmptyStringToNull="false"  DefaultValue="" Type="String"/>
        <asp:Parameter Name="C_WEBSITE" ConvertEmptyStringToNull="false"  DefaultValue="" Type="String"/>
        <asp:Parameter Name="C_VI_TRI" ConvertEmptyStringToNull="false"  DefaultValue="" Type="String"/>
        <asp:Parameter Name="C_SL_TUYEN" Type="Int32"/>
        <asp:Parameter Name="C_LINH_VUC" ConvertEmptyStringToNull="false"  DefaultValue="" Type="String"/>
        <asp:Parameter Name="C_DIA_DIEM_LAM_VIEC" ConvertEmptyStringToNull="false"  DefaultValue="" Type="String"/>
        <asp:Parameter Name="C_MO_TA_VIEC_LAM" ConvertEmptyStringToNull="false"  DefaultValue="" Type="String"/>
        <asp:Parameter Name="C_KY_NANG" ConvertEmptyStringToNull="false"  DefaultValue="" Type="String"/>
        <asp:Parameter Name="C_TRINH_DO_TOI_THIEU" ConvertEmptyStringToNull="false"  DefaultValue="" Type="String"/>
        <asp:Parameter Name="C_KINH_NGHIEM" ConvertEmptyStringToNull="false"  DefaultValue="" Type="String"/>
        <asp:Parameter Name="C_YC_GIOI_TINH" ConvertEmptyStringToNull="false"  DefaultValue="" Type="String"/>
        <asp:Parameter Name="C_HINH_THUC_LAM_VIEC" ConvertEmptyStringToNull="false"  DefaultValue="" Type="String"/>
        <asp:Parameter Name="C_MUC_LUONG" ConvertEmptyStringToNull="false"  DefaultValue="" Type="String"/>
        <asp:Parameter Name="C_THOI_GIAN_THU_VIEC" ConvertEmptyStringToNull="false"  DefaultValue="" Type="String"/>
        <asp:Parameter Name="C_CAC_CHE_DO_KHAC" ConvertEmptyStringToNull="false"  DefaultValue="" Type="String"/>
        <asp:Parameter Name="C_YEU_CAU_HO_SO" ConvertEmptyStringToNull="false"  DefaultValue="" Type="String"/>
        <asp:Parameter Name="C_NGAY_DANG" Type="dateTime" />        
        <asp:Parameter Name="C_HAN_NOP_HS" Type="dateTime" />  
        <asp:Parameter Name="C_NGUOI_LIEN_HE" ConvertEmptyStringToNull="false"  DefaultValue="" Type="String"/>
        <asp:Parameter Name="C_DIA_CHI_LIEN_HE" ConvertEmptyStringToNull="false"  DefaultValue="" Type="String"/>
        <asp:Parameter Name="C_EMAIL_LIEN_HE" ConvertEmptyStringToNull="false"  DefaultValue="" Type="String"/>
        <asp:Parameter Name="C_DIEN_THOAI_LIEN_HE" ConvertEmptyStringToNull="false"  DefaultValue="" Type="String"/>
        <asp:Parameter Name="C_DI_DONG" ConvertEmptyStringToNull="false"  DefaultValue="" Type="String"/>
        <asp:Parameter Name="C_HINH_THUC_LIEN_HE" ConvertEmptyStringToNull="false"  DefaultValue="" Type="String"/>
        <asp:Parameter Name="C_STATUS" Type="Int32"/>
    </InsertParameters>
</asp:SqlDataSource>