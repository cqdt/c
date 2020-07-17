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

public partial class Modules_Controls_Lang : System.Web.UI.UserControl
{
    public string GetUrl()
    {
        string url = "Default.aspx";
        //for (int i = 0; i < Request.QueryString.Count; i++)
        //{
        //    if (i == 0) url += "?" + Request.QueryString.GetKey(i) + "=" + Request.QueryString[i];
        //    else url += "&" + Request.QueryString.GetKey(i) + "=" + Request.QueryString[i];
        //}
        return url;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    //protected void btnLang_Click(object sender, ImageClickEventArgs e)
    //{
    //    ImageButton btnLang = (ImageButton)sender;
    //    int iLangID = CMS.Utils.ToInteger(btnLang.CommandArgument);
    //    CMS.Lang.LangValue = iLangID;    
        
    //    Response.Redirect(GetUrl());
    //}

    protected void btnLang5_Click(object sender, EventArgs e)
    {
        int iLangID = CMS.Utils.ToInteger(btnLang5.CommandArgument);
        CMS.Lang.LangValue = iLangID;
        Response.Redirect(GetUrl());
    }
    protected void btnLang1_Click(object sender, EventArgs e)
    {
        int iLangID = CMS.Utils.ToInteger(btnLang1.CommandArgument);
        CMS.Lang.LangValue = iLangID;
        Response.Redirect(GetUrl());
    }
}
