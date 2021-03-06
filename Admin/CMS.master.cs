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

public partial class Admin_CMS : System.Web.UI.MasterPage
{
    string strModule = "Home";
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!CMS.TTV.Rule.IsLogin())
        //{
        //    Response.Redirect("Login.aspx");
        //    return;
        //}

        if (Request.QueryString["ctl"] != null)
        {
            strModule = Request.QueryString["ctl"];
        }

        string[] strArr = new string[] { "Home", "Articles", "Article", "Logout", "GImage", "Image", "FeedBack", "Menu", "User", "Adv", "Link", "Banner", "Product", "QVote", "AVotes", "AVote", "Order", "ToQuote" };

        if (Array.IndexOf(strArr, strModule) == -1)
        {
            //if (!CMS.TTV.Rule.IsModuleRule(strModule, CMS.TTV.Rules.ONE))
            //{
            //    CMS.Utility.HtmlHelper.Alert("Bạn không có quyền truy cập phần này", this.Page);
            //    CMS.Utility.HtmlHelper.Back(-1, this.Page);
            //    strModule = "Home";
            //}
        }

        LoadModulesControl();
    }

    private void LoadModulesControl()
    {
        string path = "Modules/" + strModule + ".ascx";
        try
        {
            if (System.IO.File.Exists(Request.PhysicalApplicationPath + "/Admin/" + path)) this.cphCMS.Controls.Add(LoadControl(path));
        }
        catch (Exception ex)
        {
            if (Request.IsLocal || CMS.Setting.GetBoolSetting("Debug"))
            {
                Response.Write(ex.Message + ex.Source + ex.TargetSite);
            }
            else Response.Redirect("~/");
        }
    }
}
