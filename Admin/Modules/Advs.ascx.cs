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

public partial class Admin_Modules_Advs : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("Advs", CMS.TTV.Rules.ONE))
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
            if (iPage > 0) gvAdvs.PageIndex = iPage;
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
                if (CMS.TTV.Rule.IsModuleRule("Advs", CMS.TTV.Rules.APPROVE))
                {
                    int iAdvID = CMS.Utils.ToInteger(Request.QueryString["fID"]);
                    DataTable dtAdvs = CMS.MsSql.FillDataTable("SELECT PK_ADV,C_ORDER FROM T_ADV WHERE FK_LANG=(SELECT a.FK_LANG FROM T_ADV AS a WHERE a.PK_ADV=" + iAdvID + ")");
                    DataRow[] dr;
                    int iADVOrderID = 0;
                    int iAdvIDOrder = 0;
                    dr = dtAdvs.Select("C_ORDER = " + iOrder);
                    if (dr.Length > 0) iADVOrderID = CMS.Utils.ToInteger(dr[0]["PK_ADV"]);
                    dr = dtAdvs.Select("PK_ADV = " + iAdvID);
                    if (dr.Length > 0) iAdvIDOrder = CMS.Utils.ToInteger(dr[0]["C_ORDER"]);
                    string sql = "UPDATE T_ADV SET C_ORDER=" + iOrder + " WHERE PK_ADV=" + iAdvID;
                    sql += "; UPDATE T_ADV SET C_ORDER=" + iAdvIDOrder + " WHERE PK_ADV=" + iADVOrderID;
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
        string url = "Default.aspx?ctl=Adv";
        if (gvAdvs.PageIndex > 0) url += "&Page=" + gvAdvs.PageIndex;
        url += "&LangID=" + ddlLang.SelectedValue;
        Response.Redirect(url);
    }

    private void SetAdvs(string sql, string mess)
    {
        string[] arrID = Request.Form.GetValues("chkAdvs");
        if (arrID != null)
        {
            string strIDs = String.Join(",", arrID);
            if (!CMS.TTV.Rule.IsModuleRule("Advs", CMS.TTV.Rules.APPROVE))
            {
                lblAlert.Text = "Bạn không có quyền " + mess;
                return;
            }
            string strSql = sql + " WHERE PK_ADV IN (" + strIDs + ")";
            CMS.MsSql.ExecuteNonQuery(strSql);
            gvAdvs.DataBind();
            lblAlert.Text = "Đã " + mess + " thành công";
        }
        else lblAlert.Text = "Bạn chưa chọn quảng cáo cần " + mess;
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        SetAdvs("DELETE FROM T_ADV", "xóa");
    }

    protected void btnSetStatus_Click(object sender, EventArgs e)
    {
        SetAdvs("UPDATE T_ADV SET C_STATUS=1", "hiển thị");
    }

    protected void btnUnSetStatus_Click(object sender, EventArgs e)
    {
        SetAdvs("UPDATE T_ADV SET C_STATUS=0", "bỏ hiển thị");
    }

    string getURL()
    {
        string url = "";
        if (gvAdvs.PageIndex > 0) url += "&Page=" + gvAdvs.PageIndex;
        url += "&LangID=" + ddlLang.SelectedValue;
        return url;
    }

    protected void gvAdvs_PreRender(object sender, EventArgs e)
    {
        int iLangID = CMS.Utils.ToInteger(ddlLang.SelectedValue);
        DataTable dtAdvs = CMS.MsSql.FillDataTable("SELECT PK_ADV,C_ORDER FROM T_ADV WHERE FK_LANG=" + iLangID);
        DataRow[] dr;
        int iAdvID = 0;
        int iUp = 0;
        int iDown = 0;
        int iOrder = 0;
        for (int i = 0; i < gvAdvs.Rows.Count; i++)
        {
            iAdvID = CMS.Utils.ToInteger(gvAdvs.DataKeys[i].Value);
            dr = dtAdvs.Select("PK_ADV = " + iAdvID);
            if (dr.Length > 0) iOrder = CMS.Utils.ToInteger(dr[0]["C_ORDER"]);
            dr = dtAdvs.Select("C_ORDER > " + iOrder);
            if (dr.Length > 0) iUp = CMS.Utils.ToInteger(dr[0]["C_ORDER"]);
            dr = dtAdvs.Select("C_ORDER < " + iOrder);
            if (dr.Length > 0) iDown = CMS.Utils.ToInteger(dr[dr.Length - 1]["C_ORDER"]);
            if (i == 0 && gvAdvs.PageIndex == 0)
            {
                if (gvAdvs.Rows.Count > 1) gvAdvs.Rows[0].Cells[1].Text = "<a href='Default.aspx?ctl=Advs&fID=" + iAdvID + "&udID=" + iDown + getURL() + "'><img src='Images/down.gif' border='0' /></a>";
                // else gvAdvs.Columns.RemoveAt(1);
            }
            else if ((i == gvAdvs.Rows.Count - 1 && i != 0 && gvAdvs.PageIndex == gvAdvs.PageCount - 1) || (i == 0 && gvAdvs.Rows.Count == 1))
            {
                gvAdvs.Rows[i].Cells[1].Text = "<a href='Default.aspx?ctl=Advs&fID=" + iAdvID + "&udID=" + iUp + getURL() + "'><img src='Images/up.gif' border='0' /></a>";
            }
            else
            {
                gvAdvs.Rows[i].Cells[1].Text = "<a href='Default.aspx?ctl=Advs&fID=" + iAdvID + "&udID=" + iDown + getURL() + "'><img src='Images/down.gif' border='0' /></a> <a href='Default.aspx?ctl=Advs&fID=" + iAdvID + "&udID=" + iUp + getURL() + "'><img src='Images/up.gif' border='0' /></a>";
            }
        }
    }

}
