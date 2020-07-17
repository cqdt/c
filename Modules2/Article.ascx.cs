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

public partial class Modules_Article : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Newwind.VQS vs = new Newwind.VQS();
        int CateID = vs.GetInt(0);

        int ArticleID;
        ArticleID = CMS.SqlCache.ExecuteToInt("SELECT TOP 1 PK_ARTICLE FROM T_ARTICLE WHERE FK_MENU=" + CateID + " AND C_STATUS=1");
        Article1.ArticleID = ArticleID;  
    }
}
