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

public partial class Admin_Modules_dm_vi_tri : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("dm-vi-tri", CMS.TTV.Rules.ONE))
        {
            CMS.Utility.HtmlHelper.Alert("Bạn không có quyền truy cập phần này", this.Page);
            CMS.Utility.HtmlHelper.Back(-1, this.Page);
            return;
        }
        if (!Page.IsPostBack)
        {
            if (Request["mess"] != null)
            {
                lblAlert.Text = Request.QueryString["mess"];
            }
            int iPage = CMS.Utils.ToInteger(Request.QueryString["Page"]);
            if (iPage > 0) gvAVotes.PageIndex = iPage;

        }
    }


    protected void btnInsert_Click(object sender, EventArgs e)
    {
        string url = "Default.aspx?ctl=detail-vi-tri";
        if (gvAVotes.PageIndex > 0) url += "&Page=" + gvAVotes.PageIndex;
        Response.Redirect(url);
    }

    private void SetAVotes(string sql, string mess)
    {
        string[] arrID = Request.Form.GetValues("chkAVotes");
        if (arrID != null)
        {
            string strIDs = String.Join(",", arrID);
            if (!CMS.TTV.Rule.IsModuleRule("dm-vi-tri", CMS.TTV.Rules.APPROVE))
            {
                lblAlert.Text = "Bạn không có quyền " + mess;
                return;
            }
            string strSql = sql + " WHERE ID IN (" + strIDs + ")";
            CMS.MsSql.ExecuteNonQuery(strSql);
            gvAVotes.DataBind();
            lblAlert.Text = "Đã " + mess + " thành công";
        }
        else lblAlert.Text = "Bạn chưa chọn câu trả lời cần " + mess;
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        SetAVotes("DELETE FROM T_DM_VITRI", "xóa");
    }





}