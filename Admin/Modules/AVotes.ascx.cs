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

public partial class Admin_Modules_AVotes : System.Web.UI.UserControl
{
    public int ParentID = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("QVotes", CMS.TTV.Rules.ONE))
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

            int iOrder = CMS.Utils.ToInteger(Request.QueryString["udID"]);
            if (iOrder > 0)
            {
                if (CMS.TTV.Rule.IsModuleRule("QVotes", CMS.TTV.Rules.APPROVE))
                {
                    int iAVoteID = CMS.Utils.ToInteger(Request.QueryString["fID"]);
                    DataTable dtAVotes = CMS.MsSql.FillDataTable("SELECT PK_AVOTE,C_ORDER FROM T_AVOTE WHERE FK_QVOTE=(SELECT a.FK_QVOTE FROM T_AVOTE AS a WHERE a.PK_AVOTE=" + iAVoteID + ")");
                    DataRow[] dr;
                    int iAVOTEOrderID = 0;
                    int iAVoteIDOrder = 0;
                    dr = dtAVotes.Select("C_ORDER = " + iOrder);
                    if (dr.Length > 0) iAVOTEOrderID = CMS.Utils.ToInteger(dr[0]["PK_AVOTE"]);
                    dr = dtAVotes.Select("PK_AVOTE = " + iAVoteID);
                    if (dr.Length > 0) iAVoteIDOrder = CMS.Utils.ToInteger(dr[0]["C_ORDER"]);
                    string sql = "UPDATE T_AVOTE SET C_ORDER=" + iOrder + " WHERE PK_AVOTE=" + iAVoteID;
                    sql += "; UPDATE T_AVOTE SET C_ORDER=" + iAVoteIDOrder + " WHERE PK_AVOTE=" + iAVOTEOrderID;
                    //Response.Write(sql);
                    CMS.MsSql.ExecuteNonQuery(sql);
                }
                else
                {
                    lblAlert.Text = "Bạn không có quyền di chuyển";
                }
            }
        }

        ParentID = CMS.Utils.ToInteger(Request.QueryString["pID"]);
    }

    protected void btnInsert_Click(object sender, EventArgs e)
    {
        string url = "Default.aspx?ctl=AVote";
        if (gvAVotes.PageIndex > 0) url += "&Page=" + gvAVotes.PageIndex;
        if (Request.QueryString["pID"] != null) url += "&pID=" + Request.QueryString["pID"];
        Response.Redirect(url);
    }

    private void SetAVotes(string sql, string mess)
    {
        string[] arrID = Request.Form.GetValues("chkAVotes");
        if (arrID != null)
        {
            string strIDs = String.Join(",", arrID);
            if (!CMS.TTV.Rule.IsModuleRule("QVotes", CMS.TTV.Rules.APPROVE))
            {
                lblAlert.Text = "Bạn không có quyền " + mess;
                return;
            }
            string strSql = sql + " WHERE PK_AVOTE IN (" + strIDs + ")";
            CMS.MsSql.ExecuteNonQuery(strSql);
            gvAVotes.DataBind();
            lblAlert.Text = "Đã " + mess + " thành công";
        }
        else lblAlert.Text = "Bạn chưa chọn câu trả lời cần " + mess;
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        SetAVotes("DELETE FROM T_AVOTE", "xóa");
    }

    protected void btnSetStatus_Click(object sender, EventArgs e)
    {
        SetAVotes("UPDATE T_AVOTE SET C_STATUS=1", "hiển thị");
    }

    protected void btnUnSetStatus_Click(object sender, EventArgs e)
    {
        SetAVotes("UPDATE T_AVOTE SET C_STATUS=0", "bỏ hiển thị");
    }

    string getURL()
    {
        string url = "";
        if (gvAVotes.PageIndex > 0) url += "&Page=" + gvAVotes.PageIndex;
        if (Request.QueryString["pID"] != null) url += "&pID=" + Request.QueryString["pID"];
        return url;
    }

    protected void gvAVotes_PreRender(object sender, EventArgs e)
    {
        int iQVoteID = CMS.Utils.ToInteger(Request.QueryString["pID"]);
        DataTable dtAVotes = CMS.MsSql.FillDataTable("SELECT PK_AVOTE,C_ORDER FROM T_AVOTE WHERE FK_QVOTE=" + iQVoteID);
        DataRow[] dr;
        int iAVoteID = 0;
        int iUp = 0;
        int iDown = 0;
        int iOrder = 0;
        for (int i = 0; i < gvAVotes.Rows.Count; i++)
        {
            iAVoteID = CMS.Utils.ToInteger(gvAVotes.DataKeys[i].Value);
            dr = dtAVotes.Select("PK_AVOTE = " + iAVoteID);
            if (dr.Length > 0) iOrder = CMS.Utils.ToInteger(dr[0]["C_ORDER"]);
            dr = dtAVotes.Select("C_ORDER > " + iOrder);
            if (dr.Length > 0) iUp = CMS.Utils.ToInteger(dr[0]["C_ORDER"]);
            dr = dtAVotes.Select("C_ORDER < " + iOrder);
            if (dr.Length > 0) iDown = CMS.Utils.ToInteger(dr[dr.Length - 1]["C_ORDER"]);
            if (i == 0 && gvAVotes.PageIndex == 0)
            {
                if (gvAVotes.Rows.Count > 1) gvAVotes.Rows[0].Cells[1].Text = "<a href='Default.aspx?ctl=AVotes&fID=" + iAVoteID + "&udID=" + iDown + getURL() + "'><img src='Images/down.gif' border='0' /></a>";
                // else gvAVotes.Columns.RemoveAt(1);
            }
            else if ((i == gvAVotes.Rows.Count - 1 && i != 0 && gvAVotes.PageIndex == gvAVotes.PageCount - 1) || (i == 0 && gvAVotes.Rows.Count == 1))
            {
                gvAVotes.Rows[i].Cells[1].Text = "<a href='Default.aspx?ctl=AVotes&fID=" + iAVoteID + "&udID=" + iUp + getURL() + "'><img src='Images/up.gif' border='0' /></a>";
            }
            else
            {
                gvAVotes.Rows[i].Cells[1].Text = "<a href='Default.aspx?ctl=AVotes&fID=" + iAVoteID + "&udID=" + iDown + getURL() + "'><img src='Images/down.gif' border='0' /></a> <a href='Default.aspx?ctl=AVotes&fID=" + iAVoteID + "&udID=" + iUp + getURL() + "'><img src='Images/up.gif' border='0' /></a>";
            }
        }
    }

}
