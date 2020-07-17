using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_Modules_ds_tuyen_dung : System.Web.UI.UserControl
{
    DataSet ds = new DataSet();
    public int total;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("ds-tuyen-dung", CMS.TTV.Rules.APPROVE))
        {
            lblAlert.Text = "Bạn không có quyền thực hiện lệnh này";
            return;
        }
        total = CMS.MsSql.ExecuteToInt("select count(*) from T_TUYENDUNG");
    }

    protected void btnExportExcel_Click(object sender, EventArgs e)
    {
        string str = "SELECT C_TENCTY AS [Tên công ty], C_NGANHNGHE AS [Ngành nghề, lĩnh vực hoạt động], C_DIACHI AS [Địa chỉ], C_DIENTHOAI AS [Số điện thoại], C_EMAIL AS [Email hoặc website], "
                      + " C_VITRI AS [Vị trí tuyển dụng], C_DIEUKIEN AS [Điều kiện tuyển dụng], C_YEUCAU AS [Yêu cầu công việc], C_SOLUONG AS [Số lượng cần tuyển], "
                      + " C_THUNHAP AS [Thu nhập và chế độ đãi ngộ], C_HOSO AS [Hồ sơ dự tuyển gồm có], C_THOIGIANNHAN AS [Thời gian nhận hồ sơ], C_NGAYGUI AS [Ngày gửi] "
                      + " FROM T_TUYENDUNG ORDER BY PK_TUYENDUNG DESC";

        ds = CMS.MsSql.FillDataSet(str);
        Whatever.ExcelExport.ExportDataSetToExcel(ds, "danh-sach-dang-ky-tuyen-dung-lao-dong.xls");
    }

    protected void gvList_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex >= 0 && e.Row.RowIndex <= gvList.Rows.Count)
        {
            e.Row.Cells[0].Text = "<font face=\"tahoma\" size=\"2\">" + (gvList.PageIndex * gvList.PageSize + e.Row.RowIndex + 1) + "</font>";
        }
    }
}