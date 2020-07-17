<%@ Control Language="C#" AutoEventWireup="true" CodeFile="nld-dang-ky-tim-viec.ascx.cs"
    Inherits="Modules_nld_dang_ky_tim_viec" %>
<%@ Register Assembly="SlimeeLibrary" Namespace="SlimeeLibrary" TagPrefix="cc1" %>
<div class="bg_title_cate">
    <div class="title_cate">
        <div class="title_cate_ico">
        </div>
        <a class="a_title_cate">ĐĂNG KÝ TÌM VIỆC</a>
    </div>
</div>
<div class="img_24">
    <ul class="dangkytdld">
        <li><span class="thongtindn">A. THÔNG TIN NGƯỜI LAO ĐỘNG</span></li>
        <li><span class="lbldienthoailienhe">1- Họ và đệm : </span>
            <asp:Label ID="txthodem" runat="server" CssClass="lblhotendem" Text=""></asp:Label>
            <span class="diachiemail">2- Tên :</span>
            <asp:Label ID="txtten" runat="server" CssClass="lblhotendem" Text=""></asp:Label>
        </li>
        <li><span class="lbldienthoailienhe">3- Ngày sinh :</span>
            <asp:Label ID="lblngaysinh" runat="server" CssClass="lblhotendem" Text=""></asp:Label>
            <span class="diachiemail">4- Giới tính :</span>
            <asp:Label ID="lblGioitinh" runat="server" CssClass="lblhotendem" Text=""></asp:Label>
        </li>
        <li><span class="lbldienthoailienhe">5- Số CMND/Hộ chiếu :</span>
            <asp:Label ID="txtCMND" runat="server" CssClass="lblhotendem" Text=""></asp:Label>
        </li>
        <li><span class="lbldienthoailienhe">6- Địa chỉ cư trú :</span>
            <asp:Label ID="txtDiachi" runat="server" CssClass="lbldiachicutru" Text=""></asp:Label>
        </li>
        <li><span class="lbldienthoailienhe">7- Số điện thoại liên hệ : </span>
            <asp:Label ID="txtDienthoai" runat="server" CssClass="lblhotendem" Text=""></asp:Label>
            <span class="diachiemail">8- Địa chỉ email : </span>
            <asp:Label ID="txtEmail" runat="server" CssClass="lblhotendem" Text=""></asp:Label>
        </li>
        <li><span class="lbldienthoailienhe">9- Mã tìm việc : </span>
            <asp:Label ID="txtMatimviec" runat="server" CssClass="lblhotendem" Text=""></asp:Label>
        </li>
        <li><span class="thongtindn">B. ĐĂNG KÝ TÌM VIỆC</span></li>


         <li><span class="lbldangkytuyendung">10- Lựa chọn hình thức tuyển dụng <b>(*)</b></span>
             <asp:DropDownList ID="ddlHinhthuc" runat="server" AutoPostBack="true" 
                 onselectedindexchanged="ddlHinhthuc_SelectedIndexChanged" Width="306" Height="36">
                <asp:ListItem Text="--- --- ---" Value=""></asp:ListItem>
                <asp:ListItem Text="Phiên GDVL" Value="1"></asp:ListItem>
                <asp:ListItem Text="Tuyển dụng trực tiếp" Value="0"></asp:ListItem>
             </asp:DropDownList>
        </li>

         <li><span class="lbldangkytuyendung">11- Đăng ký phiên giao dịch việc làm <b>(*)</b></span>
             <asp:DropDownList ID="ddlListPhienGDVL" runat="server"  Width="306" Height="36"
                 AutoPostBack="True" 
                 onselectedindexchanged="ddlListPhienGDVL_SelectedIndexChanged">               
             </asp:DropDownList>
        </li>

        <li><span class="lbldangkytuyendung">12- Đăng ký công ty tuyển dụng <b>(*)</b></span>
        
        <asp:DropDownList ID="ddlDoanhnghiep" runat="server" OnSelectedIndexChanged="ddlDoanhnghiep_SelectedIndexChanged"  Width="306" Height="36"
                AutoPostBack="true">
            </asp:DropDownList>

              <asp:DropDownList ID="ddlDoanhnghiepImport" runat="server"   Width="306" Height="36"
                AutoPostBack="true" 
                onselectedindexchanged="ddlDoanhnghiepImport_SelectedIndexChanged">
            </asp:DropDownList>


        </li>

      
        <li><span class="lbldangkytuyendung">13- Đăng ký vị trí tuyển dụng <b>(*)</b></span>
            <asp:DropDownList ID="ddlVitrituyen" runat="server"  Width="306" Height="36">
            </asp:DropDownList>

        </li>
        <li>
            <asp:Button ID="btndangky" CssClass="btndangky" runat="server" Text=" ĐĂNG KÝ " OnClick="btndangky_Click" />
        </li>
        <li><span class="lblnganhnghe">Đăng ký bổ sung vị trí tìm việc (?) </span>
            <asp:Button ID="btndangkytiep" CssClass="btnyesno" runat="server" Text=" YES " OnClick="btndangkytiep_Click" />
            <asp:Button ID="btndangkyhuy" CssClass="btnyesno" runat="server" Text=" NO " OnClick="btndangkyhuy_Click" />
        </li>
    </ul>
</div>
