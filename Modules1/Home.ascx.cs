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

public partial class Modules_Home : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Page.Title = "Trung tâm lao động ngoài nước - Center of Overseas Labor - Colab";
        //BArticles1.MenuID = 356;
        //Top1News1.Binddata();
        //BArticles1.ArticleOrtherID = Top1News1.ArticleID;
        string sqlvideo = "SELECT * FROM T_VIDEO WHERE C_STATUS=1 ORDER BY PK_VIDEO DESC";
        DataTable dtvideo = CMS.MsSql.FillDataTable(sqlvideo);
        this.dlVideo.DataSource = dtvideo;
        this.dlVideo.DataBind();
    }
}
