using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class Admin_Modules_ds_dang_ky_khoa_hoc_dao_tao_nghe_ngoai_ngu_eps : System.Web.UI.UserControl
{

    DataSet ds = new DataSet();
    public int total;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("ds-dang-ky-khoa-hoc-dao-tao-nghe-ngoai-ngu-eps", CMS.TTV.Rules.APPROVE))
        {
            lblAlert.Text = "Bạn không có quyền thực hiện lệnh này";
            return;
        }
        total = CMS.MsSql.ExecuteToInt("select count(*) from T_DANGKY_DAOTAONGHE");
    }

    protected void btnExportExcel_Click(object sender, EventArgs e)
    {
        string str = "SELECT     C_DONVI [Đơn vị tổ chức], C_NGANHDAOTAO [Ngành nghề đào tạo], C_THOIGIANDAOTAO [Thời gian đào tạo], C_HOTEN [Họ tên], C_NGAYSINH [Ngày sinh], C_GIOITINH [Giới tính], C_HOCHIEUCU [Số hộ chiếu cũ], "
 + " C_HOCHIEUMOI [Số hộ chiếu mới], C_DIENTHOAI1 [Số điện thoại 1],   "
     + "                 C_DIENTHOAI2 [Số điện thoại 2], C_CMNDVN [Số CMND Việt Nam], C_CMNDNN [Số CMND Nước ngoài], C_NGAYNHAPHQ [Ngày nhập cảnh vào HQ], C_NGAYVEVN [Ngày về VN], "
 + " C_HANCUOICMNDNN [Hạn cuối cùng trên CMND Nước ngoài], C_EMAIL [Email], C_QUEQUAN [Quê quán], C_THUONGTRU [Thường trú], C_TRINHDO [Trình độ], C_CTYCUOI [Công ty cùng], "
                      + " C_DIENTHOAICTYCUOI [Điện thoại công ty cuối], C_THOIGIANLAMVIEC [Thời gian làm việc], C_QUAYLAIHQ [Muốn quay lại HQ], C_THI_EPS_TOPIK [Thi EPS-TOPIK], C_NGAYTHI [Ngày thi], C_DIEMTHI [Điểm thi], C_NGAYGUI [Ngày gửi đăng ký]"
                      + " FROM T_DANGKY_DAOTAONGHE ORDER BY PK_KHOAHOC DESC";

        ds = CMS.MsSql.FillDataSet(str);
        Whatever.ExcelExport.ExportDataSetToExcel(ds, "ds-dang-ky-khoa-hoc-dao-tao-nghe-ngoai-ngu-eps.xls");
    }

    protected void gvList_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex >= 0 && e.Row.RowIndex <= gvList.Rows.Count)
        {
            e.Row.Cells[0].Text = "<font face=\"tahoma\" size=\"2\">" + (gvList.PageIndex * gvList.PageSize + e.Row.RowIndex + 1) + "</font>";
        }
    }

}