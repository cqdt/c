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

public partial class Modules_BDS_Top1NewsArtiles : System.Web.UI.UserControl
{
    private string _Type = "";
    public string Type
    {
        set { _Type = value; }
        get { return _Type; }
    }


    private int _MenuID = -1;
    public int MenuID
    {
        set { _MenuID = value; }
        get { return _MenuID; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        Top1News1.MenuID = _MenuID;
        BArticles1.MenuID = _MenuID;
        Top1News1.Binddata();
        BArticles1.ArticleOrtherID = Top1News1.ArticleID;
    }
}
