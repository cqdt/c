<%@ Control Language="C#" AutoEventWireup="true" CodeFile="searching-worker.ascx.cs" Inherits="Modules_searching_worker" %>


<div class="bg_title_cate">
<div class="title_cate">
    <div class="title_cate_ico"></div>
    <a class="a_title_cate">근로자 구함</a>
</div>    
<div class="title_cate_right"></div>
</div>

<div class="img_24">
    <ul class="thongtintdld">
    <span class="kinhnghiemtoithieu">1- Yêu cầu về kinh nghiệm làm việc/ 전공 요구</span>
     <li>
         <span class="tencongty">Nghề/직업/업종</span>        
        
          <asp:DropDownList ID="cboNganhngheduocdaotao" runat="server" 
                CssClass="danhmucnghe" style="width: 290px; height: 36px;" 
                >
            </asp:DropDownList>

            <span class="nghelamviec">Năm<br />년</span>


           <select class="danhmucnghe" style="width: 290px; height: 36px;" id="cboNamlamviec" runat="server">
                <option value="">---</option>
                <option value="1">1 năm</option>
                <option value="2">2 năm</option>
                <option value="3">3 năm</option>
                <option value="4">4 năm</option>
                <option value="5">5 năm</option>
                <option value="6">6 năm</option>
                <option value="7">7 năm</option>
                <option value="8">8 năm</option>
                <option value="9">9 năm</option>
                <option value="10">10 năm</option>
                
            </select>


        </li>


        <li> <span class="tencongty">2- Yêu cầu về chuyên ngành đào tạo/ 경력 요구</span>

        
        </li>
      
        <li>
            <span class="tencongty">3- Yêu cầu về kỹ năng tiếng Hàn/ 한국어능력 요구</span>
            

              <select class="danhmucnghe" style="width: 290px; height: 36px;" id="cboChungchi" runat="server">
                <option value="">--- --- ---</option>
                <option value="TOPIK1">TOPIK 1</option>
                <option value="TOPIK2">TOPIK 2</option>
                <option value="TOPIK3">TOPIK 3</option>
                <option value="TOPIK4">TOPIK 4</option>
                <option value="TOPIK5">TOPIK 5</option>
              
                <option value="Khác">Khác</option>
            </select>


        </li>
        <li>
         <span class="tencongty">4- Mức lương<br />&nbsp;&nbsp;&nbsp; 임금</span>
         

          <select id="choMucluongmongmuon" runat="server" class="danhmucnghe" style="width: 290px;height:36px;">
                
                <option value="">--- --- ---</option>
                <option value="< 5000000">< 5,000,000 VNĐ</option>
                <option value="6000000">6,000,000 VNĐ</option>
                <option value="7000000">7,000,000 VNĐ</option>
                <option value="8000000">8,000,000 VNĐ</option>
                <option value="9000000">9,000,000 VNĐ</option>
                <option value="10000000">10,000,000 VNĐ</option>
                <option value="11000000">11,000,000 VNĐ</option>
                <option value="12000000">12,000,000 VNĐ</option>
                <option value="13000000">13,000,000 VNĐ</option>
                <option value="14000000">14,000,000 VNĐ</option>
                <option value="15000000">15,000,000 VNĐ</option>
                <option value="Thỏa thuận">Thỏa thuận</option>
            </select>


        </li>
        <li>
          <span class="tencongty">5- Yêu cầu về giới tính<br />&nbsp;&nbsp;&nbsp; 성별 요구</span>  
         <asp:RadioButtonList ID="rblGioitinh" RepeatColumns="3" runat="server">
                     <asp:ListItem Text="Nam/남" Value="1"  ></asp:ListItem>
                     <asp:ListItem Text="Nữ/여" Value="0"></asp:ListItem>
                     <asp:ListItem Text="Không" Value="" Selected="True"></asp:ListItem>
                </asp:RadioButtonList>
        </li>
        <li>
              <span class="tencongty">6- Yêu cầu về nơi cư trú<br />&nbsp;&nbsp;&nbsp; 거주지 요구</span>
         

           <select class="danhmucnghe" style="width: 290px; height: 36px;" id="cboTinh" runat="server">
           
                <option value="">--- --- ---</option>
                <option value="Hà Nội">Hà Nội</option>
                <option value="TP HCM">TP HCM</option>
                <option value="An Giang">An Giang</option>
                <option value="Bà Rịa - Vũng Tàu">Bà Rịa - Vũng Tàu</option>
                <option value="Bắc Giang">Bắc Giang</option>
                <option value="Bắc Kạn">Bắc Kạn</option>
                <option value="Bạc Liêu">Bạc Liêu</option>
                <option value="Bắc Ninh">Bắc Ninh</option>
                <option value="Bến Tre">Bến Tre</option>
                <option value="Bình Định">Bình Định</option>
                <option value="Bình Dương">Bình Dương</option>
                <option value="Bình Phước">Bình Phước</option>
                <option value="Bình Thuận">Bình Thuận</option>
                <option value="Cà Mau">Cà Mau</option>
                <option value="Cần Thơ">Cần Thơ</option>
                <option value="Cao Bằng">Cao Bằng</option>
                <option value="Đà Nẵng">Đà Nẵng</option>
                <option value="Đắk Lắk">Đắk Lắk</option>
                <option value="Đắk Nông">Đắk Nông</option>
                <option value="Điện Biên">Điện Biên</option>
                <option value="Đồng Nai">Đồng Nai</option>
                <option value="Đồng Tháp">Đồng Tháp</option>
                <option value="Gia Lai">Gia Lai</option>
                <option value="Hà Giang">Hà Giang</option>
                <option value="Hà Nam">Hà Nam</option>
                <option value="Hà Tĩnh">Hà Tĩnh</option>
                <option value="Hải Phòng">Hải Phòng</option>
                <option value="Hải Dương">Hải Dương</option>
                <option value="Hậu Giang">Hậu Giang</option>
                <option value="Hòa Bình">Hòa Bình</option>
                <option value="Hưng Yên">Hưng Yên</option>
                <option value="Khánh Hòa">Khánh Hòa</option>
                <option value="Kiên Giang">Kiên Giang</option>
                <option value="Kon Tum">Kon Tum</option>
                <option value="Lai Châu">Lai Châu</option>
                <option value="Lâm Đồng">Lâm Đồng</option>
                <option value="Lạng Sơn">Lạng Sơn</option>
                <option value="Lào Cai">Lào Cai</option>
                <option value="Long An">Long An</option>
                <option value="Nam Định">Nam Định</option>
                <option value="Nghệ An">Nghệ An</option>
                <option value="Ninh Bình">Ninh Bình</option>
                <option value="Ninh Thuận">Ninh Thuận</option>
                <option value="Phú Thọ">Phú Thọ</option>
                <option value="Quảng Bình">Quảng Bình</option>
                <option value="Quảng Nam">Quảng Nam</option>
                <option value="Quảng Ngãi">Quảng Ngãi</option>
                <option value="Quảng Ninh">Quảng Ninh</option>
                <option value="Quảng Trị">Quảng Trị</option>
                <option value="Sóc Trăng">Sóc Trăng</option>
                <option value="Sơn La">Sơn La</option>
                <option value="Tây Ninh">Tây Ninh</option>
                <option value="Thái Bình">Thái Bình</option>
                <option value="Thái Nguyên">Thái Nguyên</option>
                <option value="Thanh Hóa">Thanh Hóa</option>
                <option value="Thừa Thiên Huế">Thừa Thiên Huế</option>
                <option value="Tiền Giang">Tiền Giang</option>
                <option value="Trà Vinh">Trà Vinh</option>
                <option value="Tuyên Quang">Tuyên Quang</option>
                <option value="Vĩnh Long">Vĩnh Long</option>
                <option value="Vĩnh Phúc">Vĩnh Phúc</option>
                <option value="Yên Bái">Yên Bái</option>
                <option value="Phú Yên">Phú Yên</option>
            </select>


        </li>
        <li>
            <asp:Button ID="btntimkiem" CssClass="btndangky" runat="server" Text=" 검색 " 
                onclick="btntimkiem_Click" />
        </li>
        <li>

            <table cellpadding="1" cellspacing="1" width="100%" style="background:#ccc">
                <tr>
                  <td style="background:#fff">STT<br />순서</td>
                  <td style="background:#fff">Họ tên <br />근로자명</td>
                  <td style="background:#fff">Ngày sinh <br />생년월일</td>
                  <td style="background:#fff">Giới tính <br />성별</td>
                  <td style="background:#fff">Mã TV</td>
                  <td style="background:#fff">Chọn <br />세부사항</td>
                  <%--<td style="background:#fff">선택</td>--%>
                </tr>
                
                 <%= listdata %>
               
            </table>
        </li>
        <li>&nbsp;</li>
        <li>
            <asp:Button ID="btnChon" CssClass="btndangky" runat="server" Text=" Export to Excel " 
                onclick="btnChon_Click" />
        </li>

    </ul>
</div>