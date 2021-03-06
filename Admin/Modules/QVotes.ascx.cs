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

public partial class Admin_Modules_QVotes : System.Web.UI.UserControl
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
            if (iPage > 0) gvQVotes.PageIndex = iPage;
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
                if (CMS.TTV.Rule.IsModuleRule("QVotes", CMS.TTV.Rules.APPROVE))
                {
                    int iQVoteID = CMS.Utils.ToInteger(Request.QueryString["fID"]);
                    DataTable dtQVotes = CMS.MsSql.FillDataTable("SELECT PK_QVOTE,C_ORDER FROM T_QVOTE WHERE FK_LANG=(SELECT a.FK_LANG FROM T_QVOTE AS a WHERE a.PK_QVOTE=" + iQVoteID + ")");
                    DataRow[] dr;
                    int iQVOTEOrderID = 0;
                    int iQVoteIDOrder = 0;
                    dr = dtQVotes.Select("C_ORDER = " + iOrder);
                    if (dr.Length > 0) iQVOTEOrderID = CMS.Utils.ToInteger(dr[0]["PK_QVOTE"]);
                    dr = dtQVotes.Select("PK_QVOTE = " + iQVoteID);
                    if (dr.Length > 0) iQVoteIDOrder = CMS.Utils.ToInteger(dr[0]["C_ORDER"]);
                    string sql = "UPDATE T_QVOTE SET C_ORDER=" + iOrder + " WHERE PK_QVOTE=" + iQVoteID;
                    sql += "; UPDATE T_QVOTE SET C_ORDER=" + iQVoteIDOrder + " WHERE PK_QVOTE=" + iQVOTEOrderID;
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
        string url = "Default.aspx?ctl=QVote";
        if (gvQVotes.PageIndex > 0) url += "&Page=" + gvQVotes.PageIndex;
        url += "&LangID=" + ddlLang.SelectedValue;
        Response.Redirect(url);
    }

    private void SetQVotes(string sql, string mess)
    {
        string[] arrID = Request.Form.GetValues("chkQVotes");
        if (arrID != null)
        {
            string strIDs = String.Join(",", arrID);
            if (!CMS.TTV.Rule.IsModuleRule("QVotes", CMS.TTV.Rules.APPROVE))
            {
                lblAlert.Text = "Bạn không có quyền " + mess;
                return;
            }
            string strSql = sql + " WHERE PK_QVOTE IN (" + strIDs + ")";
            if (mess == "xóa")
            {
                strSql += " ; DELETE FROM T_AVOTE WHERE FK_QVOTE IN (" + strIDs + ")";
            }
            CMS.MsSql.ExecuteNonQuery(strSql);
            gvQVotes.DataBind();
            lblAlert.Text = "Đã " + mess + " thành công";
        }
        else lblAlert.Text = "Bạn chưa chọn câu hỏi cần " + mess;
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        SetQVotes("DELETE FROM T_QVOTE", "xóa");
    }

    protected void btnSetStatus_Click(object sender, EventArgs e)
    {
        SetQVotes("UPDATE T_QVOTE SET C_STATUS=1", "hiển thị");
    }

    protected void btnUnSetStatus_Click(object sender, EventArgs e)
    {
        SetQVotes("UPDATE T_QVOTE SET C_STATUS=0", "bỏ hiển thị");
    }

    string getURL()
    {
        string url = "";
        if (gvQVotes.PageIndex > 0) url += "&Page=" + gvQVotes.PageIndex;
        url += "&LangID=" + ddlLang.SelectedValue;
        return url;
    }

    protected void gvQVotes_PreRender(object sender, EventArgs e)
    {
        int iLangID = CMS.Utils.ToInteger(ddlLang.SelectedValue);
        DataTable dtQVotes = CMS.MsSql.FillDataTable("SELECT PK_QVOTE,C_ORDER FROM T_QVOTE WHERE FK_LANG=" + iLangID);
        DataRow[] dr;
        int iQVoteID = 0;
        int iUp = 0;
        int iDown = 0;
        int iOrder = 0;
        for (int i = 0; i < gvQVotes.Rows.Count; i++)
        {
            iQVoteID = CMS.Utils.ToInteger(gvQVotes.DataKeys[i].Value);
            dr = dtQVotes.Select("PK_QVOTE = " + iQVoteID);
            if (dr.Length > 0) iOrder = CMS.Utils.ToInteger(dr[0]["C_ORDER"]);
            dr = dtQVotes.Select("C_ORDER > " + iOrder);
            if (dr.Length > 0) iUp = CMS.Utils.ToInteger(dr[0]["C_ORDER"]);
            dr = dtQVotes.Select("C_ORDER < " + iOrder);
            if (dr.Length > 0) iDown = CMS.Utils.ToInteger(dr[dr.Length - 1]["C_ORDER"]);
            if (i == 0 && gvQVotes.PageIndex == 0)
            {
                if (gvQVotes.Rows.Count > 1) gvQVotes.Rows[0].Cells[1].Text = "<a href='Default.aspx?ctl=QVotes&fID=" + iQVoteID + "&udID=" + iDown + getURL() + "'><img src='Images/down.gif' border='0' /></a>";
                // else gvQVotes.Columns.RemoveAt(1);
            }
            else if ((i == gvQVotes.Rows.Count - 1 && i != 0 && gvQVotes.PageIndex == gvQVotes.PageCount - 1) || (i == 0 && gvQVotes.Rows.Count == 1))
            {
                gvQVotes.Rows[i].Cells[1].Text = "<a href='Default.aspx?ctl=QVotes&fID=" + iQVoteID + "&udID=" + iUp + getURL() + "'><img src='Images/up.gif' border='0' /></a>";
            }
            else
            {
                gvQVotes.Rows[i].Cells[1].Text = "<a href='Default.aspx?ctl=QVotes&fID=" + iQVoteID + "&udID=" + iDown + getURL() + "'><img src='Images/down.gif' border='0' /></a> <a href='Default.aspx?ctl=QVotes&fID=" + iQVoteID + "&udID=" + iUp + getURL() + "'><img src='Images/up.gif' border='0' /></a>";
            }
        }
    }

    protected void ddlLang_SelectedIndexChanged(object sender, EventArgs e)
    {
       
    }
}
