using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Admin_Modules_Services : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Request["mess"] != null)
            {
                lblAlert.Text = Request.QueryString["mess"];
            }
            int iPage = CMS.Utils.ToInteger(Request.QueryString["Page"]);
            if (iPage > 0) gvServices.PageIndex = iPage;
        }
    }

    protected void btnInsert_Click(object sender, EventArgs e)
    {
        string url = "Default.aspx?ctl=Service";
        if (gvServices.PageIndex > 0) url += "&Page=" + gvServices.PageIndex;
        Response.Redirect(url);
    }

    private void SetAdvs(string sql, string mess)
    {
        string[] arrID = Request.Form.GetValues("chkServices");
        if (arrID != null)
        {
            string strIDs = String.Join(",", arrID);
            if (!CMS.TTV.Rule.IsModuleRule("Services", CMS.TTV.Rules.APPROVE))
            {
                lblAlert.Text = "Bạn không có quyền " + mess;
                return;
            }
            string strSql = sql + " WHERE PK_SERVICE IN (" + strIDs + ")";
            CMS.MsSql.ExecuteNonQuery(strSql);
            gvServices.DataBind();
            lblAlert.Text = "Đã " + mess + " thành công";
        }
        else lblAlert.Text = "Bạn chưa chọn đối tượng cần " + mess;
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        SetAdvs("DELETE FROM T_SERVICE", "xóa");
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("Services", CMS.TTV.Rules.APPROVE))
        {
            lblAlert.Text = "Bạn không có quyền thực hiện lệnh này";
            return;
        }

        string sql = "";
        for (int i = 0; i < gvServices.Rows.Count; i++)
        {
            int iProID = CMS.Utils.ToInteger(gvServices.DataKeys[i].Value);
            double iPrice = CMS.Utils.ToDouble((gvServices.Rows[i].Cells[5].FindControl("txtPrice") as TextBox).Text);
            sql += "UPDATE T_SERVICE SET C_PRICE=" + iPrice + " WHERE PK_SERVICE=" + iProID + " ;";
        }
        //Response.Write(sql);
        lblAlert.Text = "Đã cập nhập thành công!";
        if (sql != "") CMS.MsSql.ExecuteNonQuery(sql);
    }
}
