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

public partial class Modules_Base_POST_FAQ : System.Web.UI.UserControl
{
    public int FK_MENU;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void dvPOST_FAQ_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
        {
            Response.Redirect("Default.aspx");
        }
    }

    protected void dvPOST_FAQ_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        int iLangID = CMS.Lang.LangValue;
        int iMaxOrder = CMS.MsSql.ExecuteScalarToInt("SELECT MAX(C_ORDER) FROM T_FAQ WHERE FK_LANG=" + iLangID);
        if (iMaxOrder == -1) iMaxOrder = iMaxOrder + 2;
        else iMaxOrder = iMaxOrder + 1;
        POST_FAQDataSource.InsertParameters["FK_LANG"].DefaultValue = iLangID + "";
        POST_FAQDataSource.InsertParameters["C_ORDER"].DefaultValue = iMaxOrder + "";
        POST_FAQDataSource.InsertParameters["FK_MENU"].DefaultValue = FK_MENU + "";
    }

    protected void dvPOST_FAQ_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        //CMS.Utility.HtmlHelper.Alert(CMS.Lang.GetKey("POST_FAQ.ascx", "Thank"),this.Page);
        PnThank.Visible = true;
        pnPost.Visible = false;
    }

    protected void dvPOST_FAQ_PreRender(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (dvPOST_FAQ.CurrentMode == DetailsViewMode.Insert)
            {
                DropDownList ddlMenus = dvPOST_FAQ.FindControl("ddlMenus") as DropDownList;
                FK_MENU = CMS.Utils.ToInteger(ddlMenus.SelectedValue);
            }
        }
    }
}
