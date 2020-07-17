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

public partial class Modules_Introduce : System.Web.UI.UserControl
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        int iMenuID = CMS.Utils.ToInteger(Request.QueryString["mID"]);
        DataTable dtMenus = CMS.SqlCache.FillDataTable("SELECT * FROM T_MENU WHERE C_STATUS=1 AND C_PARENT=" + iMenuID);
        if (dtMenus != null && dtMenus.Rows.Count > 0)
        {
            pnParent.Visible = true;
            pnMenu.Visible = false;
            Articles1.MenuID = iMenuID;
            Articles1.Binddata();
            BArticles1.MenuID = iMenuID;
            BArticles1.ArticleID = Articles1.ArticleID;
        }
        else
        {
            pnParent.Visible = false;
            pnMenu.Visible = true;
            int ArticleID;                     
            ArticleID = CMS.SqlCache.ExecuteToInt("SELECT TOP 1 PK_ARTICLE FROM T_ARTICLE WHERE FK_MENU=" + iMenuID + " AND C_STATUS=1");
            Article1.ArticleID = ArticleID;  
        }   
                      
    }
    protected void Articles1_PageIndexChange(int index)
    {
        BArticles1.ArticleID = index;
        BArticles1.Binddata();
    }
}
