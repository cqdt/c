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

public partial class Admin_Modules_Suports : System.Web.UI.UserControl
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
            if (iPage > 0) gvSuports.PageIndex = iPage;          
        }
    }


    protected void btnInsert_Click(object sender, EventArgs e)
    {
        string url = "Default.aspx?ctl=Suport";
        if (gvSuports.PageIndex > 0) url += "&Page=" + gvSuports.PageIndex;    
        Response.Redirect(url);
    }

    private void SetAdvs(string sql, string mess)
    {
        string[] arrID = Request.Form.GetValues("chkSuports");
        if (arrID != null)
        {
            string strIDs = String.Join(",", arrID);
            if (!CMS.TTV.Rule.IsModuleRule("Suports", CMS.TTV.Rules.APPROVE))
            {
                lblAlert.Text = "Bạn không có quyền " + mess;
                return;
            }
            string strSql = sql + " WHERE PK_SUPORT IN (" + strIDs + ")";
            CMS.MsSql.ExecuteNonQuery(strSql);
            gvSuports.DataBind();
            lblAlert.Text = "Đã " + mess + " thành công";
        }
        else lblAlert.Text = "Bạn chưa chọn đối tượng cần " + mess;
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        SetAdvs("DELETE FROM T_SUPORT", "xóa");
    }
      

}
