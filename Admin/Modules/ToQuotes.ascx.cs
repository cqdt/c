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

public partial class Admin_Modules_ToQuotes : System.Web.UI.UserControl
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
            if (iPage > 0) gvToQuotes.PageIndex = iPage;
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
                if (CMS.TTV.Rule.IsModuleRule("ToQuotes", CMS.TTV.Rules.APPROVE))
                {
                    int iToQuoteID = CMS.Utils.ToInteger(Request.QueryString["fID"]);
                    DataTable dtToQuotes = CMS.MsSql.FillDataTable("SELECT PK_TOQUOTE,C_ORDER FROM T_TOQUOTE WHERE FK_LANG=(SELECT a.FK_LANG FROM T_TOQUOTE AS a WHERE a.PK_TOQUOTE=" + iToQuoteID + ")");
                    DataRow[] dr;
                    int iTOQUOTEOrderID = 0;
                    int iToQuoteIDOrder = 0;
                    dr = dtToQuotes.Select("C_ORDER = " + iOrder);
                    if (dr.Length > 0) iTOQUOTEOrderID = CMS.Utils.ToInteger(dr[0]["PK_TOQUOTE"]);
                    dr = dtToQuotes.Select("PK_TOQUOTE = " + iToQuoteID);
                    if (dr.Length > 0) iToQuoteIDOrder = CMS.Utils.ToInteger(dr[0]["C_ORDER"]);
                    string sql = "UPDATE T_TOQUOTE SET C_ORDER=" + iOrder + " WHERE PK_TOQUOTE=" + iToQuoteID;
                    sql += "; UPDATE T_TOQUOTE SET C_ORDER=" + iToQuoteIDOrder + " WHERE PK_TOQUOTE=" + iTOQUOTEOrderID;
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
        string url = "Default.aspx?ctl=ToQuote";
        if (gvToQuotes.PageIndex > 0) url += "&Page=" + gvToQuotes.PageIndex;
        url += "&LangID=" + ddlLang.SelectedValue;
        Response.Redirect(url);
    }

    private void SetToQuotes(string sql, string mess)
    {
        string[] arrID = Request.Form.GetValues("chkToQuotes");
        if (arrID != null)
        {
            string strIDs = String.Join(",", arrID);
            if (!CMS.TTV.Rule.IsModuleRule("ToQuotes", CMS.TTV.Rules.APPROVE))
            {
                lblAlert.Text = "Bạn không có quyền " + mess;
                return;
            }
            string strSql = sql + " WHERE PK_TOQUOTE IN (" + strIDs + ")";
            CMS.MsSql.ExecuteNonQuery(strSql);
            gvToQuotes.DataBind();
            lblAlert.Text = "Đã " + mess + " thành công";
        }
        else lblAlert.Text = "Bạn chưa chọn báo giá cần " + mess;
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        SetToQuotes("DELETE FROM T_TOQUOTE", "xóa");
    }

    protected void btnSetStatus_Click(object sender, EventArgs e)
    {
        SetToQuotes("UPDATE T_TOQUOTE SET C_STATUS=1", "hiển thị");
    }

    protected void btnUnSetStatus_Click(object sender, EventArgs e)
    {
        SetToQuotes("UPDATE T_TOQUOTE SET C_STATUS=0", "bỏ hiển thị");
    }

    string getURL()
    {
        string url = "";
        if (gvToQuotes.PageIndex > 0) url += "&Page=" + gvToQuotes.PageIndex;
        url += "&LangID=" + ddlLang.SelectedValue;
        return url;
    }

    protected void gvToQuotes_PreRender(object sender, EventArgs e)
    {
        int iLangID = CMS.Utils.ToInteger(ddlLang.SelectedValue);
        DataTable dtToQuotes = CMS.MsSql.FillDataTable("SELECT PK_TOQUOTE,C_ORDER FROM T_TOQUOTE WHERE FK_LANG=" + iLangID);
        DataRow[] dr;
        int iToQuoteID = 0;
        int iUp = 0;
        int iDown = 0;
        int iOrder = 0;
        for (int i = 0; i < gvToQuotes.Rows.Count; i++)
        {
            iToQuoteID = CMS.Utils.ToInteger(gvToQuotes.DataKeys[i].Value);
            dr = dtToQuotes.Select("PK_TOQUOTE = " + iToQuoteID);
            if (dr.Length > 0) iOrder = CMS.Utils.ToInteger(dr[0]["C_ORDER"]);
            dr = dtToQuotes.Select("C_ORDER > " + iOrder);
            if (dr.Length > 0) iUp = CMS.Utils.ToInteger(dr[0]["C_ORDER"]);
            dr = dtToQuotes.Select("C_ORDER < " + iOrder);
            if (dr.Length > 0) iDown = CMS.Utils.ToInteger(dr[dr.Length - 1]["C_ORDER"]);
            if (i == 0 && gvToQuotes.PageIndex == 0)
            {
                if (gvToQuotes.Rows.Count > 1) gvToQuotes.Rows[0].Cells[1].Text = "<a href='Default.aspx?ctl=ToQuotes&fID=" + iToQuoteID + "&udID=" + iDown + getURL() + "'><img src='Images/down.gif' border='0' /></a>";
                // else gvToQuotes.Columns.RemoveAt(1);
            }
            else if ((i == gvToQuotes.Rows.Count - 1 && i != 0 && gvToQuotes.PageIndex == gvToQuotes.PageCount - 1) || (i == 0 && gvToQuotes.Rows.Count == 1))
            {
                gvToQuotes.Rows[i].Cells[1].Text = "<a href='Default.aspx?ctl=ToQuotes&fID=" + iToQuoteID + "&udID=" + iUp + getURL() + "'><img src='Images/up.gif' border='0' /></a>";
            }
            else
            {
                gvToQuotes.Rows[i].Cells[1].Text = "<a href='Default.aspx?ctl=ToQuotes&fID=" + iToQuoteID + "&udID=" + iDown + getURL() + "'><img src='Images/down.gif' border='0' /></a> <a href='Default.aspx?ctl=ToQuotes&fID=" + iToQuoteID + "&udID=" + iUp + getURL() + "'><img src='Images/up.gif' border='0' /></a>";
            }
        }
    }

}
