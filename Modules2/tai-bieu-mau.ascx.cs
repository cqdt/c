using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Modules_tai_bieu_mau : System.Web.UI.UserControl
{
    public int iMenuID;
    protected void Page_Load(object sender, EventArgs e)
    {
        Newwind.VQS vs = new Newwind.VQS();
        iMenuID = 320;

        Articles1.MenuID = iMenuID;
        BArticles1.MenuID = iMenuID;
        Articles1.Binddata();
        BArticles1.ArticleID = Articles1.ArticleID;

    }

    protected void Articles1_PageIndexChange(int index)
    {
        BArticles1.ArticleID = index;
        BArticles1.Binddata();
    }
}