using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class Admin_Modules_Tim_viecs : System.Web.UI.UserControl
{
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("Tim-viecs", CMS.TTV.Rules.APPROVE))
        {
            lblAlert.Text = "Bạn không có quyền thực hiện lệnh này";
            return;
        }
    }
    protected void gvListRegister_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex >= 0 && e.Row.RowIndex <= gvListRegister.Rows.Count)
        {
            e.Row.Cells[0].Text = "<font face=\"tahoma\" size=\"2\">" + (gvListRegister.PageIndex * gvListRegister.PageSize + e.Row.RowIndex + 1) + "</font>";
        }
    }
    
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        SetAdvs("DELETE FROM T_TIM_VIEC", "xóa");
    }
    private void SetAdvs(string sql, string mess)
    {
        string[] arrID = Request.Form.GetValues("chkFAQs");
        if (arrID != null)
        {
            string strIDs = String.Join(",", arrID);
            if (!CMS.TTV.Rule.IsModuleRule("Tim-viecs", CMS.TTV.Rules.APPROVE))
            {
                lblAlert.Text = "Bạn không có quyền " + mess;
                return;
            }
            string strSql = sql + " WHERE PK_TIM_VIEC IN (" + strIDs + ")";
            CMS.MsSql.ExecuteNonQuery(strSql);
            gvListRegister.DataBind();
            lblAlert.Text = "Đã " + mess + " thành công";
        }
        else lblAlert.Text = "Bạn chưa chọn đối tượng cần " + mess;
    }
    protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
    {
        gvListRegister.PageSize = CMS.Utils.ToInteger(ddlPageSize.SelectedValue);
    }
    protected void btnThemmoi_Click(object sender, EventArgs e)
    {
        string url = "Default.aspx?ctl=Tim-viec";
        if (gvListRegister.PageIndex > 0) url += "&Page=" + gvListRegister.PageIndex;
        url += "&PageSize=" + ddlPageSize.SelectedValue;
        Response.Redirect(url);
    }
    protected void btnExportExcel_Click(object sender, EventArgs e)
    {
         string str = "select PK_TIM_VIEC as [ID], C_TITLE as [Tiêu đề], C_HO_TEN as [Họ tên], C_NGAY_SINH as [Ngày sinh], C_GIOI_TINH as [Giới tính], C_TINH_TRANG_HON_NHAN as [Tình trạng hôn nhân], C_DIA_CHI as [Địa chỉ], C_DIEN_THOAI as [Điện thoại], ";
        str += "C_DI_DONG as [Di động], C_TRINH_DO as [Trình độ], C_EMAIL as [Email],C_MONG_MUON as [Mong muốn], C_CHUC_DANH as [Chức danh], C_MO_TA_CONG_VIEC as [Mô tả công việc], C_MUC_LUONG_HIEN_TAI as [Mức lương hiện tại], ";
        str += "C_MUC_LUONG_MONG_MUON as [Mức lương mong muốn], C_LOAI_HINH_CV as [Loại hình công việc], C_NGANH_NGHE_MONG_MUON as [Ngành nghề mong muốn], C_DIA_DIEM as [Địa điểm], C_DI_CHUYEN as [Sẵn sàng di chuyển], C_BANG_CAP as [Bằng cấp], ";
        str += "C_TRUONG_TN as [Trường tốt nghiệp], C_NAM as [Năm], C_NOI_DUNG_HOC as [Nội dung học], C_KINH_NGHIEM as [Kinh nghiệm], C_KI_NANG as [Kỹ năng], C_TU as [Từ], C_DEN as [Đến], C_LAM as [Làm] FROM T_TIM_VIEC where 1=1";
        if (txtTitle.Text != "") str += " and C_TITLE LIKE N'%" + txtTitle.Text + "%'";
        if (txtnganhnghe.Text != "") str += " and C_NGANH_NGHE_MONG_MUON LIKE N'%" + txtnganhnghe.Text + "%'";
        if (txtbangcap.Text != "") str += " and C_BANG_CAP LIKE N'%" + txtbangcap.Text + "%'";
        ds = CMS.MsSql.FillDataSet(str);
        Whatever.ExcelExport.ExportDataSetToExcel(ds, "danhsach.xls");
    }
}
