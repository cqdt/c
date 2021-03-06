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

public partial class Admin_Modules_ToQuote : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("ToQuotes", CMS.TTV.Rules.ONE))
        {
            CMS.Utility.HtmlHelper.Alert("Bạn không có quyền truy cập phần này", this.Page);
            CMS.Utility.HtmlHelper.Back(-1, this.Page);
            return;
        }

        if (!Page.IsPostBack)
        {
            if (Request.QueryString["fID"] != null)
            {
                dvToQuote.ChangeMode(DetailsViewMode.Edit);
                dvToQuote.HeaderText = "Sửa báo giá";
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
                        DropDownList ddlLang = dvToQuote.FindControl("ddlLang") as DropDownList;
                        ddlLang.SelectedValue = iLangID + "";
                    }
                    catch { }
                }
            }
        }
    }
    protected void dvToQuote_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
        {
            string url = "Default.aspx?ctl=ToQuotes";
            if (Request.QueryString["Page"] != null) url += "&Page=" + Request.QueryString["Page"];
            if (Request.QueryString["LangID"] != null) url += "&LangID=" + Request.QueryString["LangID"];
            Response.Redirect(url);
        }
        else if (e.CommandName == "Insert") dvToQuote.HeaderText = "Thêm mới báo giá";
        else if (e.CommandName == "Edit") dvToQuote.HeaderText = "Sửa báo giá";
    }

    protected void dvToQuote_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        string url = "Default.aspx?ctl=ToQuotes&mess=Bạn đã thêm mới thành công";
        if (Request.QueryString["Page"] != null) url += "&Page=" + Request.QueryString["Page"];
        if (Request.QueryString["LangID"] != null) url += "&LangID=" + Request.QueryString["LangID"];
        Response.Redirect(url);
    }

    protected void dvToQuote_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("ToQuotes", CMS.TTV.Rules.EDIT))
        {
            CMS.Utility.HtmlHelper.Alert("Bạn không có quyền thêm mới báo giá", this.Page);
            e.Cancel = true;
        }

        int iLangID = CMS.Utils.ToInteger(e.Values["FK_LANG"]);
        int iMaxOrder = CMS.MsSql.ExecuteScalarToInt("SELECT MAX(C_ORDER) FROM T_TOQUOTE WHERE FK_LANG=" + iLangID);
        if (iMaxOrder == -1) iMaxOrder = iMaxOrder + 2;
        else iMaxOrder = iMaxOrder + 1;
        ToQuoteDataSource.InsertParameters["C_ORDER"].DefaultValue = iMaxOrder + "";
    }

    protected void dvToQuote_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        string url = "Default.aspx?ctl=ToQuotes&mess=Bạn đã sửa thành công";
        if (Request.QueryString["Page"] != null) url += "&Page=" + Request.QueryString["Page"];
        if (Request.QueryString["LangID"] != null) url += "&LangID=" + Request.QueryString["LangID"];
        Response.Redirect(url);
    }

    protected void dvToQuote_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("ToQuotes", CMS.TTV.Rules.APPROVE))
        {
            CMS.Utility.HtmlHelper.Alert("Bạn không có quyền sửa báo giá", this.Page);
            e.Cancel = true;
        }
    }

    protected void dvToQuote_PreRender(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (dvToQuote.CurrentMode == DetailsViewMode.Edit)
            {
                CMS.Web.Controls.Label lblLang = dvToQuote.FindControl("lblLang") as CMS.Web.Controls.Label;
                int iFaqID = CMS.Utils.ToInteger(Request.QueryString["fID"]);
                string sql = "SELECT FK_LANG FROM T_TOQUOTE WHERE PK_TOQUOTE=" + iFaqID;
                int iLangID = CMS.SqlCache.ExecuteToInt(sql);
                lblLang.PkVColumn = iLangID + "";
            }
        }
    }


}
