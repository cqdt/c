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

public partial class _Default : System.Web.UI.Page
{
    public int CountVisit = 0;    

    //protected override void InitializeCulture()
    //{
    //    base.InitializeCulture();
    //    Page.Culture = CMS.Lang.LangID;
    //    Page.UICulture = CMS.Lang.LangID;
    //}

    protected void Page_PreInit(object sender, EventArgs e)
    {

        string control = Newwind.VQS.Control;
       
            if (isMobileBrowser() == true)
            {
                this.MasterPageFile = "~/mobile.master";
            }
            else
            {
                if (control == "detail" || control == "tin-tuc" || control == "business-info" || control == "phien-giao-dich-viec-lam" || control == "nld-sua-thong-tin" || control == "edit-business-info" || control == "timviec" || control == "dang-ky-thong-tin-tim-viec" || control == "timviec" || control == "findworker" || control == "register-business-info" || control == "nld-dang-ky-tim-viec" || control == "searching-worker")
                {
                    this.MasterPageFile = "~/toantrang1.master";
                }
                else
                {
                    this.MasterPageFile = "~/Site.master";
                }
                
                
            }

       
        

       
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["Count"] == null)
        //{
        //    CountVisit = CMS.MsSql.ExecuteToInt("SELECT [C_VALUE] FROM [T_SETTING] WHERE [C_CODE]='VISIT'");           
        //    CountVisit = CountVisit + 1;
        //    CMS.MsSql.ExecuteNonQuery("UPDATE T_SETTING SET C_VALUE=C_VALUE+1 WHERE [C_CODE]='VISIT'");
        //    Session["Count"] = 1;
        //}
    }
    public bool isMobileBrowser()
    {
        string strUserAgent = Request.UserAgent.ToString().ToLower();
        bool MobileDevice = Request.Browser.IsMobileDevice;
        if (Request.Cookies["MobileDevice"] != null)
        {
            if (Request.Cookies["MobileDevice"].Value == "IgnoreMobile")
            {
                MobileDevice = false;
            }
        }
        else
        {
            if (strUserAgent != null)
            {
                if (MobileDevice == true || strUserAgent.Contains("iphone") || strUserAgent.Contains("blackberry") || strUserAgent.Contains("mobile") || strUserAgent.Contains("android") || strUserAgent.Contains("windows ce") || strUserAgent.Contains("opera mini") || strUserAgent.Contains("palm"))
                {
                    MobileDevice = true;
                }
            }
        }
        return MobileDevice;


    }
}
