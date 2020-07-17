using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class Admin_Modules_Register_CEs : System.Web.UI.UserControl
{
    DataTable dt = new DataTable();
    DataSet ds = new DataSet();
    public int total;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("Register_CEs", CMS.TTV.Rules.APPROVE))
        {
            lblAlert.Text = "Bạn không có quyền thực hiện lệnh này";
            return;
        }
        string str = "SELECT t.C_MA_SO_LAO_DONG as [Số báo danh],t.C_HO_TEN as [Họ tên],convert(varchar, t.C_NGAY_SINH,101) as [Ngày sinh],t.C_DIA_CHI as [Địa chỉ],t.C_SO_HO_CHIEU as [Số hộ chiếu],s.C_MA as [Mã trung tâm],s.C_TEN as [Trung tâm],t.C_SO_CHUNG_CHI as [Số chứng chỉ],convert(varchar, t.C_NGAY_CAP,101) as [Ngày cấp] from T_CE as t,T_TT as s where (t.FK_TT=s.PK_TT)";
        ds = CMS.MsSql.FillDataSet(str);
        total = ds.Tables[0].Rows.Count;
       
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
        SetAdvs("DELETE FROM T_CE", "xóa");
    }
    private void SetAdvs(string sql, string mess)
    {
        string[] arrID = Request.Form.GetValues("chkFAQs");
        if (arrID != null)
        {
            string strIDs = String.Join(",", arrID);
            if (!CMS.TTV.Rule.IsModuleRule("Register_CEs", CMS.TTV.Rules.APPROVE))
            {
                lblAlert.Text = "Bạn không có quyền " + mess;
                return;
            }
            string strSql = sql + " WHERE PK_CE IN (" + strIDs + ")";
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
        string url = "Default.aspx?ctl=Register_CE";
        if (gvListRegister.PageIndex > 0) url += "&Page=" + gvListRegister.PageIndex;
        url += "&PageSize=" + ddlPageSize.SelectedValue;        
        Response.Redirect(url);
    }
    protected void btnExportExcel_Click(object sender, EventArgs e)
    {
        Whatever.ExcelExport.ExportDataSetToExcel(ds, "danhsach.xls");
    } 
}
