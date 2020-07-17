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

public partial class Admin_Modules_Danh_sach_dang_ky_cap_CE : System.Web.UI.UserControl
{
    DataSet ds = new DataSet();
    public int total;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("Danh-sach-dang-ky-cap-CE", CMS.TTV.Rules.APPROVE))
        {
            lblAlert.Text = "Bạn không có quyền thực hiện lệnh này";
            return;
        }
        Binddata();
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
        Binddata();
    }
    protected void btnExportExcel_Click(object sender, EventArgs e)
    {        
        Whatever.ExcelExport.ExportDataSetToExcel(ds, "danhsach.xls");
    }
    protected void ddlNganh_SelectedIndexChanged(object sender, EventArgs e)
    {
        Binddata();
    }
    protected void ddlNganh_DataBound(object sender, EventArgs e)
    {
        ddlNganh.Items.Insert(0, new ListItem("--- Tất cả ---", ""));
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Binddata();
    }

    public void Binddata()
    {
        string str = "SELECT t.C_MA_SO_LAO_DONG as [Số báo danh],t.C_HO_TEN as [Họ tên],convert(datetime, t.C_NGAY_SINH,101) as [Ngày sinh],t.C_DIA_CHI as [Địa chỉ],t.C_SO_HO_CHIEU as [Số hộ chiếu],t.C_TRUNG_TAM_DT as [Trung tâm đào tạo],t.C_MA_TRUNG_TAM as [Mã trung tâm đào tạo],t.C_SO_CHUNG_CHI as [Số chứng chỉ],convert(datetime,t.C_NGAY_CAP,101) as [Ngày cấp] from T_CAP_CE as t where 1=1";
        if (ddlNganh.SelectedValue != "") str += " and C_MA_TRUNG_TAM=N'" + ddlNganh.SelectedValue + "'";
        if ((CMS.Utils.ToString(raddTungay.SelectedDate) != "") && (CMS.Utils.ToString(raddDenngay.SelectedDate) != "")) str += " and CONVERT(DATETIME,C_NGAY_CAP,101) BETWEEN CONVERT(DATETIME,'" + string.Format("{0:MM/dd/yyyy}", raddTungay.SelectedDate) + "',101) AND CONVERT(DATETIME,'" + string.Format("{0:MM/dd/yyyy}", raddDenngay.SelectedDate) + "',101)";
       // str += "order by PK_CE desc";
        ds = CMS.MsSql.FillDataSet(str);
        total = ds.Tables[0].Rows.Count;
        string sql = "SELECT * from T_CAP_CE where 1=1";
        if (ddlNganh.SelectedValue != "") sql += " and C_MA_TRUNG_TAM=N'" + ddlNganh.SelectedValue + "'";
        if ((CMS.Utils.ToString(raddTungay.SelectedDate) != "") && (CMS.Utils.ToString(raddDenngay.SelectedDate) != "")) sql += " and CONVERT(DATETIME,C_NGAY_CAP,101) BETWEEN CONVERT(DATETIME,'" + string.Format("{0:MM/dd/yyyy}", raddTungay.SelectedDate) + "',101) AND CONVERT(DATETIME,'" + string.Format("{0:MM/dd/yyyy}", raddDenngay.SelectedDate) + "',101)";
        sql += "order by PK_CE desc";
        DataTable dtNews = CMS.SqlCache.FillDataTable(sql);
        this.gvListRegister.DataSource = dtNews;
        gvListRegister.DataBind();
    }
}
