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

public partial class Admin_Modules_Links : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("Links", CMS.TTV.Rules.APPROVE))
        {
            lblAlert.Text = "Bạn không có quyền thực hiện lệnh này";
            return;
        }
        if (!Page.IsPostBack)
        {
            if (Request["mess"] != null)
            {
                lblAlert.Text = Request.QueryString["mess"];
            }
            int iPage = CMS.Utils.ToInteger(Request.QueryString["Page"]);
            if (iPage > 0) gvLinks.PageIndex = iPage;
            int iLangID = CMS.Utils.ToInteger(Request.QueryString["LangID"]);
            if (iLangID > 0)
            {
                try
                {
                    ddlLang.SelectedValue = iLangID + "";
                    ddlLang.DataBind();
                }
                catch { }
            }

            int iOrder = CMS.Utils.ToInteger(Request.QueryString["udID"]);
            if (iOrder > 0)
            {
                if (CMS.TTV.Rule.IsModuleRule("Links", CMS.TTV.Rules.APPROVE))
                {
                    int iLinkID = CMS.Utils.ToInteger(Request.QueryString["fID"]);
                    DataTable dtLinks = CMS.MsSql.FillDataTable("SELECT PK_LINK,C_ORDER FROM T_LINK WHERE FK_LANG=(SELECT FK_LANG FROM T_LINK WHERE PK_LINK=" + iLinkID + ")");
                    DataRow[] dr;
                    int iLinkOrderID = 0;
                    int iLinkIDOrder = 0;
                    dr = dtLinks.Select("C_ORDER = " + iOrder);
                    if (dr.Length > 0) iLinkOrderID = CMS.Utils.ToInteger(dr[0]["PK_LINK"]);
                    dr = dtLinks.Select("PK_LINK = " + iLinkID);
                    if (dr.Length > 0) iLinkIDOrder = CMS.Utils.ToInteger(dr[0]["C_ORDER"]);
                    string sql = "UPDATE T_LINK SET C_ORDER=" + iOrder + " WHERE PK_LINK=" + iLinkID;
                    sql += "; UPDATE T_LINK SET C_ORDER=" + iLinkIDOrder + " WHERE PK_LINK=" + iLinkOrderID;
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
        string url = "Default.aspx?ctl=Link";
        if (gvLinks.PageIndex > 0) url += "&Page=" + gvLinks.PageIndex;
        url += "&LangID=" + ddlLang.SelectedValue;
        Response.Redirect(url);
    }

    private void SetLinks(string sql, string mess)
    {
        string[] arrID = Request.Form.GetValues("chkLinks");
        if (arrID != null)
        {
            string strIDs = String.Join(",", arrID);
            if (!CMS.TTV.Rule.IsModuleRule("Links", CMS.TTV.Rules.APPROVE))
            {
                lblAlert.Text = "Bạn không có quyền " + mess;
                return;
            }
            string strSql = sql + " WHERE PK_LINK IN (" + strIDs + ")";
            CMS.MsSql.ExecuteNonQuery(strSql);
            gvLinks.DataBind();
            lblAlert.Text = "Đã " + mess + " thành công";
        }
        else lblAlert.Text = "Bạn chưa chọn cần " + mess;
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        SetLinks("DELETE FROM T_LINK", "xóa");
    }

    protected void btnSetStatus_Click(object sender, EventArgs e)
    {
        SetLinks("UPDATE T_LINK SET C_STATUS=1", "hiển thị");
    }

    protected void btnUnSetStatus_Click(object sender, EventArgs e)
    {
        SetLinks("UPDATE T_LINK SET C_STATUS=0", "bỏ hiển thị");
    }

    string getURL()
    {
        string url = "";
        if (gvLinks.PageIndex > 0) url += "&Page=" + gvLinks.PageIndex;
        url += "&LangID=" + ddlLang.SelectedValue;
        return url;
    }

    protected void gvLinks_PreRender(object sender, EventArgs e)
    {
        int iLangID = CMS.Utils.ToInteger(ddlLang.SelectedValue);
        DataTable dtLinks = CMS.MsSql.FillDataTable("SELECT PK_LINK,C_ORDER FROM T_LINK WHERE FK_LANG=" + iLangID);
        DataRow[] dr;
        int iLinkID = 0;
        int iUp = 0;
        int iDown = 0;
        int iOrder = 0;
        for (int i = 0; i < gvLinks.Rows.Count; i++)
        {
            iLinkID = CMS.Utils.ToInteger(gvLinks.DataKeys[i].Value);
            dr = dtLinks.Select("PK_LINK = " + iLinkID);
            if (dr.Length > 0) iOrder = CMS.Utils.ToInteger(dr[0]["C_ORDER"]);
            dr = dtLinks.Select("C_ORDER > " + iOrder);
            if (dr.Length > 0) iDown = CMS.Utils.ToInteger(dr[0]["C_ORDER"]);
            dr = dtLinks.Select("C_ORDER < " + iOrder);
            if (dr.Length > 0) iUp = CMS.Utils.ToInteger(dr[dr.Length - 1]["C_ORDER"]);
            if (i == 0 && gvLinks.PageIndex == 0)
            {
                if (gvLinks.Rows.Count > 1) gvLinks.Rows[0].Cells[1].Text = "<a href='Default.aspx?ctl=Links&fID=" + iLinkID + "&udID=" + iDown + getURL() + "'><img src='Images/down.gif' border='0' /></a>";
                // else gvLinks.Columns.RemoveAt(1);
            }
            else if ((i == gvLinks.Rows.Count - 1 && i != 0 && gvLinks.PageIndex == gvLinks.PageCount - 1) || (i == 0 && gvLinks.Rows.Count == 1))
            {
                gvLinks.Rows[i].Cells[1].Text = "<a href='Default.aspx?ctl=Links&fID=" + iLinkID + "&udID=" + iUp + getURL() + "'><img src='Images/up.gif' border='0' /></a>";
            }
            else
            {
                gvLinks.Rows[i].Cells[1].Text = "<a href='Default.aspx?ctl=Links&fID=" + iLinkID + "&udID=" + iDown + getURL() + "'><img src='Images/down.gif' border='0' /></a> <a href='Default.aspx?ctl=Links&fID=" + iLinkID + "&udID=" + iUp + getURL() + "'><img src='Images/up.gif' border='0' /></a>";
            }
        }
    }

}
