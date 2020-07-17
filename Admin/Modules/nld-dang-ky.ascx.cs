using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class Admin_Modules_nld_dang_ky : System.Web.UI.UserControl
{

    DataSet ds = new DataSet();
    public int total;


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("nld-dang-ky", CMS.TTV.Rules.APPROVE))
        {
            lblAlert.Text = "Bạn không có quyền thực hiện lệnh này";
            return;
        }

        if (Request.QueryString["fID"] != null)
        {
            string MaTV = Request.QueryString["fID"].ToString();
            total = CMS.MsSql.ExecuteToInt("SELECT COUNT(*) AS Expr1 FROM dbo.T_NGUOILAODONG INNER JOIN  dbo.T_NGUOILAODONG_TV ON dbo.T_NGUOILAODONG.C_MATIMVIEC = dbo.T_NGUOILAODONG_TV.FK_MATV INNER JOIN dbo.T_TUYENDUNG_VIECLAM ON dbo.T_NGUOILAODONG_TV.FK_TUYENDUNGVL = dbo.T_TUYENDUNG_VIECLAM.ID WHERE     (dbo.T_NGUOILAODONG_TV.FK_MATV = '" + MaTV + "')");
        }
    }

    //protected void btnExportExcel_Click(object sender, EventArgs e)
    //{
    //}

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
            if (!CMS.TTV.Rule.IsModuleRule("nld-dang-ky", CMS.TTV.Rules.APPROVE))
            {
                lblAlert.Text = "Bạn không có quyền thực hiện lệnh này";
                return;
            }
            string strSql = sql + " WHERE ID IN (" + strIDs + ")";
            CMS.MsSql.ExecuteNonQuery(strSql);
            gvList.DataBind();
            lblAlert.Text = "Đã " + mess + " thành công";
        }
        else lblAlert.Text = "Bạn chưa chọn thư viện ảnh liệu cần " + mess;
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        SetGallerys("DELETE FROM T_NGUOILAODONG_TV", "xóa");
    }

    protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
    {
        gvList.PageSize = CMS.Utils.ToInteger(ddlPageSize.SelectedValue);
    }



}