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

public partial class Admin_Modules_Link : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("Links", CMS.TTV.Rules.ONE))
        {
            CMS.Utility.HtmlHelper.Alert("Bạn không có quyền truy cập phần này", this.Page);
            CMS.Utility.HtmlHelper.Back(-1, this.Page);
            return;
        }

        if (!Page.IsPostBack)
        {
            if (Request.QueryString["lID"] != null)
            {
                dvLink.ChangeMode(DetailsViewMode.Edit);
                dvLink.HeaderText = "Sửa liên kết";
            }
        }
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["lID"] == null)
            {
                int iLangID = CMS.Utils.ToInteger(Request.QueryString["LangID"]);
                if (iLangID > 0)
                {
                    try
                    {
                        DropDownList ddlLang = dvLink.FindControl("ddlLang") as DropDownList;
                        ddlLang.SelectedValue = iLangID + "";
                    }
                    catch { }
                }
            }
        }
    }

    protected void dvLink_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
        {
            string url = "Default.aspx?ctl=Links";
            if (Request.QueryString["Page"] != null) url += "&Page=" + Request.QueryString["Page"];
            if (Request.QueryString["LangID"] != null) url += "&LangID=" + Request.QueryString["LangID"];
            Response.Redirect(url);
        }
        else if (e.CommandName == "Insert") dvLink.HeaderText = "Thêm mới liên kết";
        else if (e.CommandName == "Edit") dvLink.HeaderText = "Sửa liên kết";
    }

    protected void dvLink_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        string url = "Default.aspx?ctl=Links&mess=Bạn đã thêm mới thành công";
        if (Request.QueryString["Page"] != null) url += "&Page=" + Request.QueryString["Page"];
        if (Request.QueryString["LangID"] != null) url += "&LangID=" + Request.QueryString["LangID"];
        Response.Redirect(url);
    }

    protected void dvLink_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("Links", CMS.TTV.Rules.EDIT))
        {
            CMS.Utility.HtmlHelper.Alert("Bạn không có quyền thêm mới liên kết", this.Page);
            e.Cancel = true;
        }
        int iLangID = CMS.Utils.ToInteger(e.Values["FK_LANG"]);
        int iMaxOrder = CMS.MsSql.ExecuteScalarToInt("SELECT MAX(C_ORDER) FROM T_LINK WHERE FK_LANG=" + iLangID);
        if (iMaxOrder == -1) iMaxOrder = iMaxOrder + 2;
        else iMaxOrder = iMaxOrder + 1;
        LinkDataSource.InsertParameters["C_ORDER"].DefaultValue = iMaxOrder + "";
    }

    protected void dvLink_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        string url = "Default.aspx?ctl=Links&mess=Bạn đã sửa thành công";
        if (Request.QueryString["Page"] != null) url += "&Page=" + Request.QueryString["Page"];
        if (Request.QueryString["LangID"] != null) url += "&LangID=" + Request.QueryString["LangID"];
        Response.Redirect(url);
    }

    protected void dvLink_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("Links", CMS.TTV.Rules.APPROVE))
        {
            CMS.Utility.HtmlHelper.Alert("Bạn không có quyền sửa liên kết", this.Page);
            e.Cancel = true;
        }

        if (e.NewValues["FK_LANG"].ToString() != e.OldValues["FK_LANG"].ToString())
        {
            int iLangID = CMS.Utils.ToInteger(e.NewValues["FK_LANG"]);
            int iMaxOrder = CMS.MsSql.ExecuteScalarToInt("SELECT MAX(C_ORDER) FROM T_LINK WHERE FK_LANG=" + iLangID);
            if (iMaxOrder == -1) iMaxOrder = iMaxOrder + 2;
            else iMaxOrder = iMaxOrder + 1;
            LinkDataSource.UpdateParameters["C_ORDER"].DefaultValue = iMaxOrder + "";
        }

    }

}
