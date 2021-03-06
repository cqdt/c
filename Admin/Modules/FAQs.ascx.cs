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

public partial class Admin_Modules_FAQs : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("FAQs", CMS.TTV.Rules.ONE))
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
            if (iPage > 0) gvFAQs.PageIndex = iPage;
            int iLangID = CMS.Utils.ToInteger(Request.QueryString["LangID"]);
            if (iLangID > 0)
            {
                try { ddlLang.SelectedValue = iLangID + ""; }
                catch { }
            }

            int iOrder = CMS.Utils.ToInteger(Request.QueryString["udID"]);
            if (iOrder > 0)
            {
                if (CMS.TTV.Rule.IsModuleRule("FAQs", CMS.TTV.Rules.APPROVE))
                {
                    int iFAQID = CMS.Utils.ToInteger(Request.QueryString["fID"]);
                    DataTable dtFAQs = CMS.MsSql.FillDataTable("SELECT PK_FAQ,C_ORDER FROM T_FAQ WHERE FK_LANG=(SELECT FK_LANG FROM T_FAQ WHERE PK_FAQ=" + iFAQID + ")");
                    DataRow[] dr;
                    int iFAQOrderID = 0;
                    int iFAQIDOrder = 0;
                    dr = dtFAQs.Select("C_ORDER = " + iOrder);
                    if (dr.Length > 0) iFAQOrderID = CMS.Utils.ToInteger(dr[0]["PK_FAQ"]);
                    dr = dtFAQs.Select("PK_FAQ = " + iFAQID);
                    if (dr.Length > 0) iFAQIDOrder = CMS.Utils.ToInteger(dr[0]["C_ORDER"]);
                    string sql = "UPDATE T_FAQ SET C_ORDER=" + iOrder + " WHERE PK_FAQ=" + iFAQID;
                    sql += "; UPDATE T_FAQ SET C_ORDER=" + iFAQIDOrder + " WHERE PK_FAQ=" + iFAQOrderID;
                    //Response.Write(sql);
                    CMS.MsSql.ExecuteNonQuery(sql);
                }
                else
                {
                    lblAlert.Text = "Bạn không có quyền di chuyển";
                }
            }
        }
    }

    protected void btnInsert_Click(object sender, EventArgs e)
    {
       
        string url = "Default.aspx?ctl=FAQ";
        if (gvFAQs.PageIndex > 0) url += "&Page=" + gvFAQs.PageIndex;
        url += "&LangID=" + ddlLang.SelectedValue;
        url += "&type=" + ddlType.SelectedValue;
        Response.Redirect(url);
    }

    private void SetFAQs(string sql, string mess)
    {
        string[] arrID = Request.Form.GetValues("chkFAQs");
        if (arrID != null)
        {
            string strIDs = String.Join(",", arrID);
            if (!CMS.TTV.Rule.IsModuleRule("FAQs", CMS.TTV.Rules.APPROVE))
            {
                lblAlert.Text = "Bạn không có quyền " + mess;
                return;
            }
            string strSql = sql + " WHERE PK_FAQ IN (" + strIDs + ")";
            CMS.MsSql.ExecuteNonQuery(strSql);
            gvFAQs.DataBind();
            lblAlert.Text = "Đã " + mess + " thành công";
        }
        else lblAlert.Text = "Bạn chưa chọn câu hỏi cần " + mess;
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        SetFAQs("DELETE FROM T_FAQ", "xóa");
    }

    protected void btnSetStatus_Click(object sender, EventArgs e)
    {
        SetFAQs("UPDATE T_FAQ SET C_STATUS=1", "hiển thị");
    }

    protected void btnUnSetStatus_Click(object sender, EventArgs e)
    {
        SetFAQs("UPDATE T_FAQ SET C_STATUS=0", "bỏ hiển thị");
    }

    string getURL()
    {
        string url = "";
        if (gvFAQs.PageIndex > 0) url += "&Page=" + gvFAQs.PageIndex;
        url += "&LangID=" + ddlLang.SelectedValue;
        url += "&type=" + ddlType.SelectedValue;
        return url;
    }

    protected void gvFAQs_PreRender(object sender, EventArgs e)
    {
        int iLangID = CMS.Utils.ToInteger(ddlLang.SelectedValue);
        DataTable dtFAQs = CMS.MsSql.FillDataTable("SELECT PK_FAQ,C_ORDER FROM T_FAQ WHERE FK_LANG=" + iLangID);
        DataRow[] dr;
        int iFAQID = 0;
        int iUp = 0;
        int iDown = 0;
        int iOrder = 0;
        for (int i = 0; i < gvFAQs.Rows.Count; i++)
        {
            iFAQID = CMS.Utils.ToInteger(gvFAQs.DataKeys[i].Value);
            dr = dtFAQs.Select("PK_FAQ = " + iFAQID);
            if (dr.Length > 0) iOrder = CMS.Utils.ToInteger(dr[0]["C_ORDER"]);
            dr = dtFAQs.Select("C_ORDER > " + iOrder);
            if (dr.Length > 0) iUp = CMS.Utils.ToInteger(dr[0]["C_ORDER"]);
            dr = dtFAQs.Select("C_ORDER < " + iOrder);
            if (dr.Length > 0) iDown = CMS.Utils.ToInteger(dr[dr.Length - 1]["C_ORDER"]);
            if (i == 0 && gvFAQs.PageIndex == 0)
            {
                if (gvFAQs.Rows.Count > 1) gvFAQs.Rows[0].Cells[1].Text = "<a href='Default.aspx?ctl=FAQs&fID=" + iFAQID + "&udID=" + iDown + getURL() + "'><img src='Images/down.gif' border='0' /></a>";
                // else gvFAQs.Columns.RemoveAt(1);
            }
            else if ((i == gvFAQs.Rows.Count - 1 && i != 0 && gvFAQs.PageIndex == gvFAQs.PageCount - 1) || (i == 0 && gvFAQs.Rows.Count == 1))
            {
                gvFAQs.Rows[i].Cells[1].Text = "<a href='Default.aspx?ctl=FAQs&fID=" + iFAQID + "&udID=" + iUp + getURL() + "'><img src='Images/up.gif' border='0' /></a>";
            }
            else
            {
                gvFAQs.Rows[i].Cells[1].Text = "<a href='Default.aspx?ctl=FAQs&fID=" + iFAQID + "&udID=" + iDown + getURL() + "'><img src='Images/down.gif' border='0' /></a> <a href='Default.aspx?ctl=FAQs&fID=" + iFAQID + "&udID=" + iUp + getURL() + "'><img src='Images/up.gif' border='0' /></a>";
            }
        }
    }
}