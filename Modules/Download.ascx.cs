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

public partial class Modules_Download : System.Web.UI.UserControl
{
    public int iMenuID;
    protected void Page_Load(object sender, EventArgs e)
    {
        int iMenuID = CMS.Utils.ToInteger(Request.QueryString["mID"]);
        Articles1.MenuID = iMenuID;
        Articles1.Binddata();
        BArticles1.MenuID = iMenuID;
        BArticles1.ArticleID = Articles1.ArticleID;
    }
    protected void Articles1_PageIndexChange(int index)
    {
        BArticles1.ArticleID = index;
        BArticles1.Binddata();
    }
}
