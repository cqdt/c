<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MenuTop.ascx.cs" Inherits="Admin_Controls_MenuTop" %>
<%@ Register Assembly="RadMenu.Net2" Namespace="Telerik.WebControls" TagPrefix="radM" %>


<radm:radmenu id="radMenuTop" runat="server" enabletheming="True" Skin="Outlook" CausesValidation="False">
  <Items>
     <radM:RadMenuItem ID="RadMenuItem1" runat="server" Text="Trang chủ" NavigateUrl="../Default.aspx"></radM:RadMenuItem>
     <radM:RadMenuItem ID="RadMenuItem2" runat="server" Text="Chuy&#234;n mục" NavigateUrl="../Default.aspx?ctl=Menus"></radM:RadMenuItem>
     <radM:RadMenuItem ID="RadMenuItem3" runat="server" Text="Tin tức" NavigateUrl="../Default.aspx?ctl=Articles">
     </radM:RadMenuItem>
     <radM:RadMenuItem ID="RadMenuItem55" runat="server" NavigateUrl="../Default.aspx?ctl=FAQs" Text="Hỏi đáp - Tư vấn"></radM:RadMenuItem>
     <radM:RadMenuItem ID="RadMenuItem8" runat="server" Text="Sản phẩm" NavigateUrl="../Default.aspx?ctl=Products" Visible="False"></radM:RadMenuItem>
      <radM:RadMenuItem ID="RadMenuItem6" runat="server" NavigateUrl="../Default.aspx?ctl=Links" Text="Li&#234;n kết">
      </radM:RadMenuItem>
      <radM:RadMenuItem ID="RadMenuItem16" runat="server" NavigateUrl="../Default.aspx?ctl=Banners" Text="Banner"></radM:RadMenuItem>
     <radM:RadMenuItem ID="RadMenuItem7" runat="server" Text="Thư viện ảnh" NavigateUrl="../Default.aspx?ctl=Gallerys" Visible="False"></radM:RadMenuItem>
     <radM:RadMenuItem ID="RadMenuItem9" runat="server" Text="Doanh nghiệp" Visible="False">
          <Items>     
             <radM:RadMenuItem ID="RadMenuItem10" runat="server" NavigateUrl="../Default.aspx?ctl=DNs" Text="Doanh nghiệp"></radM:RadMenuItem>
             <radM:RadMenuItem ID="RadMenuItem11" runat="server" NavigateUrl="../Default.aspx?ctl=SPDVs" Text="Sản phẩm dịch vụ"></radM:RadMenuItem>
             <radM:RadMenuItem ID="RadMenuItem12" runat="server" NavigateUrl="../Default.aspx?ctl=GYDNs" Text="Li&#234;n hệ"></radM:RadMenuItem>
          </Items>
     </radM:RadMenuItem>
     <radM:RadMenuItem ID="RadMenuItem33" runat="server" Text="Quản lý danh mục">
        <Items>
            <radM:RadMenuItem ID="RadMenuItem34" runat="server" Text="Danh mục ngành nghề" NavigateUrl="../Default.aspx?ctl=dm-nganh-nghe"></radM:RadMenuItem>
            <radM:RadMenuItem ID="RadMenuItem35" runat="server" Text="Danh mục vị trí việc làm" NavigateUrl="../Default.aspx?ctl=dm-vi-tri"></radM:RadMenuItem>
        </Items>
     </radM:RadMenuItem>


      <radM:RadMenuItem ID="RadMenuItem13" runat="server" Text="Quản l&#253;">
          <Items>  
          
          <radM:RadMenuItem ID="RadMenuItem45" runat="server" Text="Thông tin người lao động chương trình EPS" NavigateUrl="../Default.aspx?ctl=eps"></radM:RadMenuItem>
          <radM:RadMenuItem ID="RadMenuItem43" runat="server" Text="Danh sách người lao động chưa nhận tiền bảo hiểm" NavigateUrl="../Default.aspx?ctl=danh-sach-bao-hiem"></radM:RadMenuItem>
          <radM:RadMenuItem ID="RadMenuItem4" runat="server" Text="Danh sách người lao động đã nộp hồ sơ" NavigateUrl="../Default.aspx?ctl=danh-sach-da-nop-ho-so"></radM:RadMenuItem>
          
          <%--<radM:RadMenuItem ID="RadMenuItem144" runat="server" Text="Doanh nghiệp - Korea" NavigateUrl="../Default.aspx?ctl=business-korea"></radM:RadMenuItem>--%>
         <%-- <radM:RadMenuItem ID="RadMenuItem32" runat="server" Text="NLD Đăng ký tìm việc" NavigateUrl="../Default.aspx?ctl=ds-nld-tim-viec"></radM:RadMenuItem> --%>
<%--          <radM:RadMenuItem ID="RadMenuItem36" runat="server" Text="Phiên giao dịch việc làm" NavigateUrl="../Default.aspx?ctl=phien-gdvl"></radM:RadMenuItem>     
          <radM:RadMenuItem ID="RadMenuItem37" runat="server" Text="Vị trí tuyển dụng" NavigateUrl="../Default.aspx?ctl=vitrituyendung"></radM:RadMenuItem>--%>     
           
         <%-- 
          <radM:RadMenuItem ID="RadMenuItem36" runat="server" Text="Hồ sơ tìm việc" NavigateUrl="../Default.aspx?ctl=Tim-viecs"></radM:RadMenuItem>         
          
              <radM:RadMenuItem ID="RadMenuItem444" runat="server" NavigateUrl="../Default.aspx?ctl=Advs" Text="Panel bên phải"></radM:RadMenuItem>
              <radM:RadMenuItem ID="RadMenuItem55" runat="server" NavigateUrl="../Default.aspx?ctl=FAQs" Text="Hỏi đáp - Tư vấn"></radM:RadMenuItem>
              <radM:RadMenuItem ID="RadMenuItem34" runat="server" NavigateUrl="../Default.aspx?ctl=SetPass" Text="Quản lý trung tâm đào tạo"></radM:RadMenuItem>
              
              <radM:RadMenuItem ID="RadMenuItem17" runat="server" NavigateUrl="../Default.aspx?ctl=Danh-sach-diem-kiem-tra-tieng-han" Text="Kết quả điểm kiểm tra tiếng Hàn"></radM:RadMenuItem> 
             <radM:RadMenuItem ID="RadMenuItem5" runat="server" NavigateUrl="../Default.aspx?ctl=Register_CEs" Text="Danh sách đăng ký cấp chứng chỉ CE"></radM:RadMenuItem>
             <radM:RadMenuItem ID="RadMenuItem35" runat="server" NavigateUrl="../Default.aspx?ctl=Danh-sach-duoc-cap-chung-chi-CE" Text="Danh sách được cấp chứng chỉ CE"></radM:RadMenuItem>
            <radM:RadMenuItem ID="RadMenuItem37" runat="server" NavigateUrl="../Default.aspx?ctl=List_LD_KYHDs" Text="Danh sách người lao động được ký hợp đồng"></radM:RadMenuItem> 
            <radM:RadMenuItem ID="RadMenuItem4" runat="server" NavigateUrl="../Default.aspx?ctl=Tu-nghiep-sinhs" Text="Danh sách tu nghiệp sinh hoàn thành hợp đồng về nước"></radM:RadMenuItem>
              <radM:RadMenuItem ID="RadMenuItem44" runat="server" NavigateUrl="../Default.aspx?ctl=List_xuat_canh" Text="Danh sách người lao động xuất cảnh đi làm việc tại Hàn Quốc"></radM:RadMenuItem>
              <radM:RadMenuItem ID="RadMenuItem41" runat="server" NavigateUrl="../Default.aspx?ctl=Diem-kiem-tra-tay-nghes" Text="Kết quả điểm kiểm tra tay nghề"></radM:RadMenuItem>
              <radM:RadMenuItem ID="RadMenuItem42" runat="server" NavigateUrl="../Default.aspx?ctl=Tinh-trang-ho-sos" Text="Danh sách tình trạng hồ sơ"></radM:RadMenuItem>--%>
             
         
          </Items>
     </radM:RadMenuItem>
    <radM:RadMenuItem ID="RadMenuItem14" runat="server" Text="Thống kê">
          <Items>
              <radM:RadMenuItem ID="RadMenuItem46" runat="server" NavigateUrl="../Default.aspx?ctl=ds-im-japan" Text="Danh sách đăng ký dự tuyển chương trình IM Japan"></radM:RadMenuItem> 
              <radM:RadMenuItem ID="RadMenuItem47" runat="server" NavigateUrl="../Default.aspx?ctl=ds-bo-tuc" Text="Danh sách đăng ký bổ túc tiếng Hàn và thực hành làm bài thi trên máy tính"></radM:RadMenuItem> 
              <radM:RadMenuItem ID="RadMenuItem48" runat="server" NavigateUrl="../Default.aspx?ctl=ds-tim-viec" Text="Danh sách đăng ký tìm việc trong nước"></radM:RadMenuItem> 
              <radM:RadMenuItem ID="RadMenuItem49" runat="server" NavigateUrl="../Default.aspx?ctl=ds-tuyen-dung" Text="Danh sách đăng ký tuyển dụng lao động"></radM:RadMenuItem> 

              <radM:RadMenuItem ID="RadMenuItem5" runat="server" NavigateUrl="../Default.aspx?ctl=ds-khai-bao-thong-tin" Text="Danh sách khai báo thông tin người lao động tại Hàn Quốc"></radM:RadMenuItem> 

              <radM:RadMenuItem ID="RadMenuItem15" runat="server" NavigateUrl="../Default.aspx?ctl=ds-dang-ky-khoa-hoc-dao-tao-nghe-ngoai-ngu-eps" Text="Danh sách đăng ký khóa học đào tạo nghề ngoại ngữ chương trình EPS"></radM:RadMenuItem> 

              <radM:RadMenuItem ID="RadMenuItem17" runat="server" NavigateUrl="../Default.aspx?ctl=ds-CHLB-Duc" Text="Danh sách đăng ký dự tuyển chương trình điều dưỡng viên đi học tập và làm việc tại CHLB Đức"></radM:RadMenuItem> 

              <radM:RadMenuItem ID="RadMenuItem58" runat="server" NavigateUrl="../Default.aspx?ctl=ds-holy-japan" Text="Danh sách đăng ký dự tuyển chương trình Hộ lý tại Nhật Bản"></radM:RadMenuItem> 
              <radM:RadMenuItem ID="RadMenuItem59" runat="server" NavigateUrl="../Default.aspx?ctl=ds-DaiLoan" Text="Danh sách đăng ký dự tuyển chương trình làm việc tại Đài Loan"></radM:RadMenuItem> 

         
            
          </Items>
    </radM:RadMenuItem>
    
    
    <radM:RadMenuItem ID="RadMenuItem38" runat="server" Text="Quản lý cấu phần giới thiệu việc làm">
          <Items>
              <radM:RadMenuItem ID="RadMenuItem39" runat="server" NavigateUrl="../Default.aspx?ctl=ds-nld-tim-viec" Text="Danh sách NLĐ đăng ký tìm việc"></radM:RadMenuItem> 
              <radM:RadMenuItem ID="RadMenuItem32" runat="server" NavigateUrl="../Default.aspx?ctl=business-korea" Text="Danh sách DN đăng ký tuyển dụng"></radM:RadMenuItem> 
              <radM:RadMenuItem ID="RadMenuItem36" runat="server" Text="Phiên giao dịch việc làm" NavigateUrl="../Default.aspx?ctl=phien-gdvl"></radM:RadMenuItem>     
              <radM:RadMenuItem ID="RadMenuItem37" runat="server" Text="Vị trí tuyển dụng" NavigateUrl="../Default.aspx?ctl=vitrituyendung"></radM:RadMenuItem>           
          </Items>
    </radM:RadMenuItem>
      <radM:RadMenuItem ID="RadMenuItem40" runat="server" Text="Kết nối cung cầu tự động và thống kê">
           <Items>
              <radM:RadMenuItem ID="RadMenuItem41" runat="server" NavigateUrl="../Default.aspx?ctl=ket-noi-theo-muc-luong" Text="Kết nối theo tiêu chí mức lương"></radM:RadMenuItem> 
              <radM:RadMenuItem ID="RadMenuItem42" runat="server" NavigateUrl="../Default.aspx?ctl=ket-noi-theo-nganh-nghe" Text="Kết nối theo tiêu chí ngàng nghề chuyên môn"></radM:RadMenuItem> 
              <radM:RadMenuItem ID="RadMenuItem44" runat="server" NavigateUrl="../Default.aspx?ctl=ket-noi-theo-dia-diem" Text="Kết nối theo địa điểm làm việc"></radM:RadMenuItem> 
              <radM:RadMenuItem ID="RadMenuItem50" runat="server" NavigateUrl="../Default.aspx?ctl=ket-noi-theo-kinh-nghiem" Text="Kết nối theo kinh nghiệm làm việc"></radM:RadMenuItem>
              <radM:RadMenuItem ID="RadMenuItem51" runat="server" NavigateUrl="../Default.aspx?ctl=thong-ke-nld-theo-dia-phuong" Text="Thống kê người lao động đăng ký tìm việc theo địa phương"></radM:RadMenuItem> 
              <radM:RadMenuItem ID="RadMenuItem52" runat="server" NavigateUrl="../Default.aspx?ctl=thong-ke-nld-theo-nganh-nghe" Text="Thống kê người lao động đăng ký theo ngành nghề"></radM:RadMenuItem>
              <radM:RadMenuItem ID="RadMenuItem53" runat="server" NavigateUrl="../Default.aspx?ctl=thong-ke-nld-theo-ngoai-ngu" Text="Thống kê người lao đăng ký theo trình độ ngoại ngữ"></radM:RadMenuItem> 
              <radM:RadMenuItem ID="RadMenuItem54" runat="server" NavigateUrl="../Default.aspx?ctl=thong-ke-nld-theo-thoi-gian-dang-ky" Text="Thống kê người lao động đăng ký theo thời gian đăng ký"></radM:RadMenuItem>
              
          </Items>
    </radM:RadMenuItem>
    
    
    
    
     <%--<radM:RadMenuItem ID="RadMenuItem17" runat="server" NavigateUrl="../Default.aspx?ctl=FeedBacks" Text="Li&#234;n hệ"></radM:RadMenuItem>--%>
      <radM:RadMenuItem runat="server" NavigateUrl="../Default.aspx?ctl=RSSs" Text="RSS" Visible="False">
      </radM:RadMenuItem>
     <radM:RadMenuItem ID="RadMenuItem18" runat="server" Text="Tiện &#237;ch">
          <Items>
              <radM:RadMenuItem ID="RadMenuItem19" runat="server" NavigateUrl="../Default.aspx?ctl=GImages" Text="Nh&#243;m thư viện ảnh">
              </radM:RadMenuItem>
              <radM:RadMenuItem ID="RadMenuItem20" runat="server" NavigateUrl="../Default.aspx?ctl=Images" Text="Thư viện ảnh">
              </radM:RadMenuItem>
              <radM:RadMenuItem ID="RadMenuItem56" runat="server" NavigateUrl="../Default.aspx?ctl=Advs" Text="Quảng cáo">
              </radM:RadMenuItem>
              <radM:RadMenuItem ID="RadMenuItem57" runat="server" NavigateUrl="../Default.aspx?ctl=Videos" Text="Videos">
              </radM:RadMenuItem>
              <radM:RadMenuItem ID="RadMenuItem21" runat="server" NavigateUrl="../Default.aspx?ctl=SendMail" Text="Gửi mail">
              </radM:RadMenuItem>
          </Items>
     </radM:RadMenuItem>
     <radM:RadMenuItem ID="RadMenuItem22" runat="server" Text="Hệ thống">
         <Items>
             <radM:RadMenuItem ID="RadMenuItem23" runat="server" NavigateUrl="../Default.aspx?ctl=Users" Text="Quản l&#253; người sử dụng">
             </radM:RadMenuItem>
             <radM:RadMenuItem ID="RadMenuItem24" runat="server" NavigateUrl="../Default.aspx?ctl=Lang" Text="Ng&#244;n ngữ">
             </radM:RadMenuItem>
             <radM:RadMenuItem ID="RadMenuItem25" runat="server" NavigateUrl="../Default.aspx?ctl=User_Log" Text="Nhật k&#253; đăng nhập">
             </radM:RadMenuItem>
             <radM:RadMenuItem ID="RadMenuItem26" runat="server" NavigateUrl="../Default.aspx?ctl=Log" Text="Nhật k&#253; lỗi">
             </radM:RadMenuItem>
             <radM:RadMenuItem ID="RadMenuItem27" runat="server" NavigateUrl="../Default.aspx?ctl=Config" Text="Cấu h&#236;nh hệ thống">
             </radM:RadMenuItem>
        </Items>
     </radM:RadMenuItem>
      <radM:RadMenuItem ID="RadMenuItem28" runat="server" Text="C&#225; nh&#226;n">
          <Items>
              <radM:RadMenuItem ID="RadMenuItem29" runat="server" NavigateUrl="../Default.aspx?ctl=User_Pass" Text="Thay đổi mật khẩu">
              </radM:RadMenuItem>
              <radM:RadMenuItem ID="RadMenuItem30" runat="server" NavigateUrl="../Default.aspx?ctl=User_Info" Text="Thay đổi th&#244;ng tin">
              </radM:RadMenuItem>
          </Items>
      </radM:RadMenuItem>
     <radM:RadMenuItem ID="RadMenuItem31" runat="server" Text="Tho&#225;t" NavigateUrl="../Default.aspx?ctl=Logout"></radM:RadMenuItem>
  </Items>
</radm:radmenu>