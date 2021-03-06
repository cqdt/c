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

public partial class Admin_Modules_QVote : System.Web.UI.UserControl
{
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
            if (Request.QueryString["fID"] != null)
            {
                dvQVote.ChangeMode(DetailsViewMode.Edit);
                dvQVote.HeaderText = "Sửa câu hỏi";
            }
        }
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["fID"] == null)
            {
                int iLangID = CMS.Utils.ToInteger(Request.QueryString["LangID"]);
                if (iLangID > 0)
                {
                    try
                    {
                        DropDownList ddlLang = dvQVote.FindControl("ddlLang") as DropDownList;
                        ddlLang.SelectedValue = iLangID + "";
                    }
                    catch { }
                }
            }
        }
    }

    protected void dvQVote_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
        {
            string url = "Default.aspx?ctl=QVotes";
            if (Request.QueryString["Page"] != null) url += "&Page=" + Request.QueryString["Page"];
            if (Request.QueryString["LangID"] != null) url += "&LangID=" + Request.QueryString["LangID"];
            Response.Redirect(url);
        }
        else if (e.CommandName == "Insert") dvQVote.HeaderText = "Thêm mới câu hỏi";
        else if (e.CommandName == "Edit") dvQVote.HeaderText = "Sửa câu hỏi";
    }

    protected void dvQVote_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        string url = "Default.aspx?ctl=QVotes&mess=Bạn đã thêm mới thành công";
        if (Request.QueryString["Page"] != null) url += "&Page=" + Request.QueryString["Page"];
        if (Request.QueryString["LangID"] != null) url += "&LangID=" + Request.QueryString["LangID"];
        Response.Redirect(url);
    }

    protected void dvQVote_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("QVotes", CMS.TTV.Rules.EDIT))
        {
            CMS.Utility.HtmlHelper.Alert("Bạn không có quyền thêm mới câu hỏi", this.Page);
            e.Cancel = true;
        }

        int iLangID = CMS.Utils.ToInteger(e.Values["FK_LANG"]);
        int iMaxOrder = CMS.MsSql.ExecuteScalarToInt("SELECT MAX(C_ORDER) FROM T_QVOTE WHERE FK_LANG=" + iLangID);
        if (iMaxOrder == -1) iMaxOrder = iMaxOrder + 2;
        else iMaxOrder = iMaxOrder + 1;
        QVoteDataSource.InsertParameters["C_ORDER"].DefaultValue = iMaxOrder + "";
    }

    protected void dvQVote_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        string url = "Default.aspx?ctl=QVotes&mess=Bạn đã sửa thành công";
        if (Request.QueryString["Page"] != null) url += "&Page=" + Request.QueryString["Page"];
        if (Request.QueryString["LangID"] != null) url += "&LangID=" + Request.QueryString["LangID"];
        Response.Redirect(url);
    }

    protected void dvQVote_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("QVotes", CMS.TTV.Rules.APPROVE))
        {
            CMS.Utility.HtmlHelper.Alert("Bạn không có quyền sửa câu hỏi", this.Page);
            e.Cancel = true;
        }
    }

    protected void dvQVote_PreRender(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (dvQVote.CurrentMode == DetailsViewMode.Edit)
            {
                CMS.Web.Controls.Label lblLang = dvQVote.FindControl("lblLang") as CMS.Web.Controls.Label;
                int iFaqID = CMS.Utils.ToInteger(Request.QueryString["fID"]);
                string sql = "SELECT FK_LANG FROM T_QVOTE WHERE PK_QVOTE=" + iFaqID;
                int iLangID = CMS.SqlCache.ExecuteToInt(sql);
                lblLang.PkVColumn = iLangID + "";
            }
        }
    }

    protected void raddBegin_date_Load(object sender, EventArgs e)
    {
        Telerik.WebControls.RadDateTimePicker raddBegin = (Telerik.WebControls.RadDateTimePicker)sender;
        raddBegin.SelectedDate = System.DateTime.Now;
    }

    protected void raddEnd_date_Load(object sender, EventArgs e)
    {
        Telerik.WebControls.RadDateTimePicker raddEnd = (Telerik.WebControls.RadDateTimePicker)sender;
        raddEnd.SelectedDate = System.DateTime.Now.AddYears(10);
    }


}
