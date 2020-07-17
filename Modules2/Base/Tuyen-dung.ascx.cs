using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;


public partial class Modules_Base_Tuyen_dung : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void raddHannophs_Load(object sender, EventArgs e)
    {
        Telerik.WebControls.RadDatePicker raddHannophs = (Telerik.WebControls.RadDatePicker)sender;
        raddHannophs.SelectedDate = System.DateTime.Now;
    }
    protected void dvPOST_TD_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
        {
            Response.Redirect("Default.aspx");
        }
    }

    protected void dvPOST_TD_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        //int iLangID = CMS.Lang.LangValue;
        //int iMaxOrder = CMS.MsSql.ExecuteScalarToInt("SELECT MAX(C_ORDER) FROM T_FAQ WHERE FK_LANG=" + iLangID);
        //if (iMaxOrder == -1) iMaxOrder = iMaxOrder + 2;
        //else iMaxOrder = iMaxOrder + 1;
        //POST_FAQDataSource.InsertParameters["FK_LANG"].DefaultValue = iLangID + "";
        //POST_FAQDataSource.InsertParameters["C_ORDER"].DefaultValue = iMaxOrder + "";
        //POST_FAQDataSource.InsertParameters["FK_MENU"].DefaultValue = FK_MENU + "";
    }

    protected void dvPOST_TD_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        //CMS.Utility.HtmlHelper.Alert(CMS.Lang.GetKey("POST_FAQ.ascx", "Thank"), this.Page);
        PnThank.Visible = true;
        pnRegister.Visible = false;
    }

    protected void dvPOST_TD_PreRender(object sender, EventArgs e)
    {
        //if (!Page.IsPostBack)
        //{
        //    if (dvPOST_FAQ.CurrentMode == DetailsViewMode.Insert)
        //    {
        //        DropDownList ddlMenus = dvPOST_FAQ.FindControl("ddlMenus") as DropDownList;
        //        FK_MENU = CMS.Utils.ToInteger(ddlMenus.SelectedValue);
        //    }
        //}
    }
}
