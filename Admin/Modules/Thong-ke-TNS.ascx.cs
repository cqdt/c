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

public partial class Admin_Modules_Thong_ke_TNS : System.Web.UI.UserControl
{
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("Thong-ke-TNS", CMS.TTV.Rules.APPROVE))
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
    protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
    {
        gvListRegister.PageSize = CMS.Utils.ToInteger(ddlPageSize.SelectedValue);
    }
    protected void btnExportExcel_Click(object sender, EventArgs e)
    {
        string str = "SELECT t.C_HO_TEN as [Họ tên],convert(datetime, t.C_NGAY_SINH,101) as [Ngày sinh],t.C_GIOI_TINH as [Giới tính],t.C_DIA_CHI as [Địa chỉ],t.C_NGHE_NGHIEP as [Nghề nghiệp],t.C_KINH_NGHIEM as [Kinh nghiệm],t.C_BANG_CAP as [Bằng cấp],t.C_TRINH_DO_NN as [Trình độ ngoại ngữ],t.C_NGUYEN_VONG as [Nguyện vọng],t.C_THOI_GIAN_LV as [Thời gian làm việc],t.C_MUC_LUONG_YC as [Mức lương yêu cầ] from T_TNS as t";
        ds = CMS.MsSql.FillDataSet(str);
        Whatever.ExcelExport.ExportDataSetToExcel(ds, "danhsach.xls");
    }
}
