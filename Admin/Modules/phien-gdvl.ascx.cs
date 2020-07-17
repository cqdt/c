using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class Admin_Modules_phien_gdvl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("phien-gdvl", CMS.TTV.Rules.ONE))
        {
            CMS.Utility.HtmlHelper.Alert("Bạn không có quyền truy cập phần này", this.Page);
            CMS.Utility.HtmlHelper.Back(-1, this.Page);
            return;
        }

        if (Request["mess"] != null)
        {
            lblAlert.Text = Request.QueryString["mess"];
        }

    }


    protected void btnExport_Click(object sender, EventArgs e)
    {
        string[] arrID = Request.Form.GetValues("chkAVotes");
        if (arrID != null)
        {
            string strIDs = String.Join(",", arrID);
            string sqlext = "SELECT     dbo.T_PHIEN_GDVL.C_PHIEN [Phiên], dbo.T_PHIEN_GDVL_CHITIET.C_CTY [Công ty], dbo.T_PHIEN_GDVL_CHITIET.C_VITRI [Vị trí tuyển], dbo.T_PHIEN_GDVL_CHITIET.C_DIACHI [Địa chỉ công ty], "
                     + " dbo.T_PHIEN_GDVL_CHITIET.C_TEL [Điện thoại công ty], dbo.T_NGUOILAODONG_TV.FK_MATV [Mã Tìm việc], dbo.T_NGUOILAODONG.C_HODEM [Họ đệm], dbo.T_NGUOILAODONG.C_TEN [Tên],  "
                     + " dbo.T_NGUOILAODONG.C_CMND [Hộ chiếu]"
                     + "FROM         dbo.T_PHIEN_GDVL_CHITIET INNER JOIN "
                     + " dbo.T_PHIEN_GDVL ON dbo.T_PHIEN_GDVL_CHITIET.FK_PHIEN = dbo.T_PHIEN_GDVL.ID INNER JOIN "
                     + " dbo.T_NGUOILAODONG_TV ON dbo.T_PHIEN_GDVL_CHITIET.ID = dbo.T_NGUOILAODONG_TV.FK_PHIEN INNER JOIN "
                     + " dbo.T_NGUOILAODONG ON dbo.T_NGUOILAODONG_TV.FK_MATV = dbo.T_NGUOILAODONG.C_MATIMVIEC "
                     + " WHERE  dbo.T_PHIEN_GDVL.ID in (" + strIDs + ")";
            DataSet ds = new DataSet();
            ds = CMS.MsSql.FillDataSet(sqlext);
            Whatever.ExcelExport.ExportDataSetToExcel(ds, "danh-sach-nguoi-lao-dong-dang-ky-tim-viec-tai-phien-gdvl.xls");

        }
    }

    protected void btnInsert_Click(object sender, EventArgs e)
    {
        string url = "Default.aspx?ctl=phien-gdvl-detail";       
        Response.Redirect(url);
    }

    private void SetAVotes(string sql, string mess)
    {
        string[] arrID = Request.Form.GetValues("chkAVotes");
        if (arrID != null)
        {
            string strIDs = String.Join(",", arrID);
            if (!CMS.TTV.Rule.IsModuleRule("phien-gdvl", CMS.TTV.Rules.APPROVE))
            {
                lblAlert.Text = "Bạn không có quyền " + mess;
                return;
            }
            string strSql = sql + " WHERE ID IN (" + strIDs + ")";
            CMS.MsSql.ExecuteNonQuery(strSql);
            gvAVotes.DataBind();
            lblAlert.Text = "Đã " + mess + " thành công";
        }
        else lblAlert.Text = "Bạn chưa chọn bản ghi cần " + mess;
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        SetAVotes("DELETE FROM T_PHIEN_GDVL", "xóa");
    }


}