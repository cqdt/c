using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_Modules_ds_tim_viec : System.Web.UI.UserControl
{
    DataSet ds = new DataSet();
    public int total;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("ds-tim-viec", CMS.TTV.Rules.APPROVE))
        {
            lblAlert.Text = "Bạn không có quyền thực hiện lệnh này";
            return;
        }
        total = CMS.MsSql.ExecuteToInt("select count(*) from T_TIMVIEC");
    }

    protected void btnExportExcel_Click(object sender, EventArgs e)
    {
        string str = "SELECT C_HOTEN AS [Họ tên lao động], C_NGAYSINH AS [Ngày sinh], C_GIOITINH AS [Giới tính], C_DIACHIGUITHU AS [Địa chỉ gửi thư], C_EMAIL AS [Địa chỉ Email], "
                      + " C_DIENTHOAI AS [Điện thoại liên hệ], C_NGAYXUATCANH AS [Ngày xuất cảnh], C_NGAYVENUOC AS [Ngày về nước], C_TRINHDO AS [Trình độ], "
                      + " C_CONGVIECMONGMUON AS [Công việc mong muốn], C_MUCLUONG AS [Mức lương mong muốn], C_DIACHILAMVIEC AS [Địa chỉ làm việc mong muốn], "
                      + " C_CONGVIECCUTHE AS [Công việc cụ thể được giao khi làm việc tại nước ngoài], C_THOIGIANLAMVIEC AS [Thời gian làm việc], C_TENNUOC AS [Tên nước ngoài đã đi làm việc], "
                      + " C_NGOAINGU AS [Trình độ ngoại ngữ], C_NGAYGUI AS [Ngày gửi đăng ký] "
                      + " FROM T_TIMVIEC ORDER BY PK_TIMVIEC DESC";

        ds = CMS.MsSql.FillDataSet(str);
        Whatever.ExcelExport.ExportDataSetToExcel(ds, "danh-sach-dang-ky-tim-viec-trong-nuoc.xls");
    }

    protected void gvList_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex >= 0 && e.Row.RowIndex <= gvList.Rows.Count)
        {
            e.Row.Cells[1].Text = "<font face=\"tahoma\" size=\"2\">" + (gvList.PageIndex * gvList.PageSize + e.Row.RowIndex + 1) + "</font>";
        }
    }


    private void SetGallerys(string sql, string mess)
    {
        string[] arrID = Request.Form.GetValues("chkGallerys");
        if (arrID != null)
        {
            string strIDs = String.Join(",", arrID);
            if (!CMS.TTV.Rule.IsModuleRule("ds-tim-viec", CMS.TTV.Rules.APPROVE))
            {
                lblAlert.Text = "Bạn không có quyền thực hiện lệnh này";
                return;
            }
            string strSql = sql + " WHERE PK_TIMVIEC IN (" + strIDs + ")";
            CMS.MsSql.ExecuteNonQuery(strSql);
            gvList.DataBind();
            lblAlert.Text = "Đã " + mess + " thành công";
        }
        else lblAlert.Text = "Bạn chưa chọn thư viện ảnh liệu cần " + mess;
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        SetGallerys("DELETE FROM T_TIMVIEC", "xóa");
    }

    protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
    {
        gvList.PageSize = CMS.Utils.ToInteger(ddlPageSize.SelectedValue);
    }

}