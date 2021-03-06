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

public partial class Admin_Modules_FAQ : System.Web.UI.UserControl
{
    public int FK_MENU;
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
            if (Request.QueryString["fID"] != null)
            {
                dvFAQ.ChangeMode(DetailsViewMode.Edit);
                dvFAQ.HeaderText = "Sửa câu hỏi";
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
                        DropDownList ddlLang = dvFAQ.FindControl("ddlLang") as DropDownList;
                        ddlLang.SelectedValue = iLangID + "";
                    }
                    catch { }
                }
                string itype = CMS.Utils.ToString(Request.QueryString["type"]);
                if (itype != "")
                {
                    try
                    {
                        DropDownList ddlType = dvFAQ.FindControl("ddlType") as DropDownList;
                        ddlType.SelectedValue = itype + "";
                    }
                    catch { }
                }

                DropDownList ddlMenus = dvFAQ.FindControl("ddlMenus") as DropDownList;
                FK_MENU = CMS.Utils.ToInteger(ddlMenus.SelectedValue);  
            }
           
        }
    }

    //public void CheckTitle(object sender, ServerValidateEventArgs args)
    //{
    //    DropDownList ddlLang = dvFAQ.FindControl("ddlLang") as DropDownList;
    //    int iLangID = CMS.Utils.ToInteger(ddlLang.SelectedValue);

    //    string strName = args.Value;
    //    if (dvFAQ.CurrentMode == DetailsViewMode.Edit)
    //    {
    //        int iFAQID = CMS.Utils.ToInteger(dvFAQ.DataKey.Value);
    //        args.IsValid = CMS.MsSql.ExecuteScalarToInt("SELECT COUNT(PK_FAQ) FROM T_FAQ WHERE C_TITLE =N'" + strName + "' AND PK_FAQ !=" + iFAQID + " AND FK_LANG=" + iLangID) > 0 ? false : true;
    //    }
    //    else args.IsValid = CMS.MsSql.ExecuteScalarToInt("SELECT COUNT(PK_FAQ) FROM T_FAQ WHERE C_TITLE =N'" + strName + "' AND FK_LANG=" + iLangID) > 0 ? false : true;
    //}

    protected void dvFAQ_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
        {
            string url = "Default.aspx?ctl=FAQs";
            if (Request.QueryString["Page"] != null) url += "&Page=" + Request.QueryString["Page"];
            if (Request.QueryString["LangID"] != null) url += "&LangID=" + Request.QueryString["LangID"];
            if (Request.QueryString["type"] != null) url += "&type=" + Request.QueryString["type"];
            Response.Redirect(url);
        }
        else if (e.CommandName == "Insert") dvFAQ.HeaderText = "Thêm mới câu hỏi";
        else if (e.CommandName == "Edit") dvFAQ.HeaderText = "Sửa câu hỏi";
    }

    protected void dvFAQ_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        string url = "Default.aspx?ctl=FAQs&mess=Bạn đã thêm mới thành công";
        if (Request.QueryString["Page"] != null) url += "&Page=" + Request.QueryString["Page"];
        if (Request.QueryString["LangID"] != null) url += "&LangID=" + Request.QueryString["LangID"];
        if (Request.QueryString["type"] != null) url += "&type=" + Request.QueryString["type"];
        Response.Redirect(url);
    }

    protected void dvFAQ_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("FAQs", CMS.TTV.Rules.EDIT))
        {
            CMS.Utility.HtmlHelper.Alert("Bạn không có quyền thêm mới câu hỏi", this.Page);
            e.Cancel = true;
        }

        int iLangID = CMS.Utils.ToInteger(e.Values["FK_LANG"]);
        int iMaxOrder = CMS.MsSql.ExecuteScalarToInt("SELECT MAX(C_ORDER) FROM T_FAQ WHERE FK_LANG=" + iLangID);
        if (iMaxOrder == -1) iMaxOrder = iMaxOrder + 2;
        else iMaxOrder = iMaxOrder + 1;
        FAQDataSource.InsertParameters["C_ORDER"].DefaultValue = iMaxOrder + "";
        FAQDataSource.InsertParameters["FK_MENU"].DefaultValue = FK_MENU + "";
    }

    protected void dvFAQ_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        string url = "Default.aspx?ctl=FAQs&mess=Bạn đã sửa thành công";
        if (Request.QueryString["Page"] != null) url += "&Page=" + Request.QueryString["Page"];
        if (Request.QueryString["LangID"] != null) url += "&LangID=" + Request.QueryString["LangID"];
        if (Request.QueryString["type"] != null) url += "&type=" + Request.QueryString["type"];
        Response.Redirect(url);
    }

    protected void dvFAQ_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("FAQs", CMS.TTV.Rules.APPROVE))
        {
            CMS.Utility.HtmlHelper.Alert("Bạn không có quyền sửa câu hỏi", this.Page);
            e.Cancel = true;
        }

        if (e.NewValues["FK_LANG"].ToString() != e.OldValues["FK_LANG"].ToString())
        {
            int iLangID = CMS.Utils.ToInteger(e.NewValues["FK_LANG"]);
            int iMaxOrder = CMS.MsSql.ExecuteScalarToInt("SELECT MAX(C_ORDER) FROM T_FAQ WHERE FK_LANG=" + iLangID);
            if (iMaxOrder == -1) iMaxOrder = iMaxOrder + 2;
            else iMaxOrder = iMaxOrder + 1;
            FAQDataSource.UpdateParameters["C_ORDER"].DefaultValue = iMaxOrder + "";

        }
        FAQDataSource.UpdateParameters["FK_MENU"].DefaultValue = FK_MENU + "";

    }

    protected void dvFAQ_PreRender(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {            
                          
        }
    }
}
