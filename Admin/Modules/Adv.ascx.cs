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

public partial class Admin_Modules_Adv : System.Web.UI.UserControl
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
            if (Request.QueryString["fID"] != null)
            {
                dvAdv.ChangeMode(DetailsViewMode.Edit);
                dvAdv.HeaderText = "Sửa quảng cáo";
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
                        DropDownList ddlLang = dvAdv.FindControl("ddlLang") as DropDownList;
                        ddlLang.SelectedValue = iLangID + "";
                    }
                    catch { }
                }
            }
        }
    }
    protected void dvAdv_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
        {
            string url = "Default.aspx?ctl=Advs";
            if (Request.QueryString["Page"] != null) url += "&Page=" + Request.QueryString["Page"];
            if (Request.QueryString["LangID"] != null) url += "&LangID=" + Request.QueryString["LangID"];
            Response.Redirect(url);
        }
        else if (e.CommandName == "Insert") dvAdv.HeaderText = "Thêm mới quảng cáo";
        else if (e.CommandName == "Edit") dvAdv.HeaderText = "Sửa quảng cáo";
    }

    protected void dvAdv_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        string url = "Default.aspx?ctl=Advs&mess=Bạn đã thêm mới thành công";
        if (Request.QueryString["Page"] != null) url += "&Page=" + Request.QueryString["Page"];
        if (Request.QueryString["LangID"] != null) url += "&LangID=" + Request.QueryString["LangID"];
        Response.Redirect(url);
    }

    protected void dvAdv_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("Advs", CMS.TTV.Rules.EDIT))
        {
            CMS.Utility.HtmlHelper.Alert("Bạn không có quyền thêm mới quảng cáo", this.Page);
            e.Cancel = true;
        }

        int iLangID = CMS.Utils.ToInteger(e.Values["FK_LANG"]);
        int iMaxOrder = CMS.MsSql.ExecuteScalarToInt("SELECT MAX(C_ORDER) FROM T_ADV WHERE FK_LANG=" + iLangID);
        if (iMaxOrder == -1) iMaxOrder = iMaxOrder + 2;
        else iMaxOrder = iMaxOrder + 1;
        AdvDataSource.InsertParameters["C_ORDER"].DefaultValue = iMaxOrder + "";
    }

    protected void dvAdv_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        string url = "Default.aspx?ctl=Advs&mess=Bạn đã sửa thành công";
        if (Request.QueryString["Page"] != null) url += "&Page=" + Request.QueryString["Page"];
        if (Request.QueryString["LangID"] != null) url += "&LangID=" + Request.QueryString["LangID"];
        Response.Redirect(url);
    }

    protected void dvAdv_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("Advs", CMS.TTV.Rules.APPROVE))
        {
            CMS.Utility.HtmlHelper.Alert("Bạn không có quyền sửa quảng cáo", this.Page);
            e.Cancel = true;
        }
    }

    protected void dvAdv_PreRender(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (dvAdv.CurrentMode == DetailsViewMode.Edit)
            {
                CMS.Web.Controls.Label lblLang = dvAdv.FindControl("lblLang") as CMS.Web.Controls.Label;
                int iFaqID = CMS.Utils.ToInteger(Request.QueryString["fID"]);
                string sql = "SELECT FK_LANG FROM T_ADV WHERE PK_ADV=" + iFaqID;
                int iLangID = CMS.SqlCache.ExecuteToInt(sql);
                lblLang.PkVColumn = iLangID + "";
            }
        }
    }


}
